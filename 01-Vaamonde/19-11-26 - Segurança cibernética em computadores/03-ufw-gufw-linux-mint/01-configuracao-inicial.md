# ⚙️ Configuração inicial do UFW

## 🎯 Objetivo
Ativar o firewall e definir o comportamento padrão para tudo que **não** tem regra.

## 🛠️ Procedimento

**Ver o estado atual:**
```bash
sudo ufw status verbose
```

**Comandos de configuração** ⚠️ *(reconstruídos a partir do status; confirme no seu `history`)*:
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing     # Linux Mint
sudo ufw default deny outgoing      # Ubuntu Server
sudo ufw logging low                # Linux Mint
sudo ufw logging medium             # Ubuntu Server
sudo ufw enable
```

## 🔍 Explicação
| Comando | Significado |
|---|---|
| `status verbose` | Mostra o estado, políticas, logs e regras |
| `default deny incoming` | Bloqueia toda entrada que não tenha regra |
| `default allow outgoing` | Libera toda saída |
| `default deny outgoing` | Bloqueia toda saída que não tenha regra (mais restritivo) |
| `logging low / medium` | Nível de registro de eventos |
| `enable` | Liga o firewall |

## 📸 Evidências
**Linux Mint:**
![UFW Mint](../imagens/ufw/Regras_aplicadas.png)

**Ubuntu Server:**
![UFW Ubuntu Server](../imagens/ufw/Regras_Ubuntu_Server.png)

## 📊 Resultado

| Item | 🐧 Linux Mint | 🐧 Ubuntu Server |
|---|---|---|
| Status | ✅ active | ✅ active |
| Logs | low | medium |
| Entrada (padrão) | ⛔ deny | ⛔ deny |
| Saída (padrão) | ✅ allow | ⛔ deny |
| Roteamento | disabled | disabled |
| Novos perfis | skip | skip |

## 💡 Interpretação
- **Mint:** bloqueia o que entra, mas deixa sair. É o modelo comum para uso diário.
- **Ubuntu Server:** bloqueia **entrada e saída**. Só funciona o que for liberado por regra, o que é mais seguro e mais trabalhoso.
- *Roteamento desativado* significa que a máquina não repassa tráfego entre redes.

## ✅ Conclusão
Os dois firewalls estão ativos. O servidor adota uma política mais rígida (*negar tudo e liberar só o necessário*).

> 📝 **Pendente:** registrar a configuração feita pelo **GUFW** (print da interface).