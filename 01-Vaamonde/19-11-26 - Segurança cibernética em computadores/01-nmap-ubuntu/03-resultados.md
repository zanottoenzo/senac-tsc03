# 📊 Resultados: Nmap no Ubuntu Server

| # | Comando | Alvo | 🟢 Abertas | 🔴 Fechadas | 🟡 Filtradas | Tempo |
|---|---|---|---|---|---|---|
| A | `nmap 10.24.86.213` | Ubuntu Server | 1 (22) | 0 | 999 | 4,91 s |
| B | `nmap -sS -p 22,80,443 10.24.86.60` | Linux Mint | 0 | 3 (22, 80, 443) | 0 | 0,08 s |
| C | `nmap -p- 10.24.86.213` | Ubuntu Server | 1 (22) | 0 | 65.534 | 122,04 s |

## 💡 O que isso significa
- 🔒 O **Ubuntu Server** expõe **apenas o SSH (22)**. O resto fica invisível por causa do firewall.
- 🔴 No **Linux Mint**, as portas 22, 80 e 443 estão fechadas: nenhum serviço escuta nelas.
- ⏱️ Quanto mais portas **filtradas**, mais **demorado** o scan.

## ✅ Conclusão
Os scans confirmam que o Ubuntu Server está bem restrito: só o acesso remoto necessário está disponível.