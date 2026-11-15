ALTER TABLE doacao
    ADD CONSTRAINT fk_doacao_triagem
    FOREIGN KEY (cod_triagem) REFERENCES triagem (cod_triagem);
