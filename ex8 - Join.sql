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
values(1, 'Joao'), (2,'Pedro');

insert into Cursos (id_curso, nome_curso)
values(3, 'Estetica'), (4, 'Moda');

insert into Matriculas (id_aluno, id_curso)
values(1, 3), (2, 4) ;



select a.nome  , c.nome_curso as curso
FROM aluno a  
INNER JOIN matriculas m 
ON a.id_aluno = m.id_aluno 
INNER JOIN cursos c 
ON c.id_curso  = m.id_aluno
GROUP BY m.id_aluno, m.id_curso ;





