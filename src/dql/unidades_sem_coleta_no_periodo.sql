-- Relatorio: unidades que nao tiveram nenhuma coleta entre setembro e novembro de 2026
SELECT
    u.cod_unidade,
    u.nome AS unidade,
    u.cidade,
    COUNT(d.cod_doacao) AS coletas_no_historico,
    MAX(d.data_doacao)  AS ultima_coleta
FROM unidade_coleta u
LEFT JOIN triagem t ON t.cod_unidade = u.cod_unidade
LEFT JOIN doacao d  ON d.cod_triagem = t.cod_triagem
GROUP BY u.cod_unidade, u.nome, u.cidade
HAVING SUM(CASE WHEN d.data_doacao BETWEEN '2026-09-01' AND '2026-11-30' THEN 1 ELSE 0 END) = 0
ORDER BY ultima_coleta;
