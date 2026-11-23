-- Solicitação 2 teve sua urgência alterada para urgente
UPDATE solicitacao
SET nivel_urgencia = 'URGENTE'
WHERE cod_solicitacao = 2;

-- Solicitação 3 foi atendida pelo hemocentro
UPDATE solicitacao
SET situacao = 'ATENDIDA'
WHERE cod_solicitacao = 3;