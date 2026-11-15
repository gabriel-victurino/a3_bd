CREATE TABLE doador (
    cod_doador       INT          NOT NULL AUTO_INCREMENT,
    nome              VARCHAR(100) NOT NULL,
    cpf               CHAR(11)     NOT NULL,
    data_nascimento   DATE         NOT NULL,
    sexo              CHAR(1)      NOT NULL,
    telefone          VARCHAR(15)  NOT NULL,
    email             VARCHAR(100) NOT NULL,
    tipo_sanguineo    VARCHAR(3)   NOT NULL,
    CONSTRAINT pk_doador PRIMARY KEY (cod_doador)
);
