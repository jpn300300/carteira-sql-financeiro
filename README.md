# Carteira de Ações — Análise com SQL

Análise de carteira de investimentos construída com SQL puro no PostgreSQL.
Projeto desenvolvido como parte da minha trilha de estudos em análise de dados financeiros.

## Objetivo
Simular o ambiente de dados de uma corretora, calculando P&L, patrimônio e
ranking de ativos com queries reais usadas no mercado financeiro.

## Estrutura do banco de dados
- `clientes` — cadastro de investidores e perfil de risco
- `ativos` — ações negociadas com setor de atuação
- `precos_historicos` — histórico de preços por ação e data
- `operacoes` — registro de compras e vendas por cliente

## Análises realizadas
- P&L (lucro/prejuízo) por cliente e por ativo
- Patrimônio total por cliente com ranking
- Retorno percentual por ação no período
- Média móvel de preços com window functions
- Participação percentual de cada operação no total do ativo

## Tecnologias
- PostgreSQL 14
- Window functions: RANK, LAG, AVG OVER, PARTITION BY
- CTEs com WITH encadeadas
- JOINs múltiplos entre 4 tabelas

## Como executar
1. Acesse [db-fiddle.com](https://db-fiddle.com) e selecione PostgreSQL 14
2. Cole o conteúdo de `schema.sql` no lado esquerdo e execute
3. Cole qualquer query do lado direito e execute

## Autor
João Pedro da Rocha Costa Nascimento  
Economia — UFRJ  
[LinkedIn](https://www.linkedin.com/in/joaopedro-economia-ufrj)
