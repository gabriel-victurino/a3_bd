-- Hospital 1 teve seu telefone atualizado
UPDATE hospital
SET telefone = '(48) 3333-4444'
WHERE cod_hospital = 1;

-- Hospital 2 teve seu e-mail atualizado
UPDATE hospital
SET email = 'contato@hospitalvida.com.br'
WHERE cod_hospital = 2;