-- Relatorio: quantidade de triagens realizadas por funcionario, com o resultado (apto/inapto)
SELECT
    f.matricula,
    f.nome AS funcionario,
    f.cargo,
    u.nome AS unidade,
    COUNT(t.cod_triagem) AS total_triagens,
    SUM(CASE WHEN t.resultado = 'APTO'   THEN 1 ELSE 0 END) AS aptos,
    SUM(CASE WHEN t.resultado = 'INAPTO' THEN 1 ELSE 0 END) AS inaptos
FROM funcionario f
JOIN unidade_coleta u ON u.cod_unidade = f.cod_unidade
LEFT JOIN triagem t   ON t.matricula_funcionario = f.matricula
GROUP BY f.matricula, f.nome, f.cargo, u.nome
ORDER BY total_triagens DESC, f.nome;
