-- Relatorio: frequencia e impacto dos motivos de inaptidao nas triagens
WITH inaptidoes AS (
    SELECT
        motivo_inaptidao,
        COUNT(*) AS total_ocorrencias,
        COUNT(DISTINCT cod_doador) AS doadores_afetados,
        ROUND(AVG(peso), 2) AS peso_medio,
        ROUND(AVG(temperatura), 1) AS temperatura_media,
        ROUND(AVG(nivel_hemoglobina), 1) AS hemoglobina_media,
        MIN(data_hora) AS primeira_ocorrencia,
        MAX(data_hora) AS ultima_ocorrencia
    FROM triagem
    WHERE resultado = 'INAPTO'
    GROUP BY motivo_inaptidao
)
SELECT
    motivo_inaptidao,
    total_ocorrencias,
    doadores_afetados,
    ROUND(
        100.0 * total_ocorrencias
        / SUM(total_ocorrencias) OVER (),
        2
    ) AS percentual_das_inaptidoes,
    DENSE_RANK() OVER (
        ORDER BY total_ocorrencias DESC
    ) AS posicao_frequencia,
    peso_medio,
    temperatura_media,
    hemoglobina_media,
    primeira_ocorrencia,
    ultima_ocorrencia
FROM inaptidoes
ORDER BY posicao_frequencia, motivo_inaptidao;
