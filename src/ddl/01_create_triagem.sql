CREATE TABLE triagem (
    cod_triagem            INT           NOT NULL AUTO_INCREMENT,
    data_hora               DATETIME      NOT NULL,
    peso                    DECIMAL(5,2)  NOT NULL,
    pressao_arterial        VARCHAR(7)    NOT NULL,
    temperatura             DECIMAL(4,1)  NOT NULL,
    nivel_hemoglobina       DECIMAL(4,1)  NOT NULL,
    resultado               VARCHAR(10)   NOT NULL,
    motivo_inaptidao        VARCHAR(255)  NULL,
    cod_doador              INT           NOT NULL,
    matricula_funcionario   INT           NOT NULL,
    cod_unidade             INT           NOT NULL,
    CONSTRAINT pk_triagem PRIMARY KEY (cod_triagem)
);
