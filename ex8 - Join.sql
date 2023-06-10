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

#Escreva uma consulta SQL para obter o nome do cliente e o produto associado a
#cada pedido.
select c.nome, p.produto 
from clientes c 
inner join pedidos p 
on c.id_cliente = p.id_pedido;

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

#Escreva uma
#consulta SQL para obter o nome do aluno e o nome do curso associado a cada matrícula.
select a.nome  , c.nome_curso as curso
FROM aluno a  
INNER JOIN matriculas m 
ON a.id_aluno = m.id_curso  
INNER JOIN cursos c 
ON c.id_curso  = m.id_aluno ;
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
from departamentos d
inner join funcionarios f 
on f.id_departamento  = d.id_departamento  ;
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

select u.nome_usuario, p.conteudo
from usuarios u 
inner join posts p  
on u.id_usuario = p.id_usuario  ;
#--------------------------------------
#8 
create schema Questao8;
use Questao8;
#--------------------------------------
#9 
create schema Questao9;
use Questao9;
#--------------------------------------
#10
create schema Questao10;
use Questao10;
#--------------------------------------
#11 
create schema Questao11;
use Questa11;
#--------------------------------------
#12 
create schema Questao12;
use Questao12;
#--------------------------------------
#13 
create schema Questao13;
use Questao13;
#--------------------------------------
#14 
create schema Questao14;
use Questao14;





