# Modelo relacional: doador e triagem

## DOADOR

```text
DOADOR(
    cod_doador PK,
    nome,
    cpf UK,
    data_nascimento,
    sexo,
    telefone,
    email,
    tipo_sanguineo
)
```

- `cod_doador` identifica unicamente cada doador.
- `cpf` possui restricao de unicidade e aceita somente 11 digitos.
- `sexo` aceita os valores `M` e `F`.
- `tipo_sanguineo` aceita os oito tipos dos sistemas ABO e Rh.

## TRIAGEM

```text
TRIAGEM(
    cod_triagem PK,
    data_hora,
    peso,
    pressao_arterial,
    temperatura,
    nivel_hemoglobina,
    resultado,
    motivo_inaptidao,
    cod_doador FK -> DOADOR(cod_doador),
    matricula_funcionario FK -> FUNCIONARIO(matricula),
    cod_unidade FK -> UNIDADE_COLETA(cod_unidade)
)
```

- Cada triagem pertence a um doador, a um funcionario e a uma unidade de coleta.
- Um doador pode possuir varias triagens ao longo do tempo.
- O resultado aceita somente `APTO` ou `INAPTO`.
- Uma triagem apta nao possui motivo de inaptidao.
- Uma triagem inapta deve registrar o motivo da inaptidao.

## Relacionamentos

| Entidade de origem | Cardinalidade | Entidade de destino | Descricao |
|---|---:|---|---|
| DOADOR | 1:N | TRIAGEM | Um doador pode realizar varias triagens. |
| FUNCIONARIO | 1:N | TRIAGEM | Um funcionario pode ser responsavel por varias triagens. |
| UNIDADE_COLETA | 1:N | TRIAGEM | Uma unidade pode realizar varias triagens. |
| TRIAGEM | 1:0..1 | DOACAO | Uma triagem apta pode gerar no maximo uma doacao. |
