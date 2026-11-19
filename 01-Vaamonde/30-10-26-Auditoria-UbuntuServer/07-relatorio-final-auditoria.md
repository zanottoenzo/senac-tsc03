
# Relatório Final – Auditoria de Sistemas em Ubuntu Server

**Data:** 30/10/2026  
**Unidade curricular:** UC8 – Planejar e executar auditoria de sistemas

## Sobre a atividade

A atividade teve como objetivo realizar uma análise dos registros de um servidor GNU/Linux, usando a distribuição Ubuntu 26.04.01-live-server, entendendo como o sistema armazena informações sobre seu funcionamento e como esses registros podem ajudar a acompanhar acessos e identificar situações que merecem atenção.

## O que foi realizado

Durante a atividade, foram explorados os arquivos de registro do servidor, com atenção especial às informações relacionadas ao acesso remoto por SSH.

Também foi verificada a data e a hora do sistema, além de serem consultados os históricos de acesso para identificar tentativas de entrada bem-sucedidas e malsucedidas.

As informações encontradas foram organizadas em arquivos de documentação, acompanhadas de capturas de tela e armazenadas no GitHub. Ao final, foram feitas análises com apoio do ChatGPT e do Claude para complementar a interpretação dos resultados.

## O que foi identificado

A análise mostrou que o servidor possuía registros de diferentes atividades, permitindo acompanhar seu funcionamento e consultar informações sobre os acessos realizados.

Nos registros SSH analisados, foram identificados 11 acessos bem-sucedidos e uma tentativa de acesso malsucedida. Essa tentativa foi seguida por um acesso bem-sucedido poucos segundos depois.

Esse resultado chamou a atenção para a importância de acompanhar os registros de acesso. No entanto, os dados encontrados não são suficientes para afirmar que houve uma invasão ou atividade maliciosa.

Também foram identificados pontos que podem ser melhorados, como a revisão das formas de autenticação e a verificação das regras de acesso ao servidor.

## Resultado e aprendizado

A atividade permitiu colocar em prática a análise de registros de um servidor Linux, compreender melhor como acompanhar os acessos realizados e reconhecer a importância dessas informações para a segurança e a administração de sistemas.

Além da análise técnica, foi possível organizar as evidências, documentar os procedimentos e utilizar ferramentas de inteligência artificial como apoio na interpretação dos dados.

**Documentação técnica e evidências:** disponíveis nos arquivos Markdown e na pasta `Imagens/` desta atividade.
