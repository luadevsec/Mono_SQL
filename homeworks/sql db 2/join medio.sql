-- a. Inserir uma prateleira de código 390, descrição 'Prateleira de
-- teste' e número de seções 2.
-- RESOLUÇÃO:

INSERT INTO PRATELEIRA (CODIGO, DESCRICAO, NUM_SECOES)
VALUES (390, 'Prateleira de teste', 2);



-- b. Listar as prateleiras e os respectivos produtos que podem
-- armazenar. Mostrando a frase 'sem produto' quando não se relaciona
-- com nenhum. Mostrar: Prateleira (CODIGO, DESCRICAO), descrição
-- (PRODUTO) e quantidade distinta de produtos, ordenados pela quantidade
-- de produtos decrescente.
-- RESOLUÇÃO:

SELECT P.CODIGO, P.DESCRICAO, NVL(PRODUTO.DESCRICAO, 'sem produto') AS PRODUTO, COUNT(DISTINCT PRODUTO.PRODUTO) AS QUANTIDADE
FROM PRATELEIRA P
LEFT JOIN PRODUTO ON P.CODIGO = PRODUTO.PRATELEIRA
GROUP BY P.CODIGO, P.DESCRICAO, PRODUTO.DESCRICAO
ORDER BY QUANTIDADE DESC;




-- c. Selecionar todos os clientes da view VIEW_CLIENTE que são PF.
-- Mostrar: CODIGO, NOME e CNPF, ordenado decrescente pelo nome do
-- cliente.
-- RESOLUÇÃO:


SELECT CODIGO, NOME, CNPF
FROM VIEW_CLIENTE
WHERE TIPO_CLIENTE = 'PF'
ORDER BY NOME DESC;



-- d. Listar os pedidos e seus respectivos produtos. Mostrar: numero do
-- pedido (PEDIDO), DATA do pedido, descrição do produto (PRODUTO) e
-- QUANTIDADE de produtos no pedido. Ordenado pela DATA do pedido
-- crescente e, dentro das datas, pelo produto decrescente.
-- RESOLUÇÃO:


SELECT P.PEDIDO, P.DATA, PR.DESCRICAO AS PRODUTO, IP.QUANTIDADE
FROM PEDIDO P
JOIN ITEM_PEDIDO IP ON P.PEDIDO = IP.PEDIDO
LEFT JOIN PRODUTO PR ON IP.PRODUTO = PR.CODIGO
ORDER BY P.DATA ASC, PR.DESCRICAO DESC;
