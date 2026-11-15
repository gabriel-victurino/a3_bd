ALTER TABLE triagem
    ADD CONSTRAINT ck_triagem_resultado
    CHECK (resultado IN ('APTO', 'INAPTO'));

ALTER TABLE triagem
    ADD CONSTRAINT ck_triagem_motivo_inaptidao
    CHECK (
        (resultado = 'APTO' AND motivo_inaptidao IS NULL)
        OR
        (resultado = 'INAPTO' AND motivo_inaptidao IS NOT NULL)
    );
