-- Relatorio: estoque de bolsas disponiveis por tipo sanguineo e hemocomponente
SELECT dr.tipo_sanguineo, b.tipo_hemocomponente AS hemocomponente,
    COUNT(b.cod_bolsa) AS total_bolsas,
    SUM(b.volume_ml) AS volume_total_ml FROM bolsa b
JOIN doacao d  ON d.cod_doacao = b.cod_doacao
JOIN triagem t ON t.cod_triagem = d.cod_triagem
JOIN doador dr ON dr.cod_doador = t.cod_doador
WHERE b.situacao = 'DISPONIVEL' AND b.data_validade >= CURDATE()
GROUP BY dr.tipo_sanguineo, b.tipo_hemocomponente
ORDER BY dr.tipo_sanguineo, b.tipo_hemocomponente;
