# 📋 Logs e monitoramento

## 🎯 Objetivo
Registrar o que o firewall bloqueia ou permite, para **auditoria** e investigação.

## 🛠️ Procedimento
```bash
sudo ufw logging low      # ou medium / high / full / off
sudo ufw status verbose   # confere o nível ativo
sudo tail -f /var/log/ufw.log                 # acompanha em tempo real
sudo grep "UFW BLOCK" /var/log/ufw.log        # só os bloqueios
sudo grep "UFW ALLOW" /var/log/ufw.log        # só as permissões
```

## 🔍 Explicação
| Nível | O que registra |
|---|---|
| `low` | Pacotes **bloqueados** pela política e os que casam com regras que têm `log` |
| `medium` | Tudo do `low` + conexões novas permitidas e pacotes inválidos |
| `log-all` (na regra) | **Todos** os pacotes daquela regra específica |

| Máquina | Nível |
|---|---|
| 🐧 Linux Mint | low |
| 🐧 Ubuntu Server | medium (+ `log-all` na regra do SSH) |

## 📸 Evidência
Nível de log visível em: ![UFW logging](../imagens/ufw/Regras_Ubuntu_Server.png)

> 📝 **Pendente:** adicionar print de um trecho real de `/var/log/ufw.log`.

## 📊 Resultado
Os prints confirmam apenas os **níveis configurados** (`low` e `medium`). Ainda não há evidência de registros gerados.

## 💡 Interpretação (como ler uma linha de log)
| Campo | Significa |
|---|---|
| `[UFW BLOCK]` | O pacote foi **bloqueado** |
| `[UFW ALLOW]` | O pacote foi **permitido** |
| `SRC=` | IP de **origem** |
| `DST=` | IP de **destino** |
| `PROTO=` | Protocolo (TCP, UDP, ICMP) |
| `DPT=` | **Porta de destino** |

> 💡 Exemplo: `[UFW BLOCK] ... SRC=10.24.86.60 DST=10.24.86.213 PROTO=TCP DPT=80` quer dizer: *o 10.24.86.60 tentou acessar a porta 80 do servidor e foi barrado*.

## ✅ Conclusão
Os logs permitem saber **quem tentou o quê**. O nível `medium` e o `log-all` do servidor dão mais detalhe para auditoria, mas geram mais registros.