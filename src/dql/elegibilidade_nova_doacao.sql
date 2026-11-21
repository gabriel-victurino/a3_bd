-- Relatorio: situacao dos doadores considerando o intervalo entre doacoes
SELECT
    dr.cod_doador,
    dr.nome AS doador,
    dr.sexo,
    dr.tipo_sanguineo,
    MAX(d.data_doacao) AS ultima_doacao,
    CASE
        WHEN MAX(d.data_doacao) IS NULL THEN 'SEM DOACAO ANTERIOR'
        WHEN dr.sexo = 'M' AND DATEDIFF(CURDATE(), MAX(d.data_doacao)) >= 60 THEN 'PODE DOAR'
        WHEN dr.sexo = 'F' AND DATEDIFF(CURDATE(), MAX(d.data_doacao)) >= 90 THEN 'PODE DOAR'
        ELSE 'AGUARDAR INTERVALO'
    END AS situacao
FROM doador dr
LEFT JOIN triagem t ON t.cod_doador = dr.cod_doador
LEFT JOIN doacao d  ON d.cod_triagem = t.cod_triagem
GROUP BY dr.cod_doador, dr.nome, dr.sexo, dr.tipo_sanguineo
ORDER BY dr.nome;
