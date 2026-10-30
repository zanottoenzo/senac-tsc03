
# Relatório Final – Auditoria do Ubuntu Server

**Data:** 30/10/2026  
**Unidade curricular:** UC8 – Planejar e executar auditoria de sistemas

## 1. Objetivo

O objetivo desta atividade foi conhecer melhor os registros do Ubuntu Server e entender como eles podem ajudar a acompanhar o que acontece no sistema, principalmente em relação aos acessos realizados pelo SSH.

## 2. O que foi feito

Primeiro, verificamos a data, a hora e a sincronização do servidor. Em seguida, acessamos a pasta `/var/log`, onde ficam armazenados diversos registros do sistema.

Depois, consultamos os registros do SSH para observar quando o serviço foi iniciado e quais tentativas de acesso foram realizadas. Também organizamos as informações encontradas em arquivos e capturas de tela, utilizando o ChatGPT e o Claude como apoio na análise.

## 3. O que foi encontrado

Durante a atividade, foi possível identificar os principais arquivos de registro do servidor, como `auth.log`, `syslog` e `kern.log`, que ajudam a entender diferentes acontecimentos do sistema.

Na consulta aos acessos SSH, foram encontrados:

- 11 acessos realizados com sucesso;
- 1 tentativa de acesso que não foi aceita;
- Nenhum registro de tentativa utilizando um usuário inexistente nos resultados consultados.

A tentativa que não foi aceita aconteceu em 28/10, utilizando o usuário `senac` e o endereço IP `10.24.86.17`. Poucos segundos depois, foi registrado um acesso bem-sucedido pelo mesmo endereço.

Também foram identificados acessos realizados a partir do IP `10.24.86.21`.

## 4. Observações

A análise mostrou que os registros do servidor são importantes para acompanhar os acessos e identificar situações que merecem atenção.

A tentativa de acesso que não foi aceita, por exemplo, deve ser observada, mas não significa necessariamente que houve uma invasão. Também identificamos alguns pontos que podem ser verificados futuramente, como as configurações de acesso SSH e as regras do firewall.

## 5. Conclusão

Com esta atividade, conseguimos conhecer melhor onde o Ubuntu Server armazena seus registros e como consultar essas informações para acompanhar o funcionamento do sistema.

A análise dos acessos SSH permitiu identificar tentativas bem-sucedidas e malsucedidas, além de observar informações como usuários, horários e endereços IP.

No geral, a atividade mostrou como a consulta aos registros pode ajudar na identificação de situações fora do comum e no acompanhamento da segurança de um servidor. Também reforçou a importância de manter essas informações organizadas para facilitar futuras verificações e auditorias.

---

**Documentos de apoio:** arquivos de análise e capturas de tela disponíveis nesta pasta.
