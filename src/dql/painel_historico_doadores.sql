-- Relatorio: historico de triagens e doacoes por doador
SELECT
    dr.cod_doador,
    dr.nome AS doador,
    dr.tipo_sanguineo,
    COUNT(DISTINCT t.cod_triagem) AS total_triagens,
    SUM(CASE WHEN t.resultado = 'APTO' THEN 1 ELSE 0 END) AS triagens_aptas,
    SUM(CASE WHEN t.resultado = 'INAPTO' THEN 1 ELSE 0 END) AS triagens_inaptas,
    COUNT(DISTINCT d.cod_doacao) AS total_doacoes,
    COALESCE(SUM(d.volume_ml), 0) AS volume_total_ml,
    MAX(t.data_hora) AS ultima_triagem
FROM doador dr
LEFT JOIN triagem t ON t.cod_doador = dr.cod_doador
LEFT JOIN doacao d  ON d.cod_triagem = t.cod_triagem
GROUP BY dr.cod_doador, dr.nome, dr.tipo_sanguineo
ORDER BY total_doacoes DESC, dr.nome;
