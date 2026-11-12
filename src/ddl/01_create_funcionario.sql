CREATE TABLE funcionario (
    matricula      INT          NOT NULL AUTO_INCREMENT,
    nome           VARCHAR(100) NOT NULL,
    cpf            CHAR(11)     NOT NULL,
    cargo          VARCHAR(30)  NOT NULL,
    data_admissao  DATE         NOT NULL,
    cod_unidade    INT          NOT NULL,
    CONSTRAINT pk_funcionario PRIMARY KEY (matricula)
);