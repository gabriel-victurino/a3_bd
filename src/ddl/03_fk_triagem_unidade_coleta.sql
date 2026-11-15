ALTER TABLE triagem
    ADD CONSTRAINT fk_triagem_unidade_coleta
    FOREIGN KEY (cod_unidade) REFERENCES unidade_coleta (cod_unidade);
