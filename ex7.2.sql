#exercicio 7.2
create schema Universidade;
use Universidade;

CREATE TABLE Alunos (
  MAT INT PRIMARY KEY,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  cidade VARCHAR(50)
);

CREATE TABLE Disciplinas (
  COD_DISC VARCHAR(10) PRIMARY KEY,
  nome_disc VARCHAR(100),
  carga_hor INT
);

CREATE TABLE Professores (
  COD_PROF INT PRIMARY KEY,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  cidade VARCHAR(50)
);

CREATE TABLE Turma (
  COD_DISC VARCHAR(10),
  COD_TURMA INT auto_increment,
  COD_PROF INT,
  ANO INT,
  horario VARCHAR(10),
  PRIMARY KEY (COD_TURMA),
  FOREIGN KEY (COD_DISC) REFERENCES Disciplinas (COD_DISC),
  FOREIGN KEY (COD_PROF) REFERENCES Professores (COD_PROF)
);

#ANO NÃO CONSEGUIR VINCULAR
CREATE TABLE Historico (
  MAT INT,
  COD_DISC VARCHAR(10),
  hist int not null auto_increment,
  COD_TURMA INT,
  COD_PROF INT,
  ANO INT,
  frequencia INT,
  nota DECIMAL(10,2),
  PRIMARY KEY (hist),
  FOREIGN KEY (MAT) REFERENCES Alunos (MAT),
  FOREIGN KEY (COD_DISC) REFERENCES TURMA (COD_DISC),
  FOREIGN KEY (COD_TURMA) REFERENCES Turma (COD_TURMA),
  FOREIGN KEY (COD_PROF) REFERENCES Turma (COD_PROF)
);	 

insert into alunos (mat,nome,endereco,cidade) 
values(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

insert into disciplinas (cod_disc,nome_disc, carga_hor) 
values('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

insert into professores (cod_prof,nome,endereco,cidade) 
values(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

insert into turma(cod_disc, cod_prof, ano, horario)
values ('BD', 212131, 2015, '11H-12H'),
('BD',  212131, 2015, '13H-14H'),
('POO',  192011, 2015, '08H-09H'),
('WEB',  192011, 2015, '07H-08H'),
('ENG',  122135, 2015, '10H-11H');

insert into 
historico (mat,cod_disc,cod_turma,COD_PROF,ANO,frequencia, nota)
values(2015010101,'bd',1,122135, 2014, 80,7.25),
(2015010102,'eng',2,212131, 2015, 70,9.25),
(2015010103,'poo',3,122135, 2016, 60,6.75),
(2015010104,'web',4,192011, 2017, 50,2.25),
(2015010105,'eng',5,212131, 2013, 90,9.25),
(2015010106,'bd',1,192011, 2015, 85,3.25);

insert into 
historico (mat,cod_disc,cod_turma,COD_PROF,ANO,frequencia, nota)
values(2015010101,'poo',1,122135, 2015, 80,3.25),
(2015010102,'poo',2,212131, 2015, 70,8.25),
(2015010103,'poo',3,122135, 2015, 60,9.75),
(2015010104,'poo',4,192011, 2015, 50,3.25),
(2015010105,'poo',5,212131, 2015, 90,1.25),
(2015010106,'poo',2,192011, 2015, 85,7.25);

#A
select a.mat, a.nome, h.nota
from alunos a
inner join historico h 
on a.mat = h.mat
and cod_disc = 'bd' and 
ano = 2015;

#B
select a.mat, 
avg(nota) media_2015_poo
from alunos a 
inner join historico h 
on a.mat = h.mat
and cod_disc = 'poo' and ano = 2015
group by a.mat
order by media_2015_poo ;

#c
select a.mat, 
avg(nota) media_2015_poo
from alunos a 
inner join historico h 
on a.mat = h.mat
and cod_disc = 'poo' 
and ano = 2015 
group by a.mat
having media_2015_poo > 6
order by media_2015_poo desc ;

#D
select nome, cidade 
from alunos
where cidade not like 'NATAL';

select count(*) as nao_sao_de_natal
from alunos 
where cidade not like 'NATAL';
