
#-------------------------------------------------------------------------------
#QUESTÃO 1
create schema Questao1;
use Questao1;

CREATE TABLE Clientes (
   id_cliente INT PRIMARY KEY,
   nome VARCHAR(50)
);

CREATE TABLE Pedidos (
   id_pedido INT PRIMARY KEY,
   id_cliente INT,
   produto VARCHAR(50),
   FOREIGN KEY (id_cliente) references Clientes(id_cliente)
);

insert into clientes (id_cliente, nome)
values(1, 'Joao'), (2,'Pedro');

insert into Pedidos (id_pedido, id_cliente, produto)
values(1, 1, 'Papel'), (2,2, 'Caneta');

select c.nome, p.produto
from clientes c
inner join pedidos p
on c.id_cliente = p.id_pedido; #or having (id_cliente)

#--------------------------------------
#2 
create schema Questao2;
use Questao2;

CREATE TABLE Aluno (
   id_aluno INT PRIMARY KEY,
   nome VARCHAR(50)
);

CREATE TABLE Cursos (
   id_curso INT PRIMARY KEY,
   nome_curso VARCHAR(50)
);

CREATE TABLE Matriculas (
   id_aluno INT,
   id_curso INT,
   primary key (id_aluno,id_curso),
   FOREIGN KEY (id_aluno) references Aluno(id_aluno),
   FOREIGN KEY (id_curso) references Cursos(id_curso)
);

insert into Aluno (id_aluno, nome)
values(3, 'Joao P'), (4,'Pedro s');

insert into Cursos (id_curso, nome_curso)
values(3, 'Estetica'), (4, 'Moda');

insert into Matriculas (id_aluno, id_curso)
values(3, 3), (4, 1) ;

select a.nome , c.nome_curso as curso
FROM aluno a
INNER JOIN matriculas m
on m.id_curso = a.id_aluno
inner join cursos c
ON c.id_aluno = a.id_aluno 
order by nome;
#--------------------------------------
#3
create schema Questao3;
use Questao3;

CREATE TABLE Departamentos (
   id_departamento INT PRIMARY KEY,
   nome_departamento VARCHAR(50)
);
CREATE TABLE Funcionarios (
   id_funcionário INT PRIMARY KEY,
   nome VARCHAR(50),
   id_departamento int,
   foreign key (id_departamento) references Departamentos(id_departamento)
);

insert into Departamentos (id_departamento, nome_departamento)
values(1, 'T.I'), (2,'Financeiro');

insert into Funcionarios (id_funcionário, nome, id_departamento)
values(1, 'Israel',1), (2, 'José',2);

select f.nome , d.nome_departamento
from funcionarios f
inner join departamento d
on f.id_departamento = d.id_departamento ;
#--------------------------------------
#4 
create schema Questao4;
use Questao4;

CREATE TABLE Produto (
   id_produto INT PRIMARY KEY,
   nome_produto VARCHAR(50)
);
CREATE TABLE Vendas (
   id_venda INT PRIMARY KEY,
   quantidade int,
   id_produto int,
   foreign key (id_produto) references Produto(id_produto)
);

insert into Produto (id_produto, nome_produto)
values(1, 'Sabonete'), (2,'Quiboa');

insert into Vendas (id_venda, quantidade, id_produto)
values(1, 5 ,1), (2, 7,2);

select p.nome_produto, quantidade as qnt_vendida_p_venda
from produto p 
inner join vendas v 
on p.id_produto = v.id_produto ;

#--------------------------------------
#5 
create schema Questao5;
use Questao5;

CREATE TABLE Autores (
   id_autor INT PRIMARY KEY,
   nome_autor VARCHAR(50)
);
CREATE TABLE Livros (
   id_livro INT PRIMARY KEY,
   titulo VARCHAR(50),
   id_autor int,
   foreign key (id_autor) references Autores(id_autor)
);

insert into Autores (id_autor, nome_autor)
values(1, 'Stephen King'), (2,'Edgar Allan Poe');

insert into Livros (id_livro, titulo, id_autor)
values(1, 'O Iluminado' ,1), (2, 'O Corvo', 2);

select a.nome_autor, l.titulo 
from autores a
inner join livros l
on a.id_autor = l.id_autor  ;
#--------------------------------------
#6 
create schema Questao6;
use Questao6;

CREATE TABLE Usuarios (
   id_usuario INT PRIMARY KEY,
   nome_usuario VARCHAR(50)
);
CREATE TABLE Posts (
   id_post INT PRIMARY KEY,
   conteudo VARCHAR(50),
   id_usuario int,
   foreign key (id_usuario) references Usuarios(id_usuario)
);

insert into Usuarios  (id_usuario, nome_usuario)
values(1, 'Gabriel'), (2,'Reginaldo');

insert into Posts (id_post, conteudo, id_usuario)
values(3, 'NÃO!' ,2), (4, 'Foii', 2);

select u.nome_usuario, p.conteudo
from usuarios u 
inner join posts p  
on u.id_usuario = p.id_usuario  ;
#--------------------------------------
#7 
create schema Questao7;
use Questao7;

CREATE TABLE Categorias (
   id_categoria INT PRIMARY KEY,
   nome_categoria VARCHAR(50)
);
CREATE TABLE Produtos (
   id_produto INT PRIMARY KEY,
   nome_produto VARCHAR(50),
   id_categoria int,
   foreign key (id_categoria) references Categorias(id_categoria)
);

insert into Categorias  (id_categoria, nome_categoria)
values(1, 'Higiene'), (2,'Embalados');

insert into Produtos (id_produto, nome_produto, id_categoria)
values(1, 'Escova de dente' ,1), (2, 'Sardinha', 2);

select c.nome_categoria , p.nome_produto 
from categorias c 
inner join produtos p  
on c.id_categoria = p.id_categoria  ;
#--------------------------------------
#8 
create schema Questao8;
use Questao8;

CREATE TABLE Clientes (
   id_cliente INT PRIMARY KEY,
   nome VARCHAR(50)
);

CREATE TABLE Pedidos (
   id_pedido INT PRIMARY KEY,
   id_cliente INT,
   produto VARCHAR(50),
   FOREIGN KEY (id_cliente) references Clientes(id_cliente)
);

create table pagamentos(
  id_pagamento int primary key,
  id_pedido INT ,
  valor int,
  FOREIGN KEY (id_pedido) references Pedidos(id_pedido)
);

insert into clientes (id_cliente, nome)
values(1, 'Joao'), (2,'Pedro');

insert into Pedidos (id_pedido, id_cliente, produto)
values(1, 1, 'Papel'), (2,2, 'Caneta');

insert into pagamentos(id_pagamento,id_pedido,valor)
values(1,1,250),(2,2,500);

select c.nome, pe.id_pedido , pa.valor
from clientes c 
inner join pedidos pe 
on c.id_cliente = pe.id_cliente
inner join pagamentos pa 
on  pa.id_pedido = pe.id_pedido ;
#--------------------------------------
#9 
create schema Questao9;
use Questao9;

CREATE TABLE Alunos (
   id_aluno INT PRIMARY KEY,
   nome VARCHAR(50)
);

CREATE TABLE Notas (
   id_nota INT PRIMARY KEY,
   id_aluno INT,
   valor int,
   FOREIGN KEY (id_aluno) references Alunos(id_aluno)
);

insert into Alunos(id_aluno, nome)
values(1,'Joao'),(2,'Pedro'),(3,'Henrique'),(4,'Paulo'),(5,'Gabriel');

insert into Notas(id_nota, id_aluno, valor)
values(1,1, 7),(2, 2,7.5),(3,3, 9),(4,1, 6),(5,5,3);

select a.nome,n.valor
from alunos a 
inner join notas n 
on a.id_aluno = n.id_aluno;

#--------------------------------------
#10
create schema Questao10;
use Questao10;

CREATE TABLE Clientes (
   id_cliente INT PRIMARY KEY,
   nome VARCHAR(50)
);

create table COMPRAS (
 id_compras INT PRIMARY KEY,
 id_cliente int,
 valor int,
 foreign key (id_cliente) references Clientes(id_cliente)
 );

insert into Clientes(id_cliente, nome)
values(1,'Joao'),(2,'Pedro'),(3,'Henrique'),(4,'Paulo'),(5,'Gabriel');

insert into COMPRAS(id_compras, id_cliente, valor)
values(6,5, 70),(7,1,60),(8,4, 90),(9,2, 60),(10,3,40);

select cl.nome, sum(valor) as valor_total
from Clientes cl
inner join compras co 
on cl.id_cliente = co.id_cliente
group by nome ;

#--------------------------------------
#11 
create schema Questao11;
use Questao11;


CREATE TABLE Clientes (
   id_cliente INT PRIMARY KEY,
   nome VARCHAR(50)
);

CREATE TABLE Pedidos (
   id_pedido INT PRIMARY KEY,
   id_cliente INT,
   produto VARCHAR(50),
   FOREIGN KEY (id_cliente) references Clientes(id_cliente)
);

insert into clientes (id_cliente, nome)
values(1, 'Joao'), (2,'Pedro'), (3,'Gabriel'), (4,'Vinicius'), (5,'Henrique');

insert into Pedidos (id_pedido, id_cliente, produto)
values(1, 1, 'Papel'), 
(2,2, 'Caneta'), 
(3,5, 'Borracha'), 
(4,4, 'Lápis'), 
(5,5, 'Caneta');

select c.nome, p.produto 
from clientes c 
left join pedidos p 
on c.id_cliente  = p.id_cliente ;

#--------------------------------------
#12 
create schema Questao12;
use Questao12;

CREATE TABLE Alunos (
   id_aluno INT PRIMARY KEY,
   nome VARCHAR(50)
);

CREATE TABLE Notas (
   id_nota INT PRIMARY KEY,
   id_aluno INT,
   valor int,
   FOREIGN KEY (id_aluno) references Alunos(id_aluno)
);

insert into Alunos(id_aluno, nome)
values(1,'Joao'),(2,'Pedro'),(3,'Henrique'),(4,'Paulo'),(5,'Gabriel');

insert into Notas(id_nota, id_aluno, valor)
values(1,1, 7),(2, 2,7.5),(3,3, 9),(4,1, 6),(5,5,3);

select a.nome,n.valor
from alunos a 
left join notas n 
on a.id_aluno = n.id_aluno;
#--------------------------------------
#13 
create schema Questao13;
use Questao13;

CREATE TABLE Departamentos (
   id_departamento INT PRIMARY KEY,
   nome_departamento VARCHAR(50)
);
CREATE TABLE Funcionarios (
   id_funcionário INT PRIMARY KEY,
   nome VARCHAR(50),
   id_departamento int,
   foreign key (id_departamento) references Departamentos(id_departamento)
);

insert into Departamentos (id_departamento, nome_departamento)
values(1, 'T.I'),
(2,'Financeiro'), 
(3,'Depósito'), 
(4,'Comericial'),
(5,'Diretoria');

insert into Funcionarios (id_funcionário, nome, id_departamento)
values(1, 'Israel',1), 
(2, 'José',2),
(3,'Paulo',1), 
(4,'Rose',3),
(5,'Pimpolho',2);

select d.nome_departamento  , f.nome 
from departamentos d
left join funcionarios f 
on f.id_departamento  = d.id_departamento  ;
#--------------------------------------
#14 
create schema Questao14;
use Questao14;

CREATE TABLE Clientes (
   id_cliente INT PRIMARY KEY,
   nome VARCHAR(50)
);

create table COMPRAS (
 id_compras INT PRIMARY KEY,
 id_cliente int,
 valor int,
 foreign key (id_cliente) references Clientes(id_cliente)
 );

insert into Clientes(id_cliente, nome)
values(1,'Joao'),(2,'Pedro'),(3,'Henrique'),(4,'Paulo'),(5,'Gabriel');

insert into COMPRAS(id_compras, id_cliente, valor)
valuesvalues(6,5, 70),(7,1,60),(8,4, 90),(9,2, 60),(10,3,40),
(1, null, 40),(2, null, 40);

select co.id_compras , cl.nome
from Clientes cl
right join compras co 
on cl.id_cliente = co.id_cliente
group by id_compras ;
#--------------------------------------
#15
create schema Questao15;
use Questao15;


CREATE TABLE Aluno (
   id_aluno INT PRIMARY KEY,
   nome VARCHAR(50)
);

CREATE TABLE Cursos (
   id_curso INT PRIMARY KEY,
   nome_curso VARCHAR(50)
);

CREATE TABLE Matriculas (
   id_aluno INT,
   id_curso INT,
   primary key (id_aluno,id_curso),
   FOREIGN KEY (id_aluno) references Aluno(id_aluno),
   FOREIGN KEY (id_curso) references Cursos(id_curso)
);

insert into Aluno (id_aluno, nome)
values(1, 'Joao'), (2,'Pedro'),(3,'Gabriel'),(4,'Thiago');

insert into Cursos (id_curso, nome_curso)
values(1, 'Estetica'), (2, 'Moda'),(3, 'Padeiro'), (4, 'Design');

insert into Matriculas (id_aluno, id_curso)
values(1, 2), (1, 1), (3, 4), (3, 2), (4,1),(4,2),(4,3) ;

select a.nome  , c.nome_curso as curso
FROM aluno a  
INNER JOIN matriculas m 
ON m.id_aluno = a.id_aluno  
inner join cursos c 
ON  m.id_curso = c.id_curso  ;
#--------------------------------------
#16
create schema Questao16;
use Questao16;

CREATE TABLE Clientes (
id_cliente INT PRIMARY KEY,
nome VARCHAR(50)
);


CREATE TABLE Pedidos (
id_pedido INT PRIMARY KEY,
id_cliente INT,
data_pedido date,
FOREIGN KEY (id_cliente) references Clientes(id_cliente)
);


insert into clientes (id_cliente, nome)
values(1, 'Joao'), (2,'Pedro'), (3,'Gabriel'), (4,'Vinicius'), (5,'Henrique');

insert into Pedidos (id_pedido, id_cliente, data_pedido)
values(6, 1, '2020-04-19'),
(7,2, '2012-01-20'),
(8,5, '2019-02-22'),
(9,4, '2021-10-19'),
(10,5, '2020-08-18');

select c.nome ,
count(p.id_cliente) as qnt_pedidos,
max(p.data_pedido) as data_pedido
from clientes c
inner join pedidos p
on c.id_cliente = p.id_cliente
group by c.nome
order by data_pedido ;