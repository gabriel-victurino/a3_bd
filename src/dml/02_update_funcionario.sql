-- Henrique foi promovido de tecnico de coleta para enfermeiro
UPDATE funcionario
SET cargo = 'ENFERMEIRO'
WHERE matricula = 8;
-- Elaine foi transferida da Unidade Continente para a Unidade Palhoca
UPDATE funcionario
SET cod_unidade = 3
WHERE matricula = 5;
