# 🔎 03 - Análise de Tentativas de Acesso SSH

## 🎯 Objetivo

Identificar tentativas de autenticação no Ubuntu Server, verificando quais acessos foram realizados com sucesso e quais apresentaram falhas.

Essa análise ajuda a identificar possíveis atividades suspeitas e acompanhar a segurança dos acessos remotos ao servidor.

## ⚙️ Comando utilizado

```bash
sudo journalctl -u ssh | grep -E "Failed|Accepted|Invalid user"
```

## 🔎 Explicação do comando

- `sudo`: executa o comando com privilégios administrativos.
- `journalctl`: consulta os registros do sistema.
- `-u ssh`: seleciona os registros do serviço SSH.
- `|`: encaminha os resultados para outro comando.
- `grep`: procura palavras específicas nos registros.
- `-E`: permite pesquisar várias expressões simultaneamente.

### 🔑 Palavras utilizadas na filtragem

| Palavra | Significado |
|---|---|
| `Failed` | Tentativa de autenticação malsucedida. |
| `Accepted` | Autenticação realizada com sucesso. |
| `Invalid user` | Tentativa de acesso utilizando um usuário inexistente. |

## 📋 Resultados identificados

Durante a análise dos registros, foram encontradas as seguintes ocorrências:

### ❌ Tentativa de acesso malsucedida

Foi identificado um registro:

```text
Failed password for srvenzords
from 10.24.86.17
```

**Interpretação:** houve uma tentativa de autenticação com senha incorreta para o usuário `srvenzords`, originada do endereço IP `10.24.86.17`.

### ✅ Autenticações bem-sucedidas

Foram identificados diversos registros:

```text
Accepted password for srvenzords
from 10.24.86.21
```

**Interpretação:** o servidor aceitou autenticações por senha para o usuário `srvenzords`, provenientes do endereço IP `10.24.86.21`.

Também foi identificado acesso bem-sucedido para o usuário `senac`.

### 👤 Usuários inexistentes

Não foram identificadas ocorrências de `Invalid user` nos resultados apresentados.

## 📊 Análise do resultado

A consulta identificou:

- ✅ Diversas autenticações SSH realizadas com sucesso.
- ❌ Pelo menos uma tentativa de autenticação malsucedida.
- 👤 Nenhuma ocorrência de tentativa utilizando usuário inexistente nos resultados apresentados.

As ocorrências demonstram que houve atividades de acesso ao servidor, incluindo uma tentativa com senha incorreta.

Uma falha de autenticação não significa necessariamente uma invasão, pois também pode ocorrer por erro de digitação.

## ✅ Conclusão

A análise dos registros SSH permitiu identificar acessos bem-sucedidos e tentativas de autenticação malsucedidas no Ubuntu Server.

Essas informações são importantes para monitorar as conexões remotas, investigar comportamentos incomuns e auxiliar na identificação de possíveis riscos de segurança.

**Observação:** o comando utilizado não possui filtro de data, portanto pode apresentar registros de períodos anteriores, diferentemente da consulta realizada na etapa 02.
