
	-- Criando o banco de Dados
CREATE DATABASE ecommerce;

USE ecommerce;

	-- Criando tabelas
CREATE TABLE pedidos (
    order_id INT,
    customer VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    state VARCHAR(10)
);

INSERT INTO pedidos (order_id,customer,category,price,state)
VALUES
	(1,'João','Eletrônicos',1200,'SP'),
	(2,'Maria','Roupas',200,'RJ'),
	(3,'Carlos','Eletrônicos',800,'MG'),
	(4,'Ana','Casa',350,'SP'),
	(5,'Pedro','Esportes',500,'RS'),
	(6,'Lucas','Eletrônicos',1500,'SP'),
	(7,'Juliana','Roupas',300,'BA'),
	(8,'Fernanda','Casa',400,'SP'),
	(9,'Rafael','Esportes',700,'MG'),
	(10,'Bruna','Eletrônicos',950,'RJ');
    
CREATE TABLE clientes (
    customer VARCHAR(50),
    cidade VARCHAR(50)
);

INSERT INTO clientes VALUES
('João', 'São Paulo'),
('Maria', 'Rio de Janeiro'),
('Carlos', 'Belo Horizonte'),
('Ana', 'São Paulo'),
('Pedro', 'Porto Alegre'),
('Lucas', 'São Paulo'),
('Juliana', 'Salvador'),
('Fernanda', 'São Paulo'),
('Rafael', 'Belo Horizonte'),
('Bruna', 'Rio de Janeiro');
    
-- =====================================================
-- 📊 Análise Geral do Dataset
-- =====================================================

-- Visualização inicial dos dados
SELECT * FROM pedidos;

-- -----------------------------------------------------
-- 💰 Faturamento total
-- Objetivo: calcular o valor total de vendas realizadas
-- -----------------------------------------------------
SELECT 
    SUM(price) AS total_vendas
FROM pedidos;

-- -----------------------------------------------------
-- 📦 Total de pedidos
-- Objetivo: identificar o volume total de pedidos
-- -----------------------------------------------------
SELECT 
    COUNT(*) AS total_pedidos
FROM pedidos;

-- -----------------------------------------------------
-- 🎯 Ticket médio
-- Objetivo: calcular o valor médio por pedido
-- -----------------------------------------------------
SELECT 
    AVG(price) AS ticket_medio
FROM pedidos;

-- -----------------------------------------------------
-- 📊 Vendas por categoria
-- Objetivo: identificar quais categorias geram mais receita
-- -----------------------------------------------------
SELECT 
    category, 
    SUM(price) AS total_vendas
FROM pedidos
GROUP BY category
ORDER BY total_vendas DESC;

-- -----------------------------------------------------
-- 🌎 Vendas por estado
-- Objetivo: analisar a distribuição geográfica da receita
-- -----------------------------------------------------
SELECT 
    state, 
    SUM(price) AS total_vendas
FROM pedidos
GROUP BY state
ORDER BY total_vendas DESC;

-- -----------------------------------------------------
-- 👑 Top clientes
-- Objetivo: identificar os clientes com maior volume de compras
-- -----------------------------------------------------
SELECT 
    customer, 
    SUM(price) AS total_gasto
FROM pedidos
GROUP BY customer
ORDER BY total_gasto DESC
LIMIT 5;

-- -----------------------------------------------------
-- 📈 Clientes acima da média
-- Objetivo: identificar clientes com gasto superior à média
-- -----------------------------------------------------
SELECT 
    customer, 
    SUM(price) AS total_gasto
FROM pedidos
GROUP BY customer
HAVING total_gasto > (
    SELECT AVG(price) FROM pedidos
);

-- -----------------------------------------------------
-- 📈 Quantidade de pedidos por estado
-- -----------------------------------------------------
SELECT state, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY state
ORDER BY total_pedidos DESC;


-- -----------------------------------------------------
-- 📊 Participação percentual por categoria
-- Objetivo: entender a representatividade de cada categoria na receita total
-- -----------------------------------------------------
SELECT 
    category,
    SUM(price) AS total_vendas,
    ROUND(SUM(price) * 100 / (SELECT SUM(price) FROM pedidos), 2) AS percentual
FROM pedidos
GROUP BY category
ORDER BY total_vendas DESC;

-- -----------------------------------------------------
-- 🏆 Ranking de clientes
-- Objetivo: classificar clientes com base no total gasto
-- -----------------------------------------------------
SELECT 
    customer,
    SUM(price) AS total_gasto,
    RANK() OVER (ORDER BY SUM(price) DESC) AS ranking
FROM pedidos
GROUP BY customer;

-- -----------------------------------------------------
-- 🔗 Análise por cliente e cidade (JOIN)
-- Objetivo: integrar dados de pedidos com informações de clientes
-- para identificar padrões de consumo por localização
-- -----------------------------------------------------
SELECT 
    p.customer,
    c.cidade,
    SUM(p.price) AS total_gasto
FROM pedidos p
JOIN clientes c ON p.customer = c.customer
GROUP BY p.customer, c.cidade
ORDER BY total_gasto DESC;