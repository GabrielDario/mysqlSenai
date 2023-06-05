#1
create schema Exercicio51;
use Exercicio51;

CREATE TABLE Clientes (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(30)
);

CREATE TABLE Pedidos (
id INT PRIMARY KEY auto_increment,
data_pedido date,
id_cliente int,
foreign key(id_cliente) references clientes(id)
);

insert into clientes  (nome) 
values ('Gabriel'),
('José');

insert into pedidos  (data_pedido,id_cliente) 
values ('2022-02-02', 1);

select c.nome as nome , p.data_pedido as periodo
from clientes c left join pedidos p 
on c.id = p.id;

#2
create schema Exercicio52;
use Exercicio52;

CREATE TABLE Produtos (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(30)
);

CREATE TABLE Categorias (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(30)
);

CREATE TABLE produtos_categoria (
id INT PRIMARY KEY auto_increment,
);

select p.nome  , c.nome 
FROM produtos p 
INNER JOIN produtos_categoria pc 
ON p.id  = pc.id 
INNER JOIN categorias c 
ON pc.id_categoria  = c.id ;






