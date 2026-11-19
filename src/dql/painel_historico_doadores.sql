-- Relatorio: historico consolidado de triagens e doacoes por doador
WITH resumo_triagens AS (
    SELECT
        cod_doador,
        COUNT(*) AS total_triagens,
        SUM(resultado = 'APTO') AS triagens_aptas,
        SUM(resultado = 'INAPTO') AS triagens_inaptas,
        MAX(data_hora) AS ultima_triagem
    FROM triagem
    GROUP BY cod_doador
),
resumo_doacoes AS (
    SELECT
        t.cod_doador,
        COUNT(d.cod_doacao) AS total_doacoes,
        SUM(d.volume_ml) AS volume_total_ml,
        MAX(d.data_doacao) AS ultima_doacao
    FROM triagem t
    JOIN doacao d ON d.cod_triagem = t.cod_triagem
    GROUP BY t.cod_doador
)
SELECT
    doad.cod_doador,
    doad.nome AS doador,
    doad.tipo_sanguineo,
    TIMESTAMPDIFF(YEAR, doad.data_nascimento, CURDATE()) AS idade,
    COALESCE(rt.total_triagens, 0) AS total_triagens,
    COALESCE(rt.triagens_aptas, 0) AS triagens_aptas,
    COALESCE(rt.triagens_inaptas, 0) AS triagens_inaptas,
    rt.ultima_triagem,
    COALESCE(rd.total_doacoes, 0) AS total_doacoes,
    COALESCE(rd.volume_total_ml, 0) AS volume_total_ml,
    rd.ultima_doacao,
    CASE
        WHEN rt.cod_doador IS NULL THEN 'SEM TRIAGEM'
        WHEN rd.cod_doador IS NULL THEN 'SEM DOACAO'
        ELSE 'DOADOR ATIVO'
    END AS situacao
FROM doador doad
LEFT JOIN resumo_triagens rt ON rt.cod_doador = doad.cod_doador
LEFT JOIN resumo_doacoes rd ON rd.cod_doador = doad.cod_doador
ORDER BY total_doacoes DESC, rt.ultima_triagem DESC, doad.nome;
