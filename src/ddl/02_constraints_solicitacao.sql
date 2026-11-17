ALTER TABLE solicitacao
    ADD CONSTRAINT ck_solicitacao_quantidade CHECK (quantidade > 0);

ALTER TABLE solicitacao
    ADD CONSTRAINT ck_solicitacao_situacao CHECK (situacao IN ('Pendente', 'Aprovada', 'Rejeitada'));