# 🤖 06 - Análise da Auditoria do Ubuntu Server com Claude

> **Etapa 05B — Segunda análise com IA**
> **Data da auditoria:** 30/10/2026
> **Fontes analisadas:** `01-analise-diretorio-logs.md`, `02-consulta-registros-ssh.md`, `03-analise-tentativas-acesso-ssh.md`, `README.md` e as três capturas de tela da pasta `Imagens/`.

---

## 1. Como a análise foi feita (limitação da integração)

- A integração **Add from GitHub** foi tentada no Claude, mas não importou o conteúdo dos arquivos. Apenas devolveu o link do repositório.
- O acesso automatizado a páginas do GitHub também falhou (`ROBOTS_DISALLOWED`).
- Como alternativa, o repositório foi baixado em ZIP (*Code → Download ZIP*) e anexado diretamente à conversa.
- Uma primeira tentativa de ZIP continha os três `.md` vazios (1 byte cada). Após o preenchimento, o ZIP foi enviado de novo e é a base desta análise.

O Claude cruzou o **texto dos `.md`** com as **capturas de tela**, que são a evidência original dos comandos.

---

## 2. Resumo geral da auditoria

A auditoria percorreu três etapas: (1) listagem do diretório `/var/log`, (2) consulta ao serviço SSH com `journalctl` e (3) filtragem das autenticações (`Accepted`, `Failed`, `Invalid user`).

Resultado: nos registros apresentados há **11 autenticações bem-sucedidas e 1 falha de senha**, todas de IPs da rede interna `10.24.86.x`, e **nenhuma ocorrência de `Invalid user`**. Não há, nesses registros, indício de ataque de força bruta.

A documentação está coerente com as evidências, com **uma correção importante** no arquivo `03` (seção 4).

---

## 3. Análise dos resultados encontrados

### 3.1 Diretório `/var/log` (arquivo 01 + captura 01)

**Fatos:**
- O diretório tem 3,8 MB e contém os registros esperados: `auth.log`, `syslog`, `kern.log`, `dpkg.log`, `dmesg`, `wtmp`, `btmp`, `lastlog`, `cloud-init.log` e as pastas `journal/`, `apt/`, `installer/` e `unattended-upgrades/`.
- O `auth.log` (75 KB) foi alterado pela última vez em 30/10 às 15:17, ou seja, continua sendo gravado.
- Arquivos sensíveis têm permissões restritas, por exemplo `auth.log` (`-rw-r-----`, dono `syslog`, grupo `adm`) e `btmp` (`-rw-rw----`, dono `root`, grupo `utmp`).
- Existem cópias rotacionadas e compactadas do `dmesg` (`.gz`), o que indica que a rotação de logs está funcionando.
- O `btmp` tem 384 bytes e última alteração em 26/10.

**Hipótese a verificar:** em sistemas Linux x86-64 cada registro desse arquivo costuma ocupar 384 bytes, então o `btmp` provavelmente guarda **apenas um** registro de falha de login, de 26/10. Isso não aparece na captura 03 (a primeira linha é um `Accepted` às 14:32:06). Também não indica que a falha de 28/10 foi gravada ali. Convém conferir com `sudo lastb`.

**Interpretação:** a estrutura de logs está íntegra e o arquivo 01 descreve corretamente os principais registros.

### 3.2 Serviço SSH (arquivo 02 + captura 02)

**Fatos** (`sudo journalctl -u ssh --since "today"`):
- O `ssh.service` foi iniciado em 30/10 às 13:56:55 e passou a escutar na porta **22**, em `0.0.0.0` (IPv4) e `::` (IPv6), ou seja, em todas as interfaces.
- Foram aceitas duas autenticações por **senha** do usuário `senac`, ambas de **10.24.86.21**: 13:56:01 (porta 53571) e 15:44:33 (porta 59943). A sessão foi aberta pelo PAM com `uid=1001`.

**O que o arquivo 02 não diz:** o texto menciona "uma autenticação" aceita, mas a captura mostra **duas** no dia, e não informa o IP de origem. Não é erro, mas vale completar.

**Ponto de atenção (fato):** o login das 13:56:01 aparece com horário **anterior** ao início do serviço (13:56:55).
**Hipótese (não confirmada):** ajuste do relógio após a inicialização (sincronização NTP). Verificar com `journalctl --list-boots` e o log do `chrony`.

### 3.3 Autenticações e falhas (arquivo 03 + captura 03)

**Fatos** (filtro `Failed|Accepted|Invalid user`, sem filtro de data):

| Data | Usuário | Origem | Resultado |
|---|---|---|---|
| 26/10 | `srvenzords` | 10.24.86.21 | 6 aceitas (14:32, 16:00, 16:18, 16:40, 16:51, 16:52) |
| 28/10 | `senac` | 10.24.86.21 | 2 aceitas (14:38 e 16:40) |
| 28/10 | `senac` | **10.24.86.17** | **1 falha (14:43:53) e 1 aceita (14:44:00)** |
| 30/10 | `senac` | 10.24.86.21 | 2 aceitas (13:56 e 15:44) |

Totais: **11 aceitas, 1 falha, 0 `Invalid user`**.

**Sobre a falha de 28/10:**
- A falha e o sucesso seguinte têm o mesmo IP (10.24.86.17), o mesmo processo (`sshd-session[2848]`) e a mesma porta de origem (62354). Isso indica **uma única conexão**: senha errada e, 7 segundos depois, senha correta.
- **Hipótese:** erro de digitação do usuário legítimo. Os registros não permitem afirmar a intenção.
- É a única ocorrência do IP 10.24.86.17 no período. Os registros não dizem quem usa cada máquina.

**Mudança de nomes entre 26/10 e 28/10 (fato):**
- Em 26/10, o usuário é `srvenzords` e o campo de host aparece como `senac` (primeiras linhas) e depois `srvenzords`.
- A partir de 28/10, o usuário é `senac` e o host aparece como `srvenzords.senac.br`.

**Hipótese:** o nome do servidor e o nome da conta foram alterados ou trocados entre essas datas. Convém confirmar e registrar na documentação, porque afeta a rastreabilidade dos acessos.

---

## 4. Conferência entre a documentação e as evidências

| Item | Situação |
|---|---|
| Arquivo 01: arquivos de log descritos | ✅ Coerente com a captura |
| Arquivo 02: serviço iniciado e escutando na porta 22 | ✅ Coerente |
| Arquivo 02: "uma autenticação" aceita | ⚠️ Incompleto: a captura mostra duas no dia |
| Arquivo 03: nenhum `Invalid user` | ✅ Coerente |
| Arquivo 03: falha de senha originada de 10.24.86.17 | ✅ Coerente |
| Arquivo 03: falha "para o usuário `srvenzords`" | ❌ **Incorreto.** A captura mostra `Failed password for senac` |
| Arquivo 03: aceitas de `srvenzords` pelo IP 10.24.86.21 | ⚠️ Vale só para 26/10. Depois o usuário é `senac` |
| Arquivo 03: comando sem filtro de data | ✅ Observação correta |

**Sugestão:** corrigir no arquivo 03 a falha para o usuário `senac` e separar os acessos por data.

---

## 5. Possíveis riscos identificados

Os itens abaixo são **riscos potenciais**, não incidentes confirmados.

1. **Autenticação por senha habilitada no SSH.** Todos os acessos foram por senha, alvo típico de força bruta. *(fato: login por senha em uso; não há prova de ataque)*
2. **SSH escutando em todas as interfaces, porta 22 padrão.** Aumenta a exposição se o servidor for alcançável por redes não confiáveis. *(fato: configuração observada; a exposição real depende de firewall e rede, que não foram mostrados)*
3. **Possível falta de proteção contra tentativas repetidas.** Nada nas evidências mostra `fail2ban` ou similar. *(hipótese: não foi verificado)*
4. **Rastreabilidade prejudicada** pela troca de nomes de usuário e host entre 26/10 e 28/10 e pela inconsistência de horário de 30/10.
5. **Documentação com erro pontual** (usuário da falha no arquivo 03).

**O que não é risco comprovado:** a falha de 28/10 **não deve ser classificada como invasão**. É uma única falha seguida de sucesso na mesma conexão, vinda de um IP interno.

---

## 6. Recomendações de segurança

1. Verificar as opções do SSH: `sudo sshd -T | grep -Ei "permitrootlogin|passwordauthentication|maxauthtries|allowusers"`.
2. Preferir **autenticação por chave pública** e desabilitar `PasswordAuthentication` quando possível.
3. Confirmar `PermitRootLogin no`, limitar usuários com `AllowUsers` e tentativas com `MaxAuthTries`.
4. Restringir a porta 22 às redes necessárias com o `ufw` (`sudo ufw status verbose`).
5. Avaliar `fail2ban` para bloquear IPs após falhas repetidas.
6. Conferir `sudo lastb` e `sudo last` para completar o histórico de falhas e acessos.
7. Investigar o horário (`timedatectl`, `journalctl --list-boots`, log do `chrony`).
8. Confirmar com `id senac` e `hostnamectl` o usuário e o nome atuais, e registrar quando foram alterados.
9. Identificar os responsáveis pelos IPs 10.24.86.21 e 10.24.86.17 e confirmar se os acessos eram esperados.
10. Corrigir o arquivo 03 (usuário da falha) e completar o arquivo 02 (as duas autenticações do dia e o IP de origem).

---

## 7. Limitações dos registros analisados

- O filtro `grep -E "Failed|Accepted|Invalid user"` ignora outros eventos relevantes (`Connection closed by`, `preauth`, `Disconnected`).
- Não foram mostrados `/etc/ssh/sshd_config`, regras de firewall, `lastb` nem o conteúdo do `auth.log`.
- O período dos registros vai de 26/10 a 30/10. Nada pode ser afirmado sobre datas anteriores.
- Capturas de tela dependem de legibilidade. Os dados foram conferidos com ampliação, mas devem ser confirmados nos logs originais.
- O arquivo `srvvaamonde.txt` é de uma coleta anterior (21/10), com host (`srvenzo`) e IP (10.24.69.213) diferentes. **Não foi usado** para concluir sobre os acessos SSH.

---

## 8. Conclusão técnica

Com base nas evidências disponíveis, os registros do servidor estão íntegros e os acessos SSH se concentram em um IP interno recorrente (10.24.86.21), sem sinais de varredura, usuários inexistentes ou força bruta. A única falha de senha foi seguida de sucesso na mesma conexão e é compatível com erro de digitação, o que permanece como **hipótese**.

Os pontos de melhoria estão na configuração do SSH (senha, porta, proteção contra tentativas repetidas), na confirmação do firewall, na rastreabilidade dos nomes de usuário e host, e em pequenos ajustes na documentação (arquivos 02 e 03). Conclusões mais firmes dependem de coletar os itens da seção 7.

---

*Documento gerado na Etapa 05B — Análise com Claude. A integração com o GitHub não funcionou e os arquivos foram fornecidos por ZIP.*
