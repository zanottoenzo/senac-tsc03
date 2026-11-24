# 📸 Evidências do Laboratório

## Visão geral das pastas

- **Windows 10 (`10.24.86.43`)**: mostra o antes e o depois de ativar o firewall no Windows, além da regra que libera o ping mesmo com as portas bloqueadas.
- **Ubuntu Server (`10.24.86.213`)**: mostra as regras configuradas no firewall UFW e o resultado da varredura Nmap revelando apenas a porta SSH aberta.
- **Linux Mint (`10.24.86.60`)**: mostra a verificação das portas principais (22, 80 e 443) feitas a partir do servidor e a tela gráfica do firewall GUFW ativo com suas regras.

---

## Windows 10

- **Imagem `"Sem Firewall.png"`**: mostra a varredura do Nmap no Windows 10 (`10.24.86.43`) com o firewall desligado, expondo três portas abertas (`135`, `139` e `445`) usadas por serviços de rede do Windows e deixando o computador visível para quem escaneia a rede.
- **Imagem `"Com Firewall.png"`**: mostra a mesma varredura do Nmap após ligar o firewall do Windows, provando que todas as 1.000 portas analisadas passaram a ser bloqueadas/filtradas sem dar resposta ao invasor.
- **Imagem `"Regra Permissão Ping Windows 10.png"`**: mostra a tela do *Windows Defender Firewall com Segurança Avançada* na aba de regras de entrada, destacando a regra de *Solicitação de Eco - ICMPv4-In* habilitada para permitir que o computador responda ao comando ping.
- **Imagem `"Com ICMPv4 ativado.png"`**: mostra o teste de `ping` enviando 4 pacotes para o Windows 10 (`10.24.86.43`) e recebendo todos de volta sem perdas, comprovando que é possível liberar o ping para testes de rede sem precisar abrir as outras portas.

---

## Ubuntu Server

- **Imagem `"Regras aplicadas.png"`**: mostra o comando `sudo ufw status verbose` no servidor (`srvenzords`), comprovando que o firewall está ativo, bloqueando entradas por padrão, liberando saídas e aplicando regras específicas para as portas `22` (SSH), `80` (HTTP) e `443` (HTTPS).
- **Imagem `"Regras Ubuntu Server.png"`**: mostra uma configuração mais restrita e detalhada do UFW no servidor (`10.24.86.213`), onde tanto as entradas quanto as saídas são bloqueadas por padrão e apenas serviços autorizados na placa de rede (`enp0s3`) podem passar, como SSH limitado na rede local, navegação web, sincronização de horário e consulta DNS.
- **Imagem `"Scan NMAP Ubuntu Server.png"`**: mostra o resultado completo da varredura Nmap no IP `10.24.86.213`, comprovando que o firewall está funcionando ao deixar apenas a porta `22` (SSH) aberta para acesso remoto e filtrar todas as outras 65.534 portas.

---

## Linux Mint

- **Imagem `"Scan NMAP Linux Mint.png"`**: mostra o teste feito pelo servidor contra o IP do Linux Mint (`10.24.86.60`) nas portas `22`, `80` e `443`, revelando que todas estão fechadas (`closed`), ou seja, não há nenhum serviço web ou SSH rodando e ouvindo nessas portas.
- **Imagem `"GUFW.png"`**: mostra a janela visual do firewall GUFW ligada (`Status` ativo, perfil `Home`), bloqueando conexões de entrada por padrão, permitindo saídas e exibindo a lista de regras aplicadas para as portas `22`, `80` e `443` em IPv4 e IPv6.