CREATE TABLE bolsa (
    cod_bolsa            INT          NOT NULL AUTO_INCREMENT,
    tipo_hemocomponente  VARCHAR(30)  NOT NULL,
    volume_ml            INT          NOT NULL,
    data_validade        DATE         NOT NULL,
    situacao             VARCHAR(15)  NOT NULL,
    cod_doacao           INT          NOT NULL,
    cod_solicitacao      INT          NULL,
    CONSTRAINT pk_bolsa PRIMARY KEY (cod_bolsa)
);