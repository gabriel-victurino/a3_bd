-- Remove a triagem inapta de codigo 15, que nao gerou doacao
DELETE FROM triagem
WHERE cod_triagem = 15;
