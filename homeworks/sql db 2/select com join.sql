
-- a. Listar os vendedores . Mostrar: Vendedor (MATRICULA e NOME).
-- Ordenados pelo nome decrescente.
-- RESOLUÇÃO:

SELECT MATRICULA, NOME
FROM VENDEDOR
ORDER BY NOME DESC;



-- b. Listar distintamente os clientes PJ. Mostrar: Nome do cliente
-- (CLIENTE), CNPJ e CIDADE onde reside. Ordenados pelo nome do cliente
-- ascendente e, dentro deste, pela cidade descendente.
-- RESOLUÇÃO:

SELECT DISTINCT CLIENTE, CNPJ, CIDADE
FROM CLIENTE
WHERE TIPO_CLIENTE = 'PJ'
ORDER BY CLIENTE ASC, CIDADE DESC;



-- c. Listar os vendedores e seus pedidos já realizados com total de
-- fatura entre R$ 1000,00 e R$ 5000,00, inclusive.. Mostrar: Nome do
-- vendedor (VENDEDOR), número do pedido (PEDIDO),data do pedido (DATA)
-- com a formatação 'dd/mm/yyyy'. Ordenados pelo nome do vendedor
-- descendente e, dentro deste, pela data ascendente.
-- RESOLUÇÃO:

SELECT V.NOME AS VENDEDOR, P.PEDIDO, TO_CHAR(P.DATA, 'dd/mm/yyyy') AS DATA
FROM VENDEDOR V
JOIN PEDIDO P ON V.MATRICULA = P.MATRICULA_VENDEDOR
WHERE P.TOTAL_FATURA BETWEEN 1000 AND 5000
ORDER BY V.NOME DESC, P.DATA ASC;
