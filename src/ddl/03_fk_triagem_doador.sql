ALTER TABLE triagem
    ADD CONSTRAINT fk_triagem_doador
    FOREIGN KEY (cod_doador) REFERENCES doador (cod_doador);
