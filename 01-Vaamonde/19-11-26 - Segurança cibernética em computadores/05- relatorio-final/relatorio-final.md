# ✅ Conclusão

## 📚 O que aprendemos

| # | Aprendizado |
|---|---|
| 1️⃣ | 🔍 O **Nmap** mostra o que uma máquina expõe na rede |
| 2️⃣ | 🚦 Portas podem estar 🟢 abertas, 🔴 fechadas ou 🟡 filtradas, e cada estado significa algo diferente |
| 3️⃣ | 🧱 Um **firewall** pode esconder serviços inteiros |
| 4️⃣ | 📡 O **ping** tem regra própria e pode ser liberado sem abrir outras portas |
| 5️⃣ | ⚙️ O **UFW** controla entrada, saída, interface, origem e protocolo |
| 6️⃣ | 🔒 Boa prática: **negar tudo e liberar só o necessário** |

## 📊 Resultados finais

| Máquina | Situação | Resultado |
|---|---|---|
| 🐧 Ubuntu Server | Firewall UFW ativo | 1 porta aberta (22), 65.534 filtradas |
| 🪟 Windows 10 | Sem firewall | 3 portas abertas (135, 139, 445) |
| 🪟 Windows 10 | Com firewall | 1.000 portas filtradas, 0 abertas |
| 🪟 Windows 10 | Com regra ICMP | Responde ao ping (0% de perda) |
| 🐧 Linux Mint | UFW ativo | 22, 80, 443 fechadas (scan local) |

## ⚖️ Comparações importantes

- 🔓 **Sem firewall** → scan rápido (1,66 s), serviços visíveis
- 🔒 **Com firewall** → scan lento (32,94 s), serviços invisíveis
- 🌐 Scan completo (65.535 portas) → 122,04 s, contra 4,91 s do scan padrão

## ⚠️ Pontos de atenção encontrados

| Ponto | O que fazer |
|---|---|
| Regra de DNS em `83/tcp` no servidor | Conferir; o correto é a porta 53 |
| `22/tcp ALLOW` antes da regra `LIMIT` | Reordenar para o limite de tentativas funcionar |
| Scan do Mint feito nele mesmo | Repetir a partir de outra máquina |

## 📝 Pendências (ainda sem evidência)

- [ ] 🖱️ Configuração feita pelo **GUFW** (prints)
- [ ] 📋 Trechos reais do **log** (`/var/log/ufw.log`)
- [ ] 📡 Ping **antes** de habilitar a regra ICMP
- [ ] 🧪 Scan externo contra o Linux Mint
- [ ] 🌐 Teste de DNS no servidor após revisar a regra

## 🏁 Fechamento
O laboratório mostrou, na prática, o caminho completo: **descobrir** o que está exposto, **entender** como o firewall interfere e **controlar** o tráfego com regras. A segurança de uma máquina depende de expor **o mínimo necessário** e de **verificar** com testes que as regras funcionam.