# 🌐 Scan completo (todas as portas)

## 🎯 Objetivo
Garantir que **nenhuma porta fora das 1.000 mais comuns** esteja aberta no Ubuntu Server.

## 🛠️ Procedimento
```bash
nmap -p- 10.24.86.213
```
> ⚠️ O comando exato não aparece no print. `-p-` é o que testa as 65.535 portas, e o resultado abaixo é compatível com ele. Confirme no seu histórico.

## 🔍 Explicação
| Parte | Significado |
|---|---|
| `-p-` | Testa **todas** as 65.535 portas TCP (padrão: só 1.000) |
| `10.24.86.213` | Alvo |

## 📸 Evidência
![Scan completo Ubuntu Server](../imagens/nmap/Scan_NMAP_Ubuntu_Server.png)

## 📊 Resultado
| Item | Valor |
|---|---|
| 🟡 Portas filtradas | 65.534 |
| 🟢 Portas abertas | **1**: `22/tcp` (SSH) |
| MAC | `08:00:27:97:E2:FC` (VirtualBox) |
| Duração | **122,04 s** (o scan padrão levou 4,91 s) |

## 💡 Interpretação
- **Não há serviços escondidos** em portas altas. Só o SSH está acessível.
- O scan demorou mais porque, em portas filtradas, o Nmap espera uma resposta que nunca chega.
- O resultado é coerente com as regras do firewall do servidor (veja [regras de entrada](../03-ufw-gufw-linux-mint/02-regras-de-entrada.md)).

## ✅ Conclusão
O servidor expõe **uma única porta (22/SSH)** em toda a faixa TCP. Isso é uma boa prática: quanto menos portas expostas, menor a superfície de ataque.