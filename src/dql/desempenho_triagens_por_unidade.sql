-- Relatorio: quantidade de triagens e resultados por unidade de coleta
SELECT
    u.cod_unidade,
    u.nome AS unidade,
    u.cidade,
    COUNT(t.cod_triagem) AS total_triagens,
    COUNT(DISTINCT t.cod_doador) AS doadores_atendidos,
    SUM(CASE WHEN t.resultado = 'APTO' THEN 1 ELSE 0 END) AS triagens_aptas,
    SUM(CASE WHEN t.resultado = 'INAPTO' THEN 1 ELSE 0 END) AS triagens_inaptas
FROM unidade_coleta u
LEFT JOIN triagem t ON t.cod_unidade = u.cod_unidade
GROUP BY u.cod_unidade, u.nome, u.cidade
ORDER BY total_triagens DESC, u.nome;
