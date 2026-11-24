# 🪟 Etapa 2: Nmap no Windows 10

## 🎯 Objetivo
Comparar como o Windows 10 (`10.24.86.43`) aparece na rede **com e sem o Firewall** ligado.

## 🛠️ Preparação

| Item | Valor |
|---|---|
| Máquina alvo | Windows 10 (VM VirtualBox) |
| Nome | `DESKTOP-GH38P4E` |
| IP | `10.24.86.43` |
| Rede | Bridge |
| Scanner | Linux Mint |

### Como ligar/desligar o Firewall do Windows
**Pela interface:** Painel de Controle → Windows Defender Firewall → *Ativar ou desativar o Firewall*.

**Pelo PowerShell (como administrador):**
```powershell
# Desativar
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled False
# Ativar
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True
```

> ⚠️ Desative o firewall **só para o teste** e volte a ativá-lo em seguida.

## 📚 Arquivos desta etapa

| Arquivo | Conteúdo |
|---|---|
| [01-firewall-desativado.md](01-firewall-desativado.md) | Scan sem firewall |
| [02-firewall-ativado.md](02-firewall-ativado.md) | Scan com firewall |
| [03-liberacao-icmp.md](03-liberacao-icmp.md) | Liberando o ping |
| [comparacao-resultados.md](comparacao-resultados.md) | Comparação final |