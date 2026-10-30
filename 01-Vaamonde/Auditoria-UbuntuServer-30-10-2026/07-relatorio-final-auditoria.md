
# Relatório Final – Auditoria do Ubuntu Server

**Data:** 30/10/2026  
**Unidade curricular:** UC8 – Planejar e executar auditoria de sistemas

## 1. Objetivo

Realizar uma análise do Ubuntu Server, observando seus registros e verificando informações importantes sobre o funcionamento do sistema e os acessos realizados. O objetivo foi conhecer melhor como essas informações podem ajudar a acompanhar as atividades do servidor e identificar situações que merecem atenção.

## 2. Atividades realizadas

Durante a atividade, foram realizadas as seguintes etapas:

- Conferência da data, hora e sincronização do servidor.
- Consulta aos arquivos de registro disponíveis na pasta `/var/log`.
- Verificação dos registros relacionados ao serviço SSH.
- Análise das tentativas de acesso ao servidor.
- Organização das informações e das capturas de tela para documentação.

## 3. Resultados encontrados

A conferência inicial mostrou que a data e a hora do servidor estavam configuradas corretamente e sincronizadas.

Na consulta aos registros, foram encontrados arquivos que armazenam informações sobre o funcionamento do sistema, autenticações, atualizações e outros acontecimentos importantes.

Na análise dos acessos SSH, foram identificados 11 acessos realizados com sucesso e uma tentativa de acesso malsucedida. Essa tentativa aconteceu em 28/10, mas foi seguida por um acesso bem-sucedido poucos segundos depois.

Não foram encontrados registros de tentativas utilizando usuários inexistentes nos resultados consultados.

## 4. Observações

A análise mostrou a importância de acompanhar os registros do servidor, pois eles permitem entender melhor o que acontece no sistema e consultar informações sobre os acessos realizados.

A tentativa de acesso malsucedida merece atenção, mas, considerando apenas os registros encontrados, não é possível afirmar que houve uma invasão.

Também foi identificada uma diferença entre os horários de dois registros relacionados ao SSH, sendo necessário investigar melhor essa situação.

## 5. Conclusão

A atividade permitiu conhecer melhor os registros do Ubuntu Server e entender como eles podem ser utilizados para acompanhar o funcionamento do sistema e verificar os acessos realizados.

Com as consultas e análises feitas, foi possível encontrar informações importantes, identificar uma tentativa de acesso malsucedida e perceber a importância de manter o acompanhamento dos registros.

Assim, o objetivo da atividade foi alcançado, proporcionando uma experiência prática de análise e auditoria de um servidor.

---

**Documentos complementares:** arquivos de análise `01`, `02`, `03`, `05` e `06`.

**Evidências:** pasta `Imagens/`.
