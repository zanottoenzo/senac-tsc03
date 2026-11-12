# 🤖 05 - Análise da Auditoria do Ubuntu Server — ChatGPT

> **Etapa 05A — Análise com inteligência artificial**
> **Data da auditoria:** 30/10/2026
> **Fontes analisadas:** documentação das etapas 01, 02 e 03, README e três capturas de tela da pasta Imagens.

---

## 1. Objetivo da análise

Analisar os procedimentos realizados durante a auditoria do Ubuntu Server, interpretar os registros encontrados e identificar possíveis riscos relacionados ao funcionamento do sistema e aos acessos remotos pelo serviço SSH.

A análise considera os arquivos Markdown preenchidos e as capturas de tela dos comandos executados.

## 2. Resumo geral

A auditoria foi realizada em três etapas:

1. Identificação dos arquivos de registros no diretório `/var/log`.
2. Consulta ao funcionamento do serviço SSH utilizando `journalctl`.
3. Identificação de autenticações aceitas e malsucedidas.

Nas evidências analisadas foram identificadas:

- **11 autenticações bem-sucedidas.**
- **1 tentativa de autenticação malsucedida.**
- **Nenhuma ocorrência de `Invalid user` nos resultados apresentados.**
- Dois endereços IP de origem: `10.24.86.21` e `10.24.86.17`.

Os registros demonstram atividades de acesso ao servidor, mas não apresentam evidências suficientes para confirmar uma invasão.

---

## 3. Análise dos resultados

### 3.1. Diretório `/var/log`

O primeiro procedimento utilizou os comandos:

```bash
cd /var/log
ls -lh
```

A listagem apresentou diversos arquivos e diretórios responsáveis pelo armazenamento dos registros do Ubuntu Server.

Entre os principais arquivos identificados estão:

| Arquivo | Função |
|---|---|
| `auth.log` | Registra eventos de autenticação e segurança. |
| `syslog` | Armazena mensagens gerais do sistema. |
| `kern.log` | Registra mensagens relacionadas ao kernel. |
| `dpkg.log` | Registra operações de gerenciamento de pacotes. |
| `journal/` | Armazena registros gerenciados pelo systemd. |
| `dmesg` | Apresenta mensagens relacionadas ao kernel e à inicialização. |
| `wtmp` | Armazena informações sobre sessões de login. |
| `btmp` | Registra tentativas de login malsucedidas. |

**Análise:**

A identificação desses arquivos permite conhecer as principais fontes de informação disponíveis para investigar atividades do servidor.

O diretório `/var/log` é importante para auditorias porque possibilita consultar eventos, acompanhar serviços e investigar possíveis falhas.

A listagem, entretanto, não permite afirmar sozinha que todos os registros estão íntegros ou que todas as permissões estão adequadas.

### 3.2. Funcionamento do serviço SSH

Foi utilizado o comando:

```bash
sudo journalctl -u ssh --since "today"
```

A consulta apresentou registros de inicialização do serviço SSH e de autenticações realizadas.

Foram identificados:

- Inicialização do serviço `ssh.service`.
- Escuta na porta 22 por IPv4 (`0.0.0.0`) e IPv6 (`::`).
- Duas autenticações aceitas para o usuário `senac`.
- Endereço de origem `10.24.86.21` nas duas autenticações.
- Abertura das sessões pelo PAM para o usuário `senac`, com UID 1001.

**Análise:**

Os registros demonstram que o serviço SSH estava funcionando e aceitando conexões remotas por senha.

A escuta em todas as interfaces indica que o serviço está preparado para receber conexões pelas interfaces IPv4 e IPv6 disponíveis. Isso não comprova que o servidor esteja exposto diretamente à internet, pois essa condição também depende da configuração da rede e do firewall.

**Ponto de atenção:**

A primeira autenticação aparece às 13:56:01, enquanto a inicialização do serviço aparece às 13:56:55.

Essa diferença de horário precisa ser investigada. Uma possível explicação seria uma alteração ou sincronização do relógio, mas os registros apresentados não permitem confirmar a causa.

### 3.3. Análise das autenticações SSH

Foi executado o comando:

```bash
sudo journalctl -u ssh | grep -E "Failed|Accepted|Invalid user"
```

O filtro permitiu identificar autenticações aceitas, falhas de senha e tentativas utilizando usuários inexistentes.

Os resultados apresentados foram:

| Data | Usuário | Endereço IP | Resultado |
|---|---|---|---|
| 26/10 | `srvenzords` | 10.24.86.21 | 6 autenticações aceitas |
| 28/10 | `senac` | 10.24.86.21 | 2 autenticações aceitas |
| 28/10 | `senac` | 10.24.86.17 | 1 falha e 1 autenticação aceita |
| 30/10 | `senac` | 10.24.86.21 | 2 autenticações aceitas |

**Totais identificados:**

- 11 autenticações aceitas.
- 1 falha de autenticação.
- 0 ocorrências de usuário inválido nos resultados apresentados.

**Análise da falha:**

Em 28/10, às 14:43:53, foi registrada uma tentativa de senha incorreta para o usuário `senac`, originada do endereço `10.24.86.17`.

Sete segundos depois, às 14:44:00, ocorreu uma autenticação aceita para o mesmo usuário, a partir do mesmo endereço IP e da mesma porta de origem.

Os registros indicam que os dois eventos pertencem à mesma conexão SSH.

Uma possibilidade é que tenha ocorrido um erro de digitação da senha, seguido de uma tentativa bem-sucedida. Entretanto, não é possível confirmar a identidade ou a intenção de quem realizou o acesso.

**Análise dos endereços IP:**

Os endereços `10.24.86.21` e `10.24.86.17` pertencem à faixa privada `10.0.0.0/8`, utilizada normalmente em redes internas.

Portanto, os registros indicam origens compatíveis com dispositivos de uma rede privada. Não é possível identificar os responsáveis pelos equipamentos somente com essas informações.

### 3.4. Inconsistências identificadas na documentação

Durante a comparação entre os arquivos Markdown e as capturas de tela, foram identificados dois pontos que precisam de correção:

**Arquivo 02 — Consulta SSH**

A documentação menciona uma autenticação aceita para o usuário `senac`, mas a captura apresenta duas autenticações no dia 30/10.

Também é recomendável registrar o endereço IP de origem, `10.24.86.21`.

**Arquivo 03 — Tentativas de acesso SSH**

A documentação original atribui a falha de senha ao usuário `srvenzords`.

Entretanto, a captura mostra:

```text
Failed password for senac from 10.24.86.17
```

Portanto, o usuário correto da tentativa malsucedida é `senac`.

Essas correções são importantes para manter a documentação consistente com as evidências coletadas.

---

## 4. Possíveis riscos identificados

Os itens abaixo representam riscos potenciais, não incidentes confirmados.

1. **Autenticação por senha:** o SSH está aceitando autenticações por senha. É importante utilizar senhas fortes e avaliar a utilização de chaves SSH.

2. **Escuta em todas as interfaces:** o serviço está ouvindo na porta 22 em IPv4 e IPv6. É necessário verificar se o firewall limita o acesso às redes autorizadas.

3. **Tentativa de senha incorreta:** foi identificada uma falha de autenticação. Embora isolada, deve ser acompanhada nos registros futuros.

4. **Diferença de horário:** existe uma divergência entre o horário de uma autenticação e o início do serviço SSH.

5. **Rastreabilidade dos acessos:** os registros apresentam diferentes nomes de usuário e hostname ao longo das datas analisadas. É importante verificar essas alterações para facilitar a identificação das atividades.

6. **Verificações de segurança pendentes:** não foram apresentadas evidências suficientes para confirmar a configuração do firewall, o uso do Fail2ban ou as opções efetivas do SSH.

---

## 5. Recomendações de segurança

Com base nos resultados, são recomendadas as seguintes ações:

1. Verificar a configuração efetiva do SSH:

```bash
sudo sshd -T
```

2. Conferir se o acesso direto do usuário root está bloqueado.

3. Avaliar a utilização de autenticação por chave pública.

4. Verificar as regras do firewall:

```bash
sudo ufw status verbose
```

5. Verificar se existe proteção contra tentativas repetidas de autenticação, como Fail2ban.

6. Consultar o histórico de autenticações malsucedidas:

```bash
sudo lastb
```

7. Consultar o histórico de sessões:

```bash
sudo last
```

8. Investigar os horários e a inicialização do sistema:

```bash
timedatectl
sudo journalctl --list-boots
```

9. Identificar os dispositivos responsáveis pelos endereços IP encontrados.

10. Corrigir as informações dos arquivos Markdown para que correspondam exatamente às evidências.

Essas ações são recomendações para verificações futuras e não significam que as configurações atuais estejam necessariamente incorretas.

---

## 6. Limitações da análise

A análise foi realizada com base nos arquivos Markdown e nas capturas de tela disponibilizadas.

Não foram apresentados:

- Conteúdo completo do arquivo `/etc/ssh/sshd_config`.
- Resultado das regras de firewall.
- Verificação de instalação e funcionamento do Fail2ban.
- Histórico completo de autenticações com `last` e `lastb`.
- Identificação dos equipamentos responsáveis pelos endereços IP.
- Registros completos do serviço Chrony para investigar a divergência de horário.

O comando de filtragem da terceira etapa também não possui restrição de data, podendo apresentar registros de diferentes dias.

Por isso, as conclusões se limitam às evidências efetivamente apresentadas.

---

## 7. Conclusão técnica

A auditoria permitiu identificar os principais arquivos de registros do Ubuntu Server, verificar o funcionamento do serviço SSH e analisar as autenticações realizadas no servidor.

Foram identificadas 11 autenticações bem-sucedidas e uma tentativa de autenticação malsucedida. Não foram encontradas ocorrências de usuários inexistentes nos resultados apresentados.

A falha de senha identificada foi seguida de uma autenticação aceita na mesma conexão, sendo compatível com a possibilidade de erro de digitação. Entretanto, não existem informações suficientes para confirmar essa hipótese.

Também foram identificados pontos que merecem atenção, como a autenticação por senha, a escuta do SSH em todas as interfaces, a divergência de horário e a necessidade de melhorar a rastreabilidade dos acessos.

**Resultado geral:** os procedimentos de auditoria foram executados e produziram evidências úteis para avaliar o funcionamento do servidor e seus acessos remotos. Não foram identificadas evidências suficientes para confirmar uma invasão. Recomenda-se continuar as verificações e aplicar as melhorias de segurança indicadas.

---

*Documento elaborado na Etapa 05A — Análise da auditoria com ChatGPT.*
