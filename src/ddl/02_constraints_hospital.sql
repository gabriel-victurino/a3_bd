ALTER TABLE hospital
    ADD CONSTRAINT uk_hospital_cnpj UNIQUE (cnpj);

ALTER TABLE hospital
    ADD CONSTRAINT ck_hospital_cnpj CHECK (cnpj REGEXP '^[0-9]{14}$');