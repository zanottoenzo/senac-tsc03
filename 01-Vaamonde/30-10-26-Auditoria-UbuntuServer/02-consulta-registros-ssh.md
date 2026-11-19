# 🔐 02 - Consulta dos Registros SSH com journalctl

## 🎯 Objetivo

Consultar os registros de funcionamento do serviço SSH no Ubuntu Server, identificando informações sobre inicialização do serviço e conexões realizadas.

O SSH (Secure Shell) permite acessar e administrar um servidor remotamente por meio de uma conexão segura.

## ⚙️ Comando utilizado

```bash
sudo journalctl -u ssh --since "today"
```

## 🔎 Explicação do comando

- `sudo`: executa o comando com privilégios administrativos.
- `journalctl`: ferramenta utilizada para consultar os registros do sistema.
- `-u ssh`: filtra os registros relacionados ao serviço SSH.
- `--since "today"`: apresenta os registros desde o início do dia atual.

## 📋 Resultados identificados

Durante a consulta, foram encontrados os seguintes registros:

| Registro | Significado |
|---|---|
| `Starting ssh.service` | O serviço SSH estava iniciando. |
| `Server listening on 0.0.0.0 port 22` | O servidor estava aguardando conexões IPv4 na porta 22. |
| `Server listening on :: port 22` | O servidor também estava aguardando conexões IPv6 na porta 22. |
| `Started ssh.service` | O serviço SSH foi iniciado com sucesso. |
| `Accepted password for senac` | Uma autenticação por senha foi aceita para o usuário senac. |

## 📊 Análise do resultado

Os registros demonstram que o serviço SSH foi iniciado corretamente e estava aguardando conexões pela porta 22.

Também foi identificada uma autenticação bem-sucedida para o usuário `senac`.

Isso demonstra que o servidor está permitindo conexões remotas por meio do serviço SSH.

## ✅ Conclusão

A consulta permitiu verificar o funcionamento do serviço SSH e identificar registros de inicialização e autenticação.

Essas informações são importantes para acompanhar os acessos remotos e auxiliar na auditoria de segurança do Ubuntu Server.
