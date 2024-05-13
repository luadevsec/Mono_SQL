
-- a. Para os itens dos pedidos de NUMERO menor que 20 e maior que 50, com
-- e produtos com código de 203 a 205, inclusive: Multiplicar a
-- QUANTIDADE por 2
-- RESOLUÇÃO:

UPDATE ITEM_PRODUTO
SET QUANTIDADE = QUANTIDADE * 2
WHERE NUMERO < 20 AND NUMERO > 50
  AND CODIGO_PRODUTO BETWEEN 203 AND 205;





-- b. Para o cliente de CODIGO ímpar com vendedor de MATRICULA par: somar
-- 15 na QUANTIDADE.
-- RESOLUÇÃO:

UPDATE ITEM_PRODUTO
SET QUANTIDADE = QUANTIDADE + 15
WHERE MOD(CODIGO_CLIENTE, 2) = 1
  AND MOD(MATRICULA_VENDEDOR, 2) = 0;

-- c. Para pedidos com NUMERO múltiplo de 3: Retirar R$ 0.50 no valor de
-- cada preço unitário.
-- RESOLUÇÃO:

UPDATE ITEM_PRODUTO
SET PRECO_UNITARIO = PRECO_UNITARIO - 0.50
WHERE MOD(NUMERO, 3) = 0;



-- d. Ajustar o valor total de cada item de produto no pedido (VALOR_ITEM),
-- em conformidade com a quantidade e preço unitário.
-- RESOLUÇÃO:

UPDATE ITEM_PRODUTO
SET VALOR_ITEM = QUANTIDADE * PRECO_UNITARIO;



-- e. Ajustar o total da fatura de todos os pedidos, em conformidade com os
-- valores dos itens incluídos em cada pedido.
-- RESOLUÇÃO:



UPDATE PEDIDO
SET TOTAL_FATURA = (
  SELECT SUM(VALOR_ITEM)
  FROM ITEM_PRODUTO
  WHERE ITEM_PRODUTO.NUMERO_PEDIDO = PEDIDO.NUMERO
)
WHERE EXISTS (
  SELECT 1
  FROM ITEM_PRODUTO
  WHERE ITEM_PRODUTO.NUMERO_PEDIDO = PEDIDO.NUMERO
);