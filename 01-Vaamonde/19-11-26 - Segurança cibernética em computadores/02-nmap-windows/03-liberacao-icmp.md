# 📡 Liberação do Ping (ICMP)

## 🎯 Objetivo
Permitir que o Windows **responda ao ping**, sem abrir as demais portas.

## 🛠️ Procedimento

### 1️⃣ Habilitar a regra no firewall
1. Abra `wf.msc` (Windows Defender Firewall com Segurança Avançada)
2. Clique em **Regras de Entrada**
3. Localize: **Compartilhamento de Arquivo e Impressora (Solicitação de Eco - ICMPv4-In)**
4. Clique com o botão direito → **Habilitar Regra**

Ou, pelo PowerShell (administrador):
```powershell
Enable-NetFirewallRule -DisplayName "Compartilhamento de Arquivo e Impressora (Solicitação de Eco - ICMPv4-In)"
```

### 2️⃣ Testar a partir do Linux
```bash
ping -c4 10.24.86.43
```

## 🔍 Explicação
| Termo | Significado |
|---|---|
| **ICMP** | Protocolo usado pelo ping |
| **Solicitação de Eco** | O "ping" que chega ao Windows |
| **ICMPv4-In** | Regra de **entrada** para IPv4 |
| `-c4` | Envia 4 pacotes e para |

## 📸 Evidências
**Regra habilitada no firewall:**
![Regra ICMPv4](../imagens/windows/Regra_Permissao_Ping_Windows_10.png)

**Ping funcionando:**
![Ping com sucesso](../imagens/windows/Com_ICMPv4_ativado.png)

## 📊 Resultado
| Item | Valor |
|---|---|
| Pacotes enviados / recebidos | 4 / 4 |
| Perda | 🟢 0% |
| Tempo médio | 0,956 ms (mín. 0,712 · máx. 1,131) |
| TTL | 128 |

Na tela do firewall, as **duas** regras *Solicitação de Eco - ICMPv4-In* estão com o ícone ✅ verde (habilitadas), e as regras de SMB, NetBIOS, RPC e ICMPv6 aparecem sem o ícone (desabilitadas).

## 💡 Interpretação
- ✅ O Windows **responde ao ping**.
- O **TTL 128** é característico de máquinas **Windows**.
- Existem duas regras iguais porque cada uma vale para um tipo de rede (perfil) do Windows.
- Liberar o ping **não abre as portas de serviço**: só permite saber que a máquina está ligada.

## ✅ Conclusão
É possível manter o firewall ligado e, ao mesmo tempo, permitir o diagnóstico de rede por ping.

> 📝 **Pendente:** registrar o ping **antes** de habilitar a regra (esperado: 100% de perda) para mostrar a diferença.