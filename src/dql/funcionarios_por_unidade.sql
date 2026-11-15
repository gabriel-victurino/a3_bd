-- Relatorio: quadro de funcionarios por unidade de coleta, com a distribuicao por cargo
SELECT
    u.cod_unidade,
    u.nome AS unidade,
    u.cidade,
    COUNT(f.matricula) AS total_funcionarios,
    SUM(CASE WHEN f.cargo = 'ENFERMEIRO'        THEN 1 ELSE 0 END) AS enfermeiros,
    SUM(CASE WHEN f.cargo = 'TECNICO DE COLETA' THEN 1 ELSE 0 END) AS tecnicos,
    SUM(CASE WHEN f.cargo = 'MEDICO'            THEN 1 ELSE 0 END) AS medicos,
    SUM(CASE WHEN f.cargo = 'ATENDENTE'         THEN 1 ELSE 0 END) AS atendentes
FROM unidade_coleta u
LEFT JOIN funcionario f ON f.cod_unidade = u.cod_unidade
GROUP BY u.cod_unidade, u.nome, u.cidade
ORDER BY total_funcionarios DESC, u.nome;
