-- a. Selecionar as constraints criadas da tabela ITEM_PRODUTO. Mostrar:
-- constraint_name (CONSTRAINT), constraint_type (TIPO) e
-- search_condition (CONDICAO). Ordenado pelo nome da constraint.
-- RESOLUÇÃO:

SELECT constraint_name AS CONSTRAINT, constraint_type AS TIPO, search_condition AS CONDICAO
FROM user_constraints
WHERE table_name = 'ITEM_PRODUTO'
ORDER BY constraint_name;





-- b. Criar a view de clientes constante do BD Pedidos (VIEW_CLIENTE)
-- contendo os dados das tabelas CLIENTE, PF e PJ. Em conformidade com a
-- estrutura disponível no MER físico do projeto BD de Pedido.
-- RESOLUÇÃO:

CREATE VIEW VIEW_CLIENTE AS
SELECT C.CLIENTE, C.NOME, C.CIDADE, C.TIPO_CLIENTE, PF.CPF, PJ.CNPJ
FROM CLIENTE C
LEFT JOIN PF ON C.CLIENTE = PF.CLIENTE
LEFT JOIN PJ ON C.CLIENTE = PJ.CLIENTE;
