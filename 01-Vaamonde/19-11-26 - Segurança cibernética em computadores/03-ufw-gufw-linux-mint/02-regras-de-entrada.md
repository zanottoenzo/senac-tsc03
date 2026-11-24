# ⬇️ Regras de entrada

## 🎯 Objetivo
Definir **quais conexões podem chegar** a cada máquina.

## 🛠️ Procedimento
⚠️ *Comandos reconstruídos a partir do status; confirme no seu `history`.*

**🐧 Linux Mint**
```bash
sudo ufw allow 22/tcp
sudo ufw deny 80/tcp
sudo ufw allow 443/tcp
```

**🐧 Ubuntu Server**
```bash
sudo ufw allow 22/tcp
sudo ufw allow in on lo
sudo ufw limit log-all in on enp0s3 from 10.24.86.0/24 to 10.24.86.213 port 22 proto tcp comment 'Liberando a entrada do acesso remoto via SSH v4'
```

## 🔍 Explicação
| Parte | Significado |
|---|---|
| `allow 22/tcp` | Permite SSH (acesso remoto) |
| `deny 80/tcp` | Bloqueia HTTP |
| `allow 443/tcp` | Permite HTTPS |
| `allow in on lo` | Permite a comunicação interna da máquina |
| `limit` | Permite, mas bloqueia IPs que tentam conectar muitas vezes seguidas |
| `on enp0s3` | Vale só para essa interface de rede |
| `from 10.24.86.0/24` | Só aceita origens dessa rede local |
| `log-all` | Registra **todos** os pacotes dessa regra |
| `(v6)` | Mesma regra para IPv6 (o UFW cria automaticamente) |

## 📸 Evidências
![Regras Mint](../imagens/ufw/Regras_aplicadas.png)
![Regras Ubuntu Server](../imagens/ufw/Regras_Ubuntu_Server.png)

## 📊 Resultado

**🐧 Linux Mint**
| Porta | Ação | Significado |
|---|---|---|
| 22/tcp (SSH) | ✅ ALLOW IN | Liberada para qualquer origem |
| 80/tcp (HTTP) | ⛔ DENY IN | Bloqueada |
| 443/tcp (HTTPS) | ✅ ALLOW IN | Liberada |
| Todas em IPv6 | Idênticas | Mesmas ações |

**🐧 Ubuntu Server**
| Regra | Ação | Significado |
|---|---|---|
| 22/tcp | ✅ ALLOW IN | SSH liberado para qualquer origem |
| Anywhere on lo | ✅ ALLOW IN | Tráfego interno liberado |
| 10.24.86.213 22/tcp em enp0s3 | 🚦 LIMIT IN | SSH vindo de `10.24.86.0/24`, com limite de tentativas e log completo |
| Versões IPv6 | ✅ ALLOW IN | SSH e `lo` em IPv6 |

## 💡 Interpretação
- Mint: libera SSH e HTTPS, bloqueia HTTP. Um bloqueio **explícito**, mesmo que o padrão já negue a entrada.
- Servidor: só aceita SSH e o tráfego interno. Isso explica o resultado do Nmap (**apenas a porta 22 aberta**).
- ⚠️ **Atenção à ordem:** no servidor, a regra `22/tcp ALLOW IN Anywhere` aparece **antes** da regra `LIMIT`. Como vale a primeira que combina, o `LIMIT` pode **nunca ser aplicado**. Para a limitação funcionar, deixe só a regra `LIMIT` (ou coloque-a primeiro).

## ✅ Conclusão
As regras de entrada seguem o princípio de **liberar só o necessário**. A regra `LIMIT` ajuda contra ataques de força bruta no SSH, desde que esteja na ordem correta.