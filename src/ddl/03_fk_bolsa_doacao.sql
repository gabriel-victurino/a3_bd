ALTER TABLE bolsa
    ADD CONSTRAINT fk_bolsa_doacao
    FOREIGN KEY (cod_doacao) REFERENCES doacao (cod_doacao);
