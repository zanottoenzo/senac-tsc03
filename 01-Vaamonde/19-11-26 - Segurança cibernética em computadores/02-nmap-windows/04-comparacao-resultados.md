# ⚖️ Comparação: Windows com e sem Firewall

Alvo: Windows 10 · `10.24.86.43`

| Critério | 🔓 Sem firewall | 🔒 Com firewall |
|---|---|---|
| Comando | `nmap 10.24.86.43` | `nmap 10.24.86.43` |
| Horário | 15:03 | 15:05 |
| 🟢 Portas abertas | 3 (135, 139, 445) | 0 |
| 🔴 Portas fechadas | 997 | 0 |
| 🟡 Portas filtradas | 0 | 1.000 |
| Duração | 1,66 s | 32,94 s |
| Visibilidade dos serviços | Total | Nenhuma |

## 📡 E o ping?
| Situação | Resultado |
|---|---|
| Firewall ligado + regra ICMPv4 habilitada | ✅ Responde (4/4, 0% perda) |

## 💡 O que isso mostra
1. 🧱 O firewall **esconde** os serviços (de 3 portas abertas para nenhuma visível).
2. ⏱️ Portas filtradas fazem o scan ficar **muito mais lento**.
3. 📡 O ping é controlado por uma **regra própria**: dá para liberá-lo sem expor SMB, NetBIOS ou RPC.

## ✅ Conclusão
O Firewall do Windows é **essencial**: sem ele, três serviços sensíveis ficam expostos a toda a rede.