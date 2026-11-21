-- Relatorio: ranking dos funcionarios que mais realizaram coletas
SELECT
    RANK() OVER (ORDER BY COUNT(d.cod_doacao) DESC, SUM(d.volume_ml) DESC) AS posicao,
    f.matricula,
    f.nome AS funcionario,
    f.cargo,
    u.nome AS unidade,
    COUNT(d.cod_doacao) AS total_coletas,
    SUM(d.volume_ml)    AS volume_coletado_ml
FROM funcionario f
JOIN doacao d         ON d.matricula_funcionario = f.matricula
JOIN unidade_coleta u ON u.cod_unidade = f.cod_unidade
GROUP BY f.matricula, f.nome, f.cargo, u.nome
ORDER BY posicao, f.nome;
