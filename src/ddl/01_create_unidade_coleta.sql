CREATE TABLE unidade_coleta (
    cod_unidade  INT NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100) NOT NULL,
    endereco     VARCHAR(150) NOT NULL,
    cidade       VARCHAR(60) NOT NULL,
    telefone     VARCHAR(15) NOT NULL,
    CONSTRAINT pk_unidade_coleta PRIMARY KEY (cod_unidade)
);

ALTER TABLE unidade_coleta
    ADD CONSTRAINT uk_unidade_coleta_nome UNIQUE (nome);

ALTER TABLE unidade_coleta
    ADD CONSTRAINT ck_unidade_coleta_telefone CHECK (telefone REGEXP '^[0-9]{10,11}$');