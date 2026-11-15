CREATE TABLE doacao (
    cod_doacao             INT   NOT NULL AUTO_INCREMENT,
    data_doacao            DATE  NOT NULL,
    volume_ml              INT   NOT NULL,
    cod_triagem            INT   NOT NULL,
    matricula_funcionario  INT   NOT NULL,
    CONSTRAINT pk_doacao PRIMARY KEY (cod_doacao)
);