ALTER TABLE doador
    ADD CONSTRAINT uk_doador_cpf UNIQUE (cpf);

ALTER TABLE doador
    ADD CONSTRAINT ck_doador_cpf CHECK (cpf REGEXP '^[0-9]{11}$');

ALTER TABLE doador
    ADD CONSTRAINT ck_doador_sexo
    CHECK (sexo IN ('M', 'F'));

ALTER TABLE doador
    ADD CONSTRAINT ck_doador_tipo_sanguineo
    CHECK (tipo_sanguineo IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'));
