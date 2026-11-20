-- Bolsa 1 venceu e foi marcada como descartada
UPDATE bolsa
SET situacao = 'DESCARTADA'
WHERE cod_bolsa = 1;
