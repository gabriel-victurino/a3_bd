ALTER TABLE bolsa
    ADD CONSTRAINT fk_bolsa_solicitacao
    FOREIGN KEY (cod_solicitacao) REFERENCES solicitacao (cod_solicitacao);
