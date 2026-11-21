-- Relatorio: quantidade de triagens por motivo de inaptidao
SELECT
    t.motivo_inaptidao,
    COUNT(t.cod_triagem) AS total_ocorrencias,
    COUNT(DISTINCT t.cod_doador) AS doadores_afetados,
    ROUND(AVG(t.nivel_hemoglobina), 1) AS hemoglobina_media
FROM triagem t
WHERE t.resultado = 'INAPTO'
GROUP BY t.motivo_inaptidao
ORDER BY total_ocorrencias DESC, t.motivo_inaptidao;
