# 🔭 Etapa 1: Nmap no Ubuntu Server

## 🎯 Objetivo
Descobrir **quais portas e serviços** o Ubuntu Server (`10.24.86.213`) deixa visíveis na rede.

## 🛠️ Preparação

| Passo | Comando | Para que serve |
|---|---|---|
| 1️⃣ Instalar o Nmap | `sudo apt update && sudo apt install nmap -y` | Instala a ferramenta |
| 2️⃣ Conferir a instalação | `nmap --version` | Mostra a versão (usada: **7.94SVN**) |
| 3️⃣ Descobrir o IP da máquina | `ip a` | Lista os endereços de rede |
| 4️⃣ Testar se o alvo responde | `ping -c 4 10.24.86.213` | Confirma que há comunicação |

> 💡 As VMs devem estar em **modo Bridge** para enxergar umas às outras.

## 📚 Arquivos desta etapa

| Arquivo | Conteúdo |
|---|---|
| [01-scan-portas-principais.md](01-scan-portas-principais.md) | Scan rápido das portas mais comuns |
| [02-scan-completo.md](02-scan-completo.md) | Scan das 65.535 portas |
| [resultados.md](resultados.md) | Resumo comparando os scans |