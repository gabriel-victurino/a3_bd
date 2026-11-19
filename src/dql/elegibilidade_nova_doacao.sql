-- Relatorio: situacao dos doadores para uma nova doacao
WITH triagens_ordenadas AS (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY t.cod_doador
            ORDER BY t.data_hora DESC, t.cod_triagem DESC
        ) AS ordem
    FROM triagem t
),
resumo_doacoes AS (
    SELECT
        t.cod_doador,
        COUNT(d.cod_doacao) AS total_doacoes,
        MAX(d.data_doacao) AS ultima_doacao
    FROM triagem t
    JOIN doacao d ON d.cod_triagem = t.cod_triagem
    GROUP BY t.cod_doador
)
SELECT
    doad.cod_doador,
    doad.nome AS doador,
    doad.sexo,
    doad.tipo_sanguineo,
    TIMESTAMPDIFF(YEAR, doad.data_nascimento, CURDATE()) AS idade,
    ut.data_hora AS data_ultima_triagem,
    ut.resultado AS resultado_ultima_triagem,
    ut.motivo_inaptidao,
    COALESCE(rd.total_doacoes, 0) AS total_doacoes,
    rd.ultima_doacao,
    CASE
        WHEN rd.ultima_doacao IS NULL THEN NULL
        ELSE DATE_ADD(
            rd.ultima_doacao,
            INTERVAL IF(doad.sexo = 'M', 60, 90) DAY
        )
    END AS proxima_data_permitida,
    CASE
        WHEN rd.ultima_doacao IS NULL THEN 0
        ELSE GREATEST(
            DATEDIFF(
                DATE_ADD(
                    rd.ultima_doacao,
                    INTERVAL IF(doad.sexo = 'M', 60, 90) DAY
                ),
                CURDATE()
            ),
            0
        )
    END AS dias_restantes,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, doad.data_nascimento, CURDATE()) NOT BETWEEN 16 AND 69
            THEN 'FORA DA FAIXA ETARIA'
        WHEN ut.cod_triagem IS NULL
            THEN 'SEM TRIAGEM'
        WHEN ut.resultado = 'INAPTO'
            THEN 'NOVA AVALIACAO NECESSARIA'
        WHEN rd.ultima_doacao IS NULL
            THEN 'LIBERADO PELO INTERVALO'
        WHEN CURDATE() >= DATE_ADD(
            rd.ultima_doacao,
            INTERVAL IF(doad.sexo = 'M', 60, 90) DAY
        )
            THEN 'LIBERADO PELO INTERVALO'
        ELSE 'AGUARDAR INTERVALO'
    END AS situacao
FROM doador doad
LEFT JOIN triagens_ordenadas ut
    ON ut.cod_doador = doad.cod_doador
    AND ut.ordem = 1
LEFT JOIN resumo_doacoes rd ON rd.cod_doador = doad.cod_doador
ORDER BY situacao, proxima_data_permitida, doad.nome;
