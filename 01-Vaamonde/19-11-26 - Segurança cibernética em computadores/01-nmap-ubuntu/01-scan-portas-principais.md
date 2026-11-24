# 🔎 Scan das portas principais

## 🎯 Objetivo
Verificar rapidamente quais das portas mais usadas estão abertas.

---

## 🧪 Scan A: Scan padrão no Ubuntu Server

### 🛠️ Procedimento
```bash
nmap 10.24.86.213
```

### 🔍 Explicação
| Parte | Significado |
|---|---|
| `nmap` | Ferramenta de análise de rede |
| `10.24.86.213` | Alvo (Ubuntu Server) |
| *(sem opções)* | O Nmap testa as **1.000 portas TCP mais comuns** (de 65.535) |

### 📸 Evidência
![Scan padrão Ubuntu Server](../imagens/nmap/Scan_Padrao_Ubuntu_Server.png)

### 📊 Resultado
| Item | Valor |
|---|---|
| Host ativo | ✅ Sim (latência 0,00078 s) |
| Portas 🟡 filtradas | 999 |
| Portas 🟢 abertas | **1**: `22/tcp` (SSH) |
| Tipo de máquina | VirtualBox (MAC `08:00:27:97:E2:FC`) |
| Duração | 4,91 segundos |

### 💡 Interpretação
- Só o **SSH (porta 22)** está acessível: é o acesso remoto seguro ao servidor.
- As outras 999 portas estão **filtradas**: o firewall descarta os pacotes sem responder.
- A resposta em menos de 1 ms mostra que a máquina está na **mesma rede local**.

---

## 🧪 Scan B: Portas 22, 80 e 443 no Linux Mint

### 🛠️ Procedimento
```bash
nmap -sS -p 22,80,443 10.24.86.60
```

### 🔍 Explicação
| Parte | Significado |
|---|---|
| `-sS` | Scan **SYN** (começa a conexão TCP, mas não a completa) |
| `-p 22,80,443` | Testa só essas três portas: SSH, HTTP e HTTPS |
| `10.24.86.60` | Alvo |

### 📸 Evidência
![Scan portas 22, 80 e 443](../imagens/nmap/Scan_NMAP_Linux_Mint.png)

### 📊 Resultado
| Porta | Serviço | Estado |
|---|---|---|
| 22/tcp | SSH | 🔴 closed |
| 80/tcp | HTTP | 🔴 closed |
| 443/tcp | HTTPS | 🔴 closed |

Duração: 0,08 s · Latência: 0,000038 s.

### 💡 Interpretação
- **Fechada** significa que a máquina respondeu "não há serviço aqui". Nenhum serviço está ouvindo nessas portas.
- A latência é quase zero porque o scan foi feito **da máquina contra ela mesma**.

## ✅ Conclusão
- O scan padrão é rápido e mostra o essencial (aqui: só o SSH está exposto).
- `-p` permite focar em portas específicas.
- Scans na própria máquina mostram o que está **escutando**, mas não provam que o firewall bloqueia (veja [05-testes-com-nmap.md](../03-ufw-gufw-linux-mint/05-testes-com-nmap.md)).