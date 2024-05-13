
-- a. Query de consulta no dicionário de dados (catálogo). Selecionar
-- todas as tabelas do seu usuário (projeto). Mostrar: nome da tabela
-- (TABELA) ordenado crescente.
-- RESOLUÇÃO:

SELECT table_name AS TABELA
FROM user_tables
ORDER BY table_name;


-- b. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: numero do pedido (PEDIDO),
-- DATA, total da fatura (TOTAL), ordenado decrescente pela data do
-- pedido.
-- RESOLUÇÃO:

SELECT PEDIDO, DATA, TOTAL
FROM PEDIDO
WHERE TOTAL > 2000
ORDER BY DATA DESC;



-- c. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: nome cliente (CLIENTE), numero
-- do pedido (PEDIDO),DATA, total da fatura (TOTAL), ordenado crescente
-- pelo nome do cliente.
-- RESOLUÇÃO:

SELECT C.NOME AS CLIENTE, P.PEDIDO, P.DATA, P.TOTAL
FROM PEDIDO P
JOIN CLIENTE C ON P.CLIENTE = C.CLIENTE
WHERE P.TOTAL > 2000
ORDER BY C.NOME ASC;
