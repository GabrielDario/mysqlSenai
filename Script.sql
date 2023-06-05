create schema Empresa;

use Empresa;

create table CadastroFuncionario(
id INT not null auto_increment,
nome VARCHAR(40),
departamento VARCHAR(3),
funcao VARCHAR(20),
salario DECIMAL(10,2),
primary key(id)
);

CREATE TABLE CadastroDepartamento (
id INT NOT NULL auto_increment,
nome VARCHAR(20),
codigo VARCHAR(3),
descricao varchar(30),
gerente_id INT,
primary key(id),
foreign key(gerente_id) references cadastrofuncionario(id)
);

insert into cadastrodepartamento (nome,codigo,descricao,gerente_id)
values ('Projeto','PRJ','BLABLA BLA DINHEIRO',1);

insert into cadastrofuncionario  (nome, departamento, funcao, salario)
values ('Pedro','ALG','Gerenciaaaa',1250.00);


update cadastrodepartamento 
set gerente_id = (select id  from
cadastrofuncionario  where nome like 'Pedro');

delete from cadastrodepartamento 
 where gerente_id  = (select id  from
cadastrofuncionario  where nome like 'Pedro');

