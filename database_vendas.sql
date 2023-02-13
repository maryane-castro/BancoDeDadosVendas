CREATE DATABASE vendas;
\c vendas
CREATE TABLE produtos (id_produto SERIAL PRIMARY KEY, 
                       produto VARCHAR(100) NOT NULL,
                       preco_unitario MONEY NOT NULL DEFAULT 0,
                       estoque INTEGER NOT NULL DEFAULT 0);
CREATE TABLE vendas (id_venda SERIAL PRIMARY KEY,
                     vendedor VARCHAR(100) NOT NULL, 
                     id_produto INTEGER NOT NULL REFERENCES produtos(id_produto),                              valor_unitario MONEY NOT NULL, 
                     quantidade INTEGER NOT NULL, 
                     valor_total MONEY NOT NULL);
\dt
INSERT INTO produtos (produto, valor_unitario, estoque)
VALUES ('Tapioca', 2.50, 20);
\d produtos

INSERT INTO produtos (produto, preco_unitario, estoque)
VALUES ('Tapioca', 2.50, 20);
SELECT * FROM produtos;
INSERT INTO produtos (produto, preco_unitario, estoque)
VALUES ('Cuscuz', 3.10, 40);
SELECT * FROM produtos;