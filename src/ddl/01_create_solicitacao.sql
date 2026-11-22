CREATE TABLE solicitacao (
    cod_solicitacao INT NOT NULL AUTO_INCREMENT,
    cod_hospital INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    tipo_sanguineo VARCHAR(3) NOT NULL,
    tipo_hemocomponente VARCHAR(30) NOT NULL,
    quantidade_bolsas INT NOT NULL,
    nivel_urgencia VARCHAR(15) NOT NULL,
    situacao VARCHAR(15) NOT NULL,
    CONSTRAINT pk_solicitacao PRIMARY KEY (cod_solicitacao)
);