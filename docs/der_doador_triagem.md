# Diagrama entidade-relacionamento: doador e triagem

```mermaid
erDiagram
    DOADOR ||--o{ TRIAGEM : realiza
    FUNCIONARIO ||--o{ TRIAGEM : executa
    UNIDADE_COLETA ||--o{ TRIAGEM : recebe
    TRIAGEM ||--o| DOACAO : gera

    DOADOR {
        INT cod_doador PK
        VARCHAR nome
        CHAR cpf UK
        DATE data_nascimento
        CHAR sexo
        VARCHAR telefone
        VARCHAR email
        VARCHAR tipo_sanguineo
    }

    TRIAGEM {
        INT cod_triagem PK
        DATETIME data_hora
        DECIMAL peso
        VARCHAR pressao_arterial
        DECIMAL temperatura
        DECIMAL nivel_hemoglobina
        VARCHAR resultado
        VARCHAR motivo_inaptidao
        INT cod_doador FK
        INT matricula_funcionario FK
        INT cod_unidade FK
    }

    FUNCIONARIO {
        INT matricula PK
        VARCHAR nome
        VARCHAR cargo
        INT cod_unidade FK
    }

    UNIDADE_COLETA {
        INT cod_unidade PK
        VARCHAR nome
        VARCHAR cidade
    }

    DOACAO {
        INT cod_doacao PK
        DATE data_doacao
        INT volume_ml
        INT cod_triagem FK
        INT matricula_funcionario FK
    }
```

## Leitura das cardinalidades

- Um doador pode realizar nenhuma ou varias triagens; cada triagem pertence a exatamente um doador.
- Um funcionario pode executar nenhuma ou varias triagens; cada triagem possui um funcionario responsavel.
- Uma unidade de coleta pode receber nenhuma ou varias triagens; cada triagem ocorre em uma unidade.
- Uma triagem apta pode gerar nenhuma ou uma doacao; cada doacao possui uma triagem de origem.
