# 📂 01 - Análise do Diretório de Logs do Ubuntu Server

## 🎯 Objetivo
Identificar e visualizar os arquivos de registros (Logs) armazenados no Ubuntu Server.

Os Logs funcionam como um histórico de atividades do servidor, registrando informações sobre serviços, autenticações, erros e operações realizadas no sistema.

## ⚙️ Comandos utilizados

Acessar o diretório de Logs:

```bash
cd /var/log
```

Listar os arquivos e visualizar seus detalhes:

```bash
ls -lh
```

## 🔎 Explicação dos comandos

- `cd`: acessa um diretório do sistema.
- `/var/log`: diretório onde ficam armazenados os registros do Ubuntu.
- `ls`: lista arquivos e diretórios.
- `-l`: apresenta informações detalhadas dos arquivos.
- `-h`: exibe os tamanhos em formato legível (KB, MB).

## 📋 Principais arquivos encontrados

| Arquivo | Descrição |
|---|---|
| `auth.log` | Registra atividades de autenticação e acesso. |
| `syslog` | Armazena eventos gerais do sistema. |
| `kern.log` | Registra mensagens relacionadas ao Kernel. |
| `dpkg.log` | Registra instalações e atualizações de programas. |
| `journal/` | Armazena registros gerenciados pelo systemd. |
| `dmesg` | Apresenta mensagens relacionadas ao hardware e inicialização. |
| `wtmp` | Armazena informações sobre sessões de login. |
| `btmp` | Registra tentativas de login malsucedidas. |

## 📊 Resultado da análise

A listagem apresentou diversos arquivos e diretórios responsáveis pelo armazenamento dos registros do Ubuntu Server.

Entre eles, destacam-se `auth.log`, `syslog`, `kern.log` e `journal/`, que permitem investigar atividades de autenticação, funcionamento do sistema e comportamento dos serviços.

## ✅ Conclusão

A análise permitiu identificar onde os registros do servidor são armazenados e quais arquivos podem ser utilizados em uma auditoria de sistemas.

Essas informações serão utilizadas nas próximas etapas para investigar os acessos SSH e identificar possíveis ocorrências relacionadas à segurança do servidor.
