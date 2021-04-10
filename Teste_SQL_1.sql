CREATE SCHEMA TESTE_1;

CREATE TABLE tabela_registros (
                updated_at TIMESTAMP NOT NULL,
                id INT NOT NULL,
                name VARCHAR(100) NOT NULL,
                age INT NOT NULL
);

INSERT INTO tabela_registros VALUES
('2021-03-25 12:59:30', 4, 'Joao Silva', 28),
('2021-03-25 12:59:15', 4, 'Joao Silva', 28),
('2021-03-24 19:50:30', 4, 'João Sil', 28),
('2021-03-24 19:46:30', 4, 'João Silva', 28),
('2021-03-24 19:45:30', 1, 'Marcos Santana', 25),
('2021-03-25 19:44:30', 1, 'Marcos Santana Santos', 25),
('2021-03-24 19:44:30', 3, 'Airton', 60),
('2021-03-24 19:44:30', 5, 'Aurélio', 35),
('2021-03-24 19:44:30', 6, 'Carushow', 27),
('2021-03-24 19:44:30', 7, 'Perlita', 29),
('2021-03-28 00:00:30', 7, 'Perlita', 30),
('2021-03-24 19:44:30', 2, 'Leonardo', 26),
('2021-03-24 15:44:20', 4, 'João Silva', 28),
('2021-03-24 14:20:30', 4, 'João Silva', 28),
('2021-03-24 13:44:30', 4, 'João Silva', 28),
('2021-03-24 12:25:30', 4, 'João Silva', 28),
('2021-03-24 10:44:30', 4, 'João Silva', 22);

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT MAX(tb_id.updated_at), id, name, age
FROM tabela_registros
GROUP BY id;

http://sqlfiddle.com/#!9/3d003b/8/0