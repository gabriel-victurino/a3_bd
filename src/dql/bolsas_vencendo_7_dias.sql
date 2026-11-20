-- Relatorio: bolsas disponiveis que vencem nos proximos 7 dias
SELECT b.cod_bolsa, b.tipo_hemocomponente AS hemocomponente,
    dr.tipo_sanguineo, b.volume_ml, b.data_validade,
    DATEDIFF(b.data_validade, CURDATE()) AS dias_restantes FROM bolsa b
JOIN doacao d  ON d.cod_doacao = b.cod_doacao
JOIN triagem t ON t.cod_triagem = d.cod_triagem
JOIN doador dr ON dr.cod_doador = t.cod_doador
WHERE b.situacao = 'DISPONIVEL' AND b.data_validade BETWEEN CURDATE() 
AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
ORDER BY b.data_validade, b.cod_bolsa;
