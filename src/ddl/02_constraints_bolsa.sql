ALTER TABLE bolsa
    ADD CONSTRAINT ck_bolsa_situacao
    CHECK (situacao IN ('DISPONIVEL', 'RESERVADA', 'UTILIZADA', 'DESCARTADA'));

ALTER TABLE bolsa
    ADD CONSTRAINT ck_bolsa_hemocomponente
    CHECK (tipo_hemocomponente IN ('CONCENTRADO DE HEMACIAS', 'PLASMA', 'PLAQUETAS'));

ALTER TABLE bolsa
    ADD CONSTRAINT ck_bolsa_volume
    CHECK (volume_ml > 0);