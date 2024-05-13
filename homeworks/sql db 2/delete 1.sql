
-- a. Excluir os registros de PEDIDO em que o número seja ímpar, a
-- matrícula do vendedor 102 e o endereço de entrega não seja nulo.
-- Observação: Realizar a exclusão e verificar que os registros foram
-- excluídos apenas na transação.
-- RESOLUÇÃO:

DELETE FROM PEDIDO
WHERE MOD(NUMERO, 2) = 1
  AND MATRICULA_VENDEDOR = 102
  AND ENDERECO_ENTREGA IS NOT NULL;


-- b. Excluir os itens de produtos do menor número de pedido na última data
-- de inclusão de pedido (a data mais recente).
-- Observação: Realizar a exclusão e verificar que os registros foram
-- excluídos apenas na transação.
-- RESOLUÇÃO:

DELETE FROM ITEM_PRODUTO
WHERE NUMERO_PEDIDO = (
  SELECT NUMERO
  FROM PEDIDO
  WHERE DATA_INCLUSAO = (
    SELECT MAX(DATA_INCLUSAO)
    FROM PEDIDO
  )
  AND ROWNUM = 1
);



-- c. Desfazer as exclusões dos itens a. e b. da questão 4) acima.
-- Observação: Verificar que os registros estão nas respectivas tabelas.
-- RESOLUÇÃO:


ROLLBACK;
-- o rollback é uma solução que eu encontrei que refaz todas as mudanças anteriores.