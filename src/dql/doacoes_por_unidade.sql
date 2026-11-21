-- Relatorio: total de doacoes e volume coletado por unidade de coleta
SELECT
    u.cod_unidade,
    u.nome AS unidade,
    u.cidade,
    COUNT(d.cod_doacao) AS total_doacoes,
    COALESCE(SUM(d.volume_ml), 0) AS volume_total_ml
FROM unidade_coleta u
LEFT JOIN triagem t ON t.cod_unidade = u.cod_unidade
LEFT JOIN doacao d  ON d.cod_triagem = t.cod_triagem
GROUP BY u.cod_unidade, u.nome, u.cidade
ORDER BY total_doacoes DESC, volume_total_ml DESC;
