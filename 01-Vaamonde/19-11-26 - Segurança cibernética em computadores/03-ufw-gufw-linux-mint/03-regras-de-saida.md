# ⬆️ Regras de saída

## 🎯 Objetivo
Definir **o que o servidor pode acessar** na rede. Como a política padrão de saída é `deny`, tudo precisa ser liberado manualmente.

## 🛠️ Procedimento
⚠️ *Comandos reconstruídos a partir do status; confirme no seu `history` (principalmente a regra de DNS).*

```bash
sudo ufw allow out on lo
sudo ufw allow out on enp0s3 from 10.24.86.213 to any port 83 proto tcp comment 'Liberando a saida para consulta do DNS'
sudo ufw allow out on enp0s3 from 10.24.86.213 to any port 80 proto tcp comment 'Liberando a saida para navegacao do HTTP v4'
sudo ufw allow out on enp0s3 from 10.24.86.213 to any port 443 proto tcp comment 'Liberando a saida para navegacao do HTTPS v4'
sudo ufw allow out on enp0s3 to any port 123 proto udp comment 'Liberando a saida para sincronismo do NTP.br v4'
```

## 🔍 Explicação
| Regra | Para que serve |
|---|---|
| `lo` | Comunicação interna da máquina |
| Porta 80/tcp | Acessar sites HTTP e baixar pacotes |
| Porta 443/tcp | Acessar sites HTTPS |
| Porta 123/udp | Sincronizar data e hora (NTP.br) |
| Porta de DNS | Traduzir nomes em endereços IP |
| `on enp0s3` | Só pela interface de rede indicada |

## 📸 Evidência
![Regras de saída](../imagens/ufw/Regras_Ubuntu_Server.png)

## 📊 Resultado

| Porta / Destino | Ação | Finalidade |
|---|---|---|
| Anywhere on lo | ✅ ALLOW OUT | Tráfego interno |
| 83/tcp ⚠️ | ✅ ALLOW OUT | "Consulta do DNS" |
| 80/tcp | ✅ ALLOW OUT | HTTP |
| 443/tcp | ✅ ALLOW OUT | HTTPS |
| 123/udp | ✅ ALLOW OUT | NTP.br (hora) |
| 10.24.86.213 22/tcp (de 10.24.86.200) | ✅ ALLOW OUT | Regra de SSH entre as máquinas |
| Regras em IPv6 | ✅ ALLOW OUT | `lo` e NTP |

## 💡 Interpretação
- Com saída bloqueada por padrão, o servidor só acessa **web, hora e rede local**. Isso limita danos caso a máquina seja comprometida (um programa malicioso não consegue "ligar para casa").
- ⚠️ **Possível erro na regra de DNS:** aparece `83/tcp`, mas o DNS usa a **porta 53** (normalmente UDP, às vezes TCP). Se foi digitação errada, o servidor **não resolverá nomes**. Teste com `nslookup google.com` e corrija com:
  ```bash
  sudo ufw allow out on enp0s3 to any port 53 proto udp
  sudo ufw allow out on enp0s3 to any port 53 proto tcp
  ```
- O comentário da última regra (IPv6) diz "v4": é só uma descrição imprecisa.

## ✅ Conclusão
O servidor segue o modelo **"negar tudo e liberar o mínimo"** também na saída. Falta validar (e provavelmente corrigir) a regra de DNS.