-- Solicitacao 53 teve sua urgencia alterada para urgente
UPDATE solicitacao
SET nivel_urgencia = 'URGENTE'
WHERE cod_solicitacao = 53;

-- Solicitacao 54 foi atendida pelo hemocentro
UPDATE solicitacao
SET situacao = 'ATENDIDA'
WHERE cod_solicitacao = 54;