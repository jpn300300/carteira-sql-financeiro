-- =============================================
-- PROJETO FINAL — CARTEIRA DE AÇÕES
-- Autor: João Pedro da Rocha Costa Nascimento
-- Economia — UFRJ
-- =============================================


-- P&L por cliente e por ativo
WITH posicao AS (
  SELECT cliente_id,
         ticker,
         SUM(CASE WHEN tipo = 'compra' THEN quantidade ELSE -quantidade END) AS qtd_liquida,
         SUM(CASE WHEN tipo = 'compra' THEN quantidade * preco_op ELSE -quantidade * preco_op END) AS custo_liquido
  FROM operacoes
  GROUP BY cliente_id, ticker
),
preco_atual AS (
  SELECT ticker, preco AS preco_atual
  FROM precos_historicos
  WHERE data = '2024-01-05'
)
SELECT c.nome,
       p.ticker,
       p.qtd_liquida,
       ROUND(p.custo_liquido, 2)                                  AS custo_total,
       ROUND(p.qtd_liquida * pa.preco_atual, 2)                   AS valor_atual,
       ROUND(p.qtd_liquida * pa.preco_atual - p.custo_liquido, 2) AS pl
FROM posicao p
INNER JOIN clientes c    ON p.cliente_id = c.cliente_id
INNER JOIN preco_atual pa ON p.ticker = pa.ticker
ORDER BY c.nome, p.ticker;


-- patrimônio total por cliente com ranking
WITH posicao AS (
  SELECT cliente_id,
         ticker,
         SUM(CASE WHEN tipo = 'compra' THEN quantidade ELSE -quantidade END) AS qtd_liquida,
         SUM(CASE WHEN tipo = 'compra' THEN quantidade * preco_op ELSE -quantidade * preco_op END) AS custo_liquido
  FROM operacoes
  GROUP BY cliente_id, ticker
),
preco_atual AS (
  SELECT ticker, preco AS preco_atual
  FROM precos_historicos
  WHERE data = '2024-01-05'
),
pl_por_ativo AS (
  SELECT p.cliente_id,
         p.ticker,
         ROUND(p.qtd_liquida * pa.preco_atual - p.custo_liquido, 2) AS pl
  FROM posicao p
  INNER JOIN preco_atual pa ON p.ticker = pa.ticker
)
SELECT c.nome,
       c.perfil,
       ROUND(SUM(pl), 2)                   AS pl_total,
       RANK() OVER (ORDER BY SUM(pl) DESC) AS ranking
FROM pl_por_ativo pl
INNER JOIN clientes c ON pl.cliente_id = c.cliente_id
GROUP BY c.nome, c.perfil
ORDER BY ranking;


-- retorno percentual por ação com ranking
WITH preco_inicial AS (
  SELECT ticker, preco AS preco_ini
  FROM precos_historicos
  WHERE data = '2024-01-02'
),
preco_final AS (
  SELECT ticker, preco AS preco_fim
  FROM precos_historicos
  WHERE data = '2024-01-05'
)
SELECT a.ticker,
       a.nome,
       a.setor,
       pi.preco_ini,
       pf.preco_fim,
       ROUND(pf.preco_fim - pi.preco_ini, 2)                          AS variacao,
       ROUND((pf.preco_fim - pi.preco_ini) / pi.preco_ini * 100, 2)   AS retorno_pct,
       RANK() OVER (ORDER BY (pf.preco_fim - pi.preco_ini) / pi.preco_ini DESC) AS ranking
FROM preco_inicial pi
INNER JOIN preco_final pf ON pi.ticker = pf.ticker
INNER JOIN ativos a       ON pi.ticker = a.ticker
ORDER BY ranking;
