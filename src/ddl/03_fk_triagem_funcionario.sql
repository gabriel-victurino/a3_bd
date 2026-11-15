ALTER TABLE triagem
    ADD CONSTRAINT fk_triagem_funcionario
    FOREIGN KEY (matricula_funcionario) REFERENCES funcionario (matricula);
