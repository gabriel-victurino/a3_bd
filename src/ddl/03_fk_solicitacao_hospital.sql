ALTER TABLE solicitacao
    ADD CONSTRAINT fk_solicitacao_hospital
    FOREIGN KEY (cod_hospital)
    REFERENCES hospital (cod_hospital);