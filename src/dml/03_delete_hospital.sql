-- Exclui hospitais que não possuem solicitações vinculadas
DELETE FROM hospital
WHERE NOT EXISTS (
    SELECT 1
    FROM solicitacao
    WHERE solicitacao.cod_hospital = hospital.cod_hospital
);