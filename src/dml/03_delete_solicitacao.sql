-- Exclui solicitações que não possuem bolsas vinculadas
DELETE FROM solicitacao
WHERE cod_solicitacao > 0
AND NOT EXISTS (
    SELECT 1
    FROM bolsa
    WHERE bolsa.cod_solicitacao = solicitacao.cod_solicitacao
);