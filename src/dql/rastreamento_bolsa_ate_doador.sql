-- Relatorio: rastreamento de uma bolsa ate o doador, o coletor e a unidade de origem
SELECT b.cod_bolsa, b.tipo_hemocomponente AS hemocomponente, b.situacao,
    d.cod_doacao, d.data_doacao, dr.nome AS doador,
    dr.tipo_sanguineo, f.nome AS coletor, u.nome AS unidade FROM bolsa b
JOIN doacao d          ON d.cod_doacao = b.cod_doacao
JOIN triagem t         ON t.cod_triagem = d.cod_triagem
JOIN doador dr         ON dr.cod_doador = t.cod_doador
JOIN funcionario f     ON f.matricula = d.matricula_funcionario
JOIN unidade_coleta u  ON u.cod_unidade = t.cod_unidade
WHERE b.cod_bolsa = 4;
