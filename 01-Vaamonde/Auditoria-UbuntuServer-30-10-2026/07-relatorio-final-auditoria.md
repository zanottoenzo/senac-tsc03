
# Relatório Final de Auditoria – Ubuntu Server

**Data:** 30/10/2026  
**Unidade curricular:** UC8 – Planejar e executar auditoria de sistemas

## 1. Objetivo

Analisar os registros do Ubuntu Server, verificar a data e hora do sistema e identificar eventos relacionados ao serviço SSH.

## 2. Procedimentos realizados

Foram executados os seguintes procedimentos:

- Verificação de data, hora e sincronização com `timedatectl`.
- Inspeção dos arquivos de log em `/var/log`.
- Consulta aos registros SSH com `journalctl`.
- Identificação de tentativas de autenticação com `grep`.
- Organização das evidências e análise dos resultados com apoio do ChatGPT e Claude.

## 3. Resultados encontrados

A verificação do sistema indicou que o horário estava sincronizado, com fuso `America/Sao_Paulo`.

No diretório `/var/log`, foram identificados arquivos importantes, como `auth.log`, `syslog`, `kern.log`, `dpkg.log` e `journal/`, utilizados para registrar eventos do sistema.

Na análise dos registros SSH, foram identificados:

- 11 autenticações aceitas.
- 1 tentativa de autenticação malsucedida.
- Nenhum registro de usuário inválido nos resultados consultados.

A tentativa malsucedida ocorreu em 28/10, para o usuário `senac`, a partir do IP `10.24.86.17`. Sete segundos depois, houve uma autenticação aceita pelo mesmo endereço.

Também foram encontrados acessos realizados pelo IP `10.24.86.21`.

## 4. Pontos de atenção

- Foram encontrados registros de autenticação SSH por senha.
- O serviço SSH estava escutando em IPv4 e IPv6 na porta 22.
- Uma tentativa malsucedida merece acompanhamento, mas não comprova uma invasão.
- Foi identificada uma diferença de horário entre um registro de autenticação e o registro de inicialização do SSH, que precisa ser investigada.
- As configurações de firewall e segurança do SSH não foram verificadas completamente.

## 5. Recomendações

- Avaliar o uso de autenticação SSH por chave pública.
- Verificar as configurações do SSH e do firewall.
- Avaliar a utilização do Fail2ban.
- Acompanhar os registros de autenticação.
- Manter os arquivos de auditoria atualizados.

## 6. Conclusão

A auditoria permitiu analisar os principais registros do Ubuntu Server e identificar eventos de autenticação SSH.

Foram encontrados acessos bem-sucedidos e uma tentativa malsucedida, sem evidências suficientes para confirmar uma invasão.

Os procedimentos realizados contribuíram para compreender o funcionamento dos registros do sistema e identificar melhorias que podem fortalecer a segurança do servidor.

---

**Documentos complementares:** arquivos de análise `01`, `02`, `03`, `05` e `06`.

**Evidências:** pasta `Imagens/`.
