-- Databricks notebook source
SELECT *

FROM silver_olist.pedido

WHERE descSituacao = 'shipped'

-- LIMIT 100

-- leia-se: selecione todas colunas da tabela silver_olist.

-- COMMAND ----------

SELECT *

FROM silver_olist.pedido

WHERE descSituacao = 'shipped'
AND year(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtando pedidos enviados de 2018

-- COMMAND ----------

SELECT *

FROM silver_olist.pedido

WHERE descSituacao = 'shipped' OR descSituacao = 'canceled'
AND year(dtPedido) = '2018'

-- COMMAND ----------

SELECT *

FROM silver_olist.pedido

WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled')
AND year(dtPedido) = '2018'

-- COMMAND ----------

SELECT *

FROM silver_olist.pedido

WHERE descSituacao IN ('shipped', 'canceled')
AND year(dtPedido) = '2018'

-- COMMAND ----------

SELECT *,
       datediff(dtEstimativaEntrega, dtAprovado) AS diffDatasAprovadoEntrega
       
FROM silver_olist.pedido

WHERE descSituacao IN ('shipped', 'canceled')
AND year(dtPedido) = '2018'
AND datediff(dtEstimativaEntrega, dtAprovado) > 30
