# Dependencias funcionais: doador e triagem

## DOADOR

### Chaves candidatas

- `{cod_doador}`
- `{cpf}`

O CPF tambem identifica unicamente um doador devido a restricao `UNIQUE`.

### Dependencias funcionais

```text
cod_doador -> nome, cpf, data_nascimento, sexo, telefone, email, tipo_sanguineo

cpf -> cod_doador, nome, data_nascimento, sexo, telefone, email, tipo_sanguineo
```

Os demais atributos descrevem o doador identificado por uma das chaves candidatas. Nome, telefone, email, sexo e tipo sanguineo nao sao determinantes porque podem se repetir entre doadores.

## TRIAGEM

### Chave candidata

- `{cod_triagem}`

### Dependencias funcionais

```text
cod_triagem -> data_hora, peso, pressao_arterial, temperatura,
               nivel_hemoglobina, resultado, motivo_inaptidao,
               cod_doador, matricula_funcionario, cod_unidade
```

Cada codigo identifica uma unica realizacao de triagem e determina todos os dados clinicos e relacionamentos registrados naquele atendimento.

O resultado e o motivo de inaptidao possuem uma regra de consistencia, mas nao formam uma dependencia funcional:

- Se o resultado for `APTO`, o motivo deve ser nulo.
- Se o resultado for `INAPTO`, o motivo deve ser informado.

Um mesmo resultado inapto pode possuir motivos diferentes, portanto `resultado` nao determina `motivo_inaptidao`.

## Verificacao da terceira forma normal

### Primeira forma normal (1FN)

Todos os atributos armazenam valores atomicos. Nao existem grupos repetidos ou listas dentro de uma coluna.

### Segunda forma normal (2FN)

As chaves primarias de `DOADOR` e `TRIAGEM` possuem apenas um atributo. Assim, nao existem dependencias parciais de uma parte da chave.

### Terceira forma normal (3FN)

Nenhum atributo nao-chave determina outro atributo nao-chave. Os dados do doador, do funcionario e da unidade nao sao repetidos em `TRIAGEM`; apenas suas chaves estrangeiras sao armazenadas. Isso evita dependencias transitivas e anomalias de atualizacao.
