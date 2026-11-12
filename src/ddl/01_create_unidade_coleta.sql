CREATE TABLE unidade_coleta (
    cod_unidade  INT NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100) NOT NULL,
    endereco     VARCHAR(150) NOT NULL,
    cidade       VARCHAR(60) NOT NULL,
    telefone     VARCHAR(15) NOT NULL,
    CONSTRAINT pk_unidade_coleta PRIMARY KEY (cod_unidade)
);