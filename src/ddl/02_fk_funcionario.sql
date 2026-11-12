ALTER TABLE funcionario
    ADD CONSTRAINT fk_funcionario_unidade_coleta
    FOREIGN KEY (cod_unidade) REFERENCES unidade_coleta (cod_unidade);