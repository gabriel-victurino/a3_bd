CREATE TABLE hospital (
    cod_hospital       INT          NOT NULL AUTO_INCREMENT,
    nome               VARCHAR(100) NOT NULL,
    cnpj               CHAR(14)     NOT NULL,
    endereco           VARCHAR(200) NOT NULL,
    telefone           VARCHAR(15)  NOT NULL,
    email              VARCHAR(100) NOT NULL,
    cidade             VARCHAR(60) NOT NULL,
    CONSTRAINT pk_hospital PRIMARY KEY (cod_hospital)
);