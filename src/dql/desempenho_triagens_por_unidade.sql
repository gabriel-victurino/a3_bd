-- Relatorio: desempenho das triagens por unidade de coleta
SELECT
    u.cod_unidade,
    u.nome AS unidade,
    u.cidade,
    COUNT(t.cod_triagem) AS total_triagens,
    COUNT(DISTINCT t.cod_doador) AS doadores_atendidos,
    COUNT(DISTINCT t.matricula_funcionario) AS funcionarios_envolvidos,
    SUM(CASE WHEN t.resultado = 'APTO' THEN 1 ELSE 0 END) AS triagens_aptas,
    SUM(CASE WHEN t.resultado = 'INAPTO' THEN 1 ELSE 0 END) AS triagens_inaptas,
    COALESCE(
        ROUND(
            100.0 * SUM(CASE WHEN t.resultado = 'APTO' THEN 1 ELSE 0 END)
            / NULLIF(COUNT(t.cod_triagem), 0),
            2
        ),
        0
    ) AS taxa_aptidao_percentual,
    ROUND(AVG(t.peso), 2) AS peso_medio,
    ROUND(AVG(t.temperatura), 1) AS temperatura_media,
    ROUND(AVG(t.nivel_hemoglobina), 1) AS hemoglobina_media,
    MIN(t.data_hora) AS primeira_triagem,
    MAX(t.data_hora) AS ultima_triagem
FROM unidade_coleta u
LEFT JOIN triagem t ON t.cod_unidade = u.cod_unidade
GROUP BY u.cod_unidade, u.nome, u.cidade
ORDER BY taxa_aptidao_percentual DESC, total_triagens DESC, u.nome;
