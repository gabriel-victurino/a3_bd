ALTER TABLE solicitacao
    ADD CONSTRAINT ck_solicitacao_tipo_sanguineo CHECK (tipo_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'));

ALTER TABLE solicitacao
    ADD CONSTRAINT ck_solicitacao_tipo_hemocomponente CHECK (tipo_hemocomponente IN ('Concentrado de hemácias', 'Plasma', 'Plaquetas'));

ALTER TABLE solicitacao
    ADD CONSTRAINT ck_solicitacao_quantidade CHECK (quantidade_bolsas > 0);

ALTER TABLE solicitacao
    ADD CONSTRAINT ck_solicitacao_nivel_urgencia CHECK (nivel_urgencia IN ('NORMAL', 'URGENTE', 'EMERGENCIA'));

ALTER TABLE solicitacao
    ADD CONSTRAINT ck_solicitacao_situacao CHECK (situacao IN ('PENDENTE', 'ATENDIDA', 'CANCELADA'));