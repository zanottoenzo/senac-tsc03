# 🔒 Scan com Firewall ATIVADO

## 🎯 Objetivo
Ver como o Firewall do Windows muda o resultado do mesmo scan.

## 🛠️ Procedimento
```bash
nmap 10.24.86.43
```
*(mesmo comando do teste anterior)*

## 🔍 Explicação
Só mudou uma coisa: o **Firewall do Windows está ligado**.

## 📸 Evidência
![Scan com firewall](../imagens/windows/Com_Firewall.png)

## 📊 Resultado
| Item | Valor |
|---|---|
| Host ativo | ✅ Sim (latência 0,00087 s) |
| Portas 🟡 filtradas | **1.000 (todas)** |
| Portas 🟢 abertas | 0 |
| Mensagem do Nmap | `All 1000 scanned ports ... are in ignored states` |
| Duração | **32,94 s** · Horário: 15:05 |

## 💡 Interpretação
- O firewall **descarta** os pedidos sem responder, então o Nmap não consegue saber o que há em cada porta.
- A mensagem *"ignored states"* significa que todas as portas ficaram sem resposta.
- O Nmap ainda vê o host como ativo porque as máquinas estão na mesma rede local (descoberta pela camada de rede, não por porta).
- O scan demorou **20x mais** (32,94 s contra 1,66 s) porque o Nmap esperou respostas que não vieram.

## ✅ Conclusão
Com o firewall ligado, o Windows **fica praticamente invisível**: os serviços 135, 139 e 445 continuam existindo, mas não são alcançáveis pela rede.