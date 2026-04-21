CREATE TABLE clientes (
  cliente_id  INT,
  nome        VARCHAR(50),
  perfil      VARCHAR(20)
);

CREATE TABLE ativos (
  ticker      VARCHAR(10),
  nome        VARCHAR(50),
  setor       VARCHAR(30)
);

CREATE TABLE precos_historicos (
  ticker      VARCHAR(10),
  data        DATE,
  preco       NUMERIC(10,2)
);

CREATE TABLE operacoes (
  operacao_id INT,
  cliente_id  INT,
  ticker      VARCHAR(10),
  tipo        VARCHAR(10),
  quantidade  INT,
  preco_op    NUMERIC(10,2),
  data        DATE
);

INSERT INTO clientes VALUES
  (1, 'Ana Lima',      'moderado'),
  (2, 'Bruno Soares',  'arrojado'),
  (3, 'Carla Mendes',  'conservador'),
  (4, 'Diego Faria',   'arrojado');

INSERT INTO ativos VALUES
  ('PETR4', 'Petrobras', 'Energia'),
  ('VALE3', 'Vale',      'Mineração'),
  ('ITUB4', 'Itaú',      'Financeiro');

INSERT INTO precos_historicos VALUES
  ('PETR4', '2024-01-02', 38.50),
  ('PETR4', '2024-01-03', 39.10),
  ('PETR4', '2024-01-04', 37.80),
  ('PETR4', '2024-01-05', 40.20),
  ('VALE3', '2024-01-02', 68.90),
  ('VALE3', '2024-01-03', 71.40),
  ('VALE3', '2024-01-04', 70.05),
  ('VALE3', '2024-01-05', 69.30),
  ('ITUB4', '2024-01-02', 32.15),
  ('ITUB4', '2024-01-03', 33.70),
  ('ITUB4', '2024-01-04', 33.10),
  ('ITUB4', '2024-01-05', 34.50);

INSERT INTO operacoes VALUES
  (1,  1, 'PETR4', 'compra', 100, 38.50, '2024-01-02'),
  (2,  1, 'VALE3', 'compra',  50, 68.90, '2024-01-03'),
  (3,  1, 'PETR4', 'venda',   50, 40.20, '2024-01-05'),
  (4,  2, 'ITUB4', 'compra', 200, 32.15, '2024-01-02'),
  (5,  2, 'VALE3', 'compra',  80, 71.40, '2024-01-03'),
  (6,  2, 'ITUB4', 'venda',   50, 34.50, '2024-01-05'),
  (7,  3, 'PETR4', 'compra', 300, 38.50, '2024-01-02'),
  (8,  3, 'VALE3', 'venda',   30, 70.05, '2024-01-04'),
  (9,  3, 'ITUB4', 'compra', 150, 33.10, '2024-01-04'),
  (10, 4, 'PETR4', 'compra', 500, 38.50, '2024-01-02'),
  (11, 4, 'VALE3', 'compra', 200, 68.90, '2024-01-02'),
  (12, 4, 'ITUB4', 'compra', 300, 32.15, '2024-01-02');
