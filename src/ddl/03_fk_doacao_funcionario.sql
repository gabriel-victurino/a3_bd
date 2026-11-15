ALTER TABLE doacao
    ADD CONSTRAINT fk_doacao_funcionario
    FOREIGN KEY (matricula_funcionario) REFERENCES funcionario (matricula);
