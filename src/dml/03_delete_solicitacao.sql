-- Exclui a solicitação 5 caso não possua bolsas vinculadas
DELETE FROM solicitacao
WHERE cod_solicitacao = 5
AND NOT EXISTS (
    SELECT 1
    FROM bolsa
    WHERE bolsa.cod_solicitacao = solicitacao.cod_solicitacao
);