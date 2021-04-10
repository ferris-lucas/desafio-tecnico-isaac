CREATE SCHEMA TESTE_2;

CREATE TABLE vendas_cardapio (
                data DATE NOT NULL,
                id_item INT NOT NULL,
                preco FLOAT NOT NULL,
                qt_vendidas INT NOT NULL
);

CREATE TABLE itens_cardapio (
                id_item INT NOT NULL,
                nome VARCHAR(30) NOT NULL,
                gluten VARCHAR(3) NOT NULL,
                media_preco FLOAT NOT NULL
);

INSERT INTO vendas_cardapio VALUES
('2020-06-09', 111, 6.5, 32),
('2020-06-10', 200, 7, 22),
('2020-06-10', 340, 5.25, 15),
('2020-06-11', 111, 8, 50),
('2020-06-11', 340, 5.5, 9),
('2020-06-10', 111, 6.5, 20),
('2020-06-11', 200, 7, 10);

INSERT INTO itens_cardapio VALUES
(111, 'Café expresso', 'nao', 6.5),
(112, 'Cookie de Laranja', 'sim', 8.49),
(200, 'Suco de Abacaxi', 'nao', 7),
(340, 'Pão de queijo', 'sim', 5);

SELECT DATE_FORMAT(data, '%d/%m/%Y'), id_item, preco, qt_vendidas
FROM vendas_cardapio;

/* a. Qual foi o nome do produto que mais teve quantidades vendidas durante o período todo  (dia 09 ao 11)? */

-- para retornar nome e quantidade total
SELECT itens_cardapio.nome, SUM(vendas_cardapio.qt_vendidas) AS qtd_total
FROM itens_cardapio
INNER JOIN vendas_cardapio ON vendas_cardapio.id_item = itens_cardapio.id_item
GROUP BY itens_cardapio.nome
LIMIT 1;

-- para retornar somente o nome
SELECT itens_cardapio.nome
FROM itens_cardapio
INNER JOIN vendas_cardapio ON vendas_cardapio.id_item = itens_cardapio.id_item
GROUP BY itens_cardapio.nome
LIMIT 1;

/* b. Qual foi o nome do produto que não teve alteração de preço durante os reajustes? Esse produto tem glúten? */

SELECT distinct itens_cardapio.nome, itens_cardapio.gluten
FROM itens_cardapio
RIGHT JOIN vendas_cardapio ON vendas_cardapio.id_item = itens_cardapio.id_item
AND ceiling(vendas_cardapio.preco) = itens_cardapio.media_preco
WHERE vendas_cardapio.preco = itens_cardapio.media_preco;

/*c. Houve algum produto que não vendeu? */
SELECT itens_cardapio.nome
FROM vendas_cardapio
RIGHT JOIN itens_cardapio ON vendas_cardapio.id_item = itens_cardapio.id_item
WHERE vendas_cardapio.qt_vendidas IS NULL;

/* d. Qual foi o valor total de vendas de cada dia? */
SELECT vendas_cardapio.data, SUM(vendas_cardapio.qt_vendidas * vendas_cardapio.preco) AS 'Valor Total Dia'
FROM vendas_cardapio
GROUP BY vendas_cardapio.data;

/* http://sqlfiddle.com/#!9/f9706a/13/4
