/* #Exercicio 6 */
/*#Criando banco */
create schema Vendas;
use Vendas;

/* Criando Tabelas */
CREATE TABLE Clientes (
id INT PRIMARY KEY auto_increment  ,
nome VARCHAR(30),
email VARCHAR(30)
);

CREATE TABLE Itens_Pedido (
id INT PRIMARY KEY auto_increment ,
nome_produto VARCHAR(30),
quantidade VARCHAR(30),
preco_unitario DECIMAL(10,2)
);

CREATE TABLE pedidos (
id INT PRIMARY KEY auto_increment ,
cliente_id int,
item_pedido_id int,
data_pedido DATE,
valor_total int,
foreign key(cliente_id) references clientes(id) ON DELETE CASCADE,
foreign key(item_pedido_id) references Itens_pedido(id) ON DELETE CASCADE
);

/* INSERINDO DADOS */
insert into clientes (nome,email) 
values ('João Silva', 'joao.silva@gmail.com'),
('Maria Santos', 'maria.santos@hotmail.com'),
('Lucas Oliveira', 'lucas.oliveira@yahoo.com'),
('Julia Souza', 'julia.rocha@gmail.com'),
('Pedro Rocha', 'pedro.rocha@gmail.com'),
('Carla Lima', 'carla.lima@hotmail.com'),
('Gabriel Almeida', 'gabriel.almeida@yahoo.com'),
('Fernanda Costa', 'fernanda.costa@gmail.com'),
('Paula Santos', 'paulo.santos@hotmail.com'),
('Camila Fernandes', 'camila.fernandes@yahoo.com');

insert into itens_pedido  (nome_produto, quantidade, preco_unitario) 
values ('Camiseta branca', 2, 29.90),
 ('Calça jeans', 1, 79.90),
 ('Tênis preto', 1, 99.90),
 ('Camiseta preta', 3, 34.90),
 ('Shorts jeans', 2, 49.90),
 ('Saia preta', 1, 39.90),
 ('Bermuda cargo', 1, 69.90),
 ('Vestido vermelho', 1, 89.90),
 ('Sapato social', 1, 149.90),
 ('Chinelo de dedo', 2, 19.90);

insert into pedidos  (cliente_id, item_pedido_id , data_pedido, valor_total) 
values (1, 2, '2021-04-20', 79.90),
(3, 4, '2018-04-19', 34.90),
(2, 8, '2023-04-18', 89.90),
(4, 4, '2022-04-17', 104.70),
(6, 1, '2023-04-16', 59.80),
(5, 3, '2023-04-15', 99.90),
(7, 9, '2022-04-14', 149.90),
(8, 2, '2019-04-20', 79.90),
(9, 5, '2023-04-19', 99.80),
(10, 1, '2023-04-16', 29.90);

/* #1 */
UPDATE clientes SET nome = 'Maria Santos' WHERE id = 3;

/* #2 */
SELECT nome,email FROM clientes;

/* #3 */
DELETE FROM pedidos  where  valor_total < 50;

/* #4 */
insert into pedidos  (cliente_id, item_pedido_id , data_pedido, valor_total) 
values (
(select id from clientes where nome  like 'Pedro Rocha'),
(select id from itens_pedido where nome_produto  like 'Calça jeans'),
'2022-01-01',150);

/* #5 */
UPDATE itens_pedido  SET quantidade = 3 WHERE id = 5;

/* #6 */
select c.nome, valor_total, data_pedido
from pedidos p
inner join clientes c 
on c.id = p.id;

/* #7 */
delete from itens_pedido where quantidade = 0;

/* #8*/
insert into clientes (nome,email) 
values ('Ana Oliveira', 'ana.oliveira@hotmail.com');

/* #9 */
UPDATE clientes SET email = 'marcos.rodrigues@gmail.com' WHERE id = 2;


/* #10 */
select c.nome, valor_total
from pedidos p
inner join clientes c 
on p.id = c.id and 
p.data_pedido >= '2022-01-01' and 
p.data_pedido < '2023-01-01';

/* #11 */
DELETE FROM clientes
WHERE clientes.id  = ( select id  from
pedidos p where p.id  = 5);

/* #12 */
insert into pedidos  (cliente_id, item_pedido_id , data_pedido, valor_total) 
values ((select id from clientes  where nome  like 'Camila Fernandes'), 
(select id from itens_pedido where nome_produto  like 'Vestido vermelho'),
'2022-02-15', 80);


/* #13 */
UPDATE itens_pedido  SET preco_unitario = 10 WHERE id = 8;

/* #14 CONCERTARRRRRRRRR */
select c.nome , ip.quantidade 
from itens_pedido ip
inner join clientes c 
inner join pedidos p 
on p.data_pedido >= '2019-01-01' and 
p.data_pedido < '2020-01-01'  and 
c.id = p.id  ;


/* #15 */

delete from clientes 
where id not in (select p.cliente_id  from
pedidos p);

/* #16 */
insert into pedidos  (cliente_id, item_pedido_id , data_pedido, valor_total) 
values (2, 
(select id from itens_pedido where nome_produto  like 'Camiseta Preta'),
'2025-03-03', 890);

/* #17 */
UPDATE pedidos  SET valor_total = 500 WHERE id = 4;

/* #18 --------------*/
select c.nome, p.cliente_id , p.item_pedido_id 
from clientes c 
 left join pedidos p 
on c.id = p.id ;

select cliente_id, item_pedido_id 
from pedidos p ; 

/* #19 */
DELETE FROM clientes
WHERE clientes.id  = ( select id  from
pedidos p where p.id  = 1);

/* #20 ARRUMAR */
select c.nome , p.valor_total  
from clientes c 
inner join pedidos p 
on c.id = p.id order by p.valor_total  DESC;