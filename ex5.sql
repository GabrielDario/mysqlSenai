/* 1 */
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

/* #2 */
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
id_produto int,
id_categoria int,
id INT PRIMARY KEY auto_increment,
foreign key(id_produto) references produtos(id),
foreign key(id_categoria) references categorias(id)
);

insert into categorias  (nome) 
values ('Video game',('Eletrodomésticos');


insert into produtos  (nome) 
values ('Xbox one S'),('Playstation'),('Geladeira'),('Fogão');

insert into produtos_categoria  (id_produto,id_categoria) 
values (1,1),(2,1),(3,2),(4,2);


/* #3 */
create schema Empresa;
use Empresa;

CREATE TABLE Departamento (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(30)
);

CREATE TABLE Funcionario (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(30),
id_departamento INT,
foreign key(id_departamento) references Departamento(id)
);


insert into departamento  (nome) 
values ('RH'),('Depósito'),('Comércio'),('Venda');


insert into funcionario  (nome, id_departamento) 
values ('João', 1),('Pedro', 2),('Maria', 3),('José', 4);

insert into funcionario  (nome, id_departamento) 
values ('Ana', 3),('Larissa', 3),('Letícia', 2),('Gustavo', 1);

SELECT funcionario.nome , departamento.nome 
FROM funcionario
INNER JOIN departamento
ON funcionario.id_departamento  = departamento.id ;

