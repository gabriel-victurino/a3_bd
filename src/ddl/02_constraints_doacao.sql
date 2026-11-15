ALTER TABLE doacao
    ADD CONSTRAINT uk_doacao_triagem
    UNIQUE (cod_triagem);

ALTER TABLE doacao
    ADD CONSTRAINT ck_doacao_volume
    CHECK (volume_ml > 0);