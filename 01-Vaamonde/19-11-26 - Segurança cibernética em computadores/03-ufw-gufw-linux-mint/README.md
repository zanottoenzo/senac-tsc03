# 🧱 Etapa 3: Firewall UFW / GUFW

## 🎯 Objetivo
Aprender a **controlar o tráfego** de entrada e saída com o UFW (terminal) e o GUFW (interface gráfica).

## 📖 O que é
| Ferramenta | Descrição |
|---|---|
| 🧱 **UFW** (*Uncomplicated Firewall*) | Firewall do Linux, controlado por comandos simples |
| 🖱️ **GUFW** | Versão gráfica do UFW |

## 🧠 Conceitos básicos

| Conceito | Significado simples |
|---|---|
| ⬇️ **Entrada (IN)** | Conexões que **chegam** na máquina |
| ⬆️ **Saída (OUT)** | Conexões que **partem** da máquina |
| ✅ **ALLOW** | Permite |
| ⛔ **DENY** | Bloqueia sem avisar (o scanner vê "filtrada") |
| 🚦 **LIMIT** | Permite, mas bloqueia quem tenta conectar muitas vezes (anti força bruta) |
| 📍 **Política padrão** | O que acontece com o tráfego que **não** tem regra |
| 🔁 **lo** | Interface local: a máquina conversando consigo mesma |
| 🌐 **enp0s3** | Interface de rede física/virtual da máquina |

> 💡 **Ordem importa:** o UFW lê as regras de cima para baixo e aplica a **primeira** que combinar.

## 📋 Instalação
```bash
sudo apt install ufw -y
sudo apt install gufw -y   # interface gráfica (opcional)
```

## 📚 Arquivos desta etapa

| Arquivo | Conteúdo |
|---|---|
| [01-configuracao-inicial.md](01-configuracao-inicial.md) | Status, políticas padrão e logs |
| [02-regras-de-entrada.md](02-regras-de-entrada.md) | O que pode entrar |
| [03-regras-de-saida.md](03-regras-de-saida.md) | O que pode sair |
| [04-logs-e-monitoramento.md](04-logs-e-monitoramento.md) | Registro de eventos |
| [05-testes-com-nmap.md](05-testes-com-nmap.md) | Validação das regras |