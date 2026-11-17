CREATE TABLE solicitacao (
    cod_solicitacao    INT          NOT NULL AUTO_INCREMENT,
    cod_hospital       INT          NOT NULL,
    data_solicitacao   DATE         NOT NULL,
    quantidade         INT          NOT NULL,
    situacao VARCHAR(20) NOT NULL,
    CONSTRAINT pk_solicitacao PRIMARY KEY (cod_solicitacao),
);