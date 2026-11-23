-- Relatorio: total de solicitacoes e bolsas por hospital
SELECT
    h.cod_hospital,
    h.nome AS hospital,
    h.cidade,
    COUNT(s.cod_solicitacao) AS total_solicitacoes,
    COALESCE(SUM(s.quantidade_bolsas), 0) AS total_bolsas
FROM hospital h
LEFT JOIN solicitacao s ON s.cod_hospital = h.cod_hospital
GROUP BY h.cod_hospital, h.nome, h.cidade
ORDER BY total_solicitacoes DESC;