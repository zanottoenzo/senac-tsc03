# 🔓 Scan com Firewall DESATIVADO

## 🎯 Objetivo
Ver quais portas o Windows expõe quando **não há firewall** protegendo.

## 🛠️ Procedimento
```bash
nmap 10.24.86.43
```

## 🔍 Explicação
Scan padrão: testa as 1.000 portas TCP mais comuns do Windows.

## 📸 Evidência
![Scan sem firewall](../imagens/windows/Sem_Firewall.png)

## 📊 Resultado
| Porta | Serviço | Estado |
|---|---|---|
| 135/tcp | msrpc | 🟢 aberta |
| 139/tcp | netbios-ssn | 🟢 aberta |
| 445/tcp | microsoft-ds | 🟢 aberta |
| Demais (997) | n/a | 🔴 fechadas (`reset`) |

Duração: **1,66 s** · Latência: 0,0018 s · Horário: 15:03.

## 💡 Interpretação
| Porta | O que é | Para que serve |
|---|---|---|
| 135 | MSRPC | Comunicação interna entre programas do Windows |
| 139 | NetBIOS | Compartilhamento de arquivos (modo antigo) |
| 445 | SMB | Compartilhamento de arquivos e impressoras |

- As outras portas respondem **"fechada"** porque o Windows responde a tudo (`reset`).
- O scan foi **rápido**, porque todas as portas deram resposta.
- ⚠️ As portas 135, 139 e 445 são alvos comuns de ataques. Deixá-las expostas, sem firewall, é um risco.

## ✅ Conclusão
Sem firewall, o Windows **mostra seus serviços** para qualquer máquina da rede.