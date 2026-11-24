# 🛡️ Segurança de Redes com Nmap e Firewall (Ubuntu Server, Linux Mint e Windows 10)

Laboratório prático para **descobrir o que está exposto em uma rede**, **entender como o firewall muda esse cenário** e **configurar regras para controlar o tráfego**.

> ⚠️ **Aviso:** todos os testes foram feitos em máquinas virtuais próprias, em ambiente de laboratório. Nunca escaneie redes ou computadores sem autorização.

---

## 🎯 Objetivos

- 🔍 Identificar dispositivos ativos na rede
- 🚪 Descobrir portas e serviços disponíveis (Nmap)
- 🧱 Entender como o firewall interfere nos resultados
- 📡 Testar conectividade com ping (ICMP)
- ⚙️ Configurar regras de entrada e saída (UFW/GUFW)
- 📝 Documentar tudo de forma simples e reproduzível

---

## 🖥️ Ambiente

Todas as máquinas são virtuais (VirtualBox) e usam rede em **modo Bridge (ponte)**, ou seja, ficam na mesma rede local.

| Máquina | Sistema | IP | Função |
|---|---|---|---|
| 🐧 Ubuntu Server | Ubuntu Server | `10.24.86.213` | Servidor analisado (SSH + firewall UFW) |
| 🐧 Linux Mint | Linux Mint | `10.24.86.60` | Máquina que executa os scans e testa o UFW/GUFW |
| 🪟 Windows 10 | Windows 10 | `10.24.86.43` | Alvo para testar o Firewall do Windows |

---

## 🧰 Ferramentas

| Ferramenta | Para que serve |
|---|---|
| 🔭 **Nmap** | Descobre máquinas e verifica portas abertas, fechadas ou filtradas |
| 🧱 **UFW** | Firewall do Linux, controlado por comandos |
| 🖱️ **GUFW** | Versão gráfica do UFW |
| 🪟 **Windows Defender Firewall** | Firewall do Windows |
| 💻 **Terminal** | Execução dos comandos |
| 🧾 **VS Code, Git e GitHub** | Escrita e publicação desta documentação |

---

## 🚦 Como ler os resultados (legenda rápida)

| Estado no Nmap | Ícone | Significado simples |
|---|---|---|
| **open** (aberta) | 🟢 | Há um serviço ouvindo e respondendo nessa porta |
| **closed** (fechada) | 🔴 | A máquina respondeu "não há nada aqui" |
| **filtered** (filtrada) | 🟡 | Ninguém respondeu: provavelmente um firewall descartou o pacote |

> 💡 **Analogia:** pense na máquina como um prédio com 65.535 portas.
> 🟢 Porta aberta: alguém atende. 🔴 Porta fechada: alguém responde "não tem ninguém". 🟡 Porta filtrada: silêncio total, como se houvesse um segurança que ignora quem bate.

---

## 📚 Índice

| Etapa | Conteúdo |
|---|---|
| 🔭 [01 - Nmap no Ubuntu Server](01-nmap-ubuntu/README.md) | Scans de portas principais e completo |
| 🪟 [02 - Nmap no Windows](02-nmap-windows/README.md) | Firewall desligado x ligado, liberação do ping |
| 🧱 [03 - UFW/GUFW](03-ufw-gufw-linux-mint/README.md) | Regras de entrada, saída, logs e testes |
| ✅ [Conclusão](CONCLUSAO.md) | Aprendizados e pendências |

## 🗂️ Estrutura do repositório

```
ubuntu-server-seguranca-redes/
├── README.md
├── CONCLUSAO.md
├── 01-nmap-ubuntu/
├── 02-nmap-windows/
├── 03-ufw-gufw-linux-mint/
└── imagens/
    ├── nmap/
    ├── windows/
    └── ufw/
```