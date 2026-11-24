# 🧪 Testes com Nmap (validação das regras)

## 🎯 Objetivo
Conferir, com o Nmap, se as regras do UFW funcionam como esperado.

## 🛠️ Procedimento

### Teste 1: Ubuntu Server visto de fora
```bash
nmap -p- 10.24.86.213
```
📸 ![Scan Ubuntu Server](../imagens/nmap/Scan_NMAP_Ubuntu_Server.png)

| Resultado | Valor |
|---|---|
| 🟢 Aberta | 22/tcp (SSH) |
| 🟡 Filtradas | 65.534 |

**💡 Interpretação:** bate com as regras do servidor (entrada negada por padrão, só o SSH liberado). ✅ **Regras validadas.**

### Teste 2: Linux Mint escaneando a si mesmo
```bash
nmap -sS -p 22,80,443 10.24.86.60
```
📸 ![Scan Mint](../imagens/nmap/Scan_NMAP_Linux_Mint.png)

| Porta | Regra UFW | Resultado |
|---|---|---|
| 22 | ✅ allow | 🔴 closed |
| 80 | ⛔ deny | 🔴 closed |
| 443 | ✅ allow | 🔴 closed |

**💡 Interpretação:**
- As três aparecem **fechadas** porque nenhum serviço está escutando nelas.
- ⚠️ Como o scan foi feito **na própria máquina**, o tráfego passa pela interface interna (`lo`), que o firewall normalmente libera. Por isso, o **bloqueio da porta 80 não foi realmente testado**. Caso estivesse sendo bloqueada, o esperado seria 🟡 *filtered*.

### 📝 Teste pendente (recomendado)
Rode o scan **de outra máquina** (Ubuntu Server ou Windows) contra o Mint:
```bash
nmap -sS -p 22,80,443 10.24.86.60
```

| Porta | Regra | Resultado esperado |
|---|---|---|
| 22 | allow | 🔴 closed (ou 🟢 open, se o SSH estiver instalado) |
| 80 | deny | 🟡 **filtered** |
| 443 | allow | 🔴 closed (liberada, mas sem serviço) |

## 📊 Resumo

| Estado | Quem o causa |
|---|---|
| 🟢 open | Regra libera **e** há serviço escutando |
| 🔴 closed | Regra libera, mas **não há serviço** |
| 🟡 filtered | O firewall **bloqueia** (DENY ou política padrão) |

## ✅ Conclusão
O scan externo no Ubuntu Server **comprova** o funcionamento do firewall. Para o Mint, falta o teste a partir de outra máquina.