SELECT * FROM produtos LIMIT 5;

SELECT * FROM clientes LIMIT 3;

SELECT * FROM produtos WHERE nome='Televisão 43"';

INSERT INTO produtos (nome,preco) VALUES ('Macbook Pro 13"', 1700000);
SELECT * FROM produtos WHERE nome='Macbook Pro 13"';

DELETE FROM clientes WHERE nome = 'Orlando Pequeno Jesus';

UPDATE produtos SET preco=8000 WHERE nome = 'Pelúcia Strange Planet com Gatinho';
SELECT * FROM produtos WHERE nome='Pelúcia Strange Planet com Gatinho';

UPDATE produtos SET preco=980000 WHERE nome = 'Violão Lava ME 2';
SELECT * FROM produtos WHERE nome='Violão Lava ME 2';

UPDATE clientes SET cpf=04652651298 WHERE nome = 'Lucca Santarém Branco';
SELECT * FROM clientes WHERE nome='Lucca Santarém Branco';

SELECT * FROM compras LIMIT 3;
SELECT * FROM clientes WHERE nome='Chico Buarque de Holanda';
INSERT INTO compras (id_cliente,id_produto) VALUES (8, 10);

SELECT * FROM clientes WHERE nome='Olga Cascais Fortunato';
SELECT * FROM produtos WHERE nome='Celular Topo de Linha';
INSERT INTO compras (id_cliente,id_produto) VALUES (4, 8);
INSERT INTO compras (id_cliente,id_produto) VALUES (4, 8);

SELECT * FROM clientes WHERE nome='Martinha Lima Zambujal';
SELECT * FROM produtos WHERE nome='Fone Topo de Linha';
SELECT * FROM compras WHERE id_cliente=5;
DELETE FROM clientes WHERE id=6;

SELECT id, nome, preco FROM produtos ORDER BY preco ASC;

SELECT id, nome, preco FROM produtos ORDER BY preco ASC LIMIT 3;

SELECT id, nome, preco FROM produtos ORDER BY preco DESC LIMIT 1;

SELECT id, nome, preco FROM produtos ORDER BY preco ASC LIMIT 1 OFFSET 1;