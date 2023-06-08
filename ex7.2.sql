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
  COD_DISC INT PRIMARY KEY,
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
  COD_DISC int,
  COD_TURMA INT,
  COD_PROF INT,
  ANO INT,
  horario VARCHAR(10),
  PRIMARY KEY (COD_DISC,COD_TURMA, COD_PROF,ANO),
  FOREIGN KEY (COD_DISC) REFERENCES Disciplinas (COD_DISC),
  FOREIGN KEY (COD_PROF) REFERENCES Professores (COD_PROF)
);

#ANO NÃO CONSEGUIR VINCULAR
CREATE TABLE Historico (
  MAT INT,
  COD_DISC int,
  COD_TURMA INT,
  COD_PROF INT,
  ANO INT,
  frequencia INT,
  nota DECIMAL(10,2),
  PRIMARY KEY (MAT, COD_DISC,COD_TURMA,COD_PROF,ANO),
  FOREIGN KEY (MAT) REFERENCES Alunos (MAT),
  FOREIGN KEY (COD_DISC,COD_TURMA,COD_PROF,ANO) REFERENCES Turma (COD_DISC,COD_TURMA,COD_PROF,ANO)
);	 

insert into alunos (mat,nome,endereco,cidade) 
values(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

insert into alunos (mat,nome,endereco,cidade) 
values(2015010999, 'Diego P', 'JARDIM CIDADE', 'SAO JOSE');

insert into disciplinas (cod_disc,nome_disc, carga_hor) 
values(1, 'BANCO DE DADOS', 100),
(2, 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
(3, 'AUTORIA WEB', 50),
(4, 'ENGENHARIA DE SOFTWARE', 80);

insert into professores (cod_prof,nome,endereco,cidade) 
values(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

insert into turma(cod_disc,cod_turma, cod_prof, ano, horario)
values(1, 1, 212131, 2015, '11H-12H'),
(2, 2, 212131, 2015, '13H-14H'),
(3, 1, 192011, 2015, '08H-09H'),
(4, 1, 192011, 2015, '07H-08H'),
(1, 1, 122135, 2015, '10H-11H');

insert into 
historico (mat,cod_disc,cod_turma,COD_PROF,ANO,frequencia, nota)
values   (2015010101,      1   ,    1     ,      122135,   2015  );

select * from turma where ;

insert into 
historico (mat         ,        cod_disc,        cod_turma,        COD_PROF,        ANO,        frequencia,         nota)
select a.mat,        t.COD_DISC ,        t.COD_TURMA ,        t.COD_PROF  ,        t.ANO , 0,0
from alunos a, disciplinas d, turma t
on duplicate key update frequencia = VALUES(frequencia), nota = values(nota);


select a.mat, d.cod_disc, t.cod_turma, t.cod_prof, t.ano
from alunos a , disciplinas d , turma t;

select h.mat, h.cod_disc, h.COD_TURMA ,h.COD_PROF , h.ANO 
from historico h ;


#A
select mat 
from historico h 
where nota < 5 and COD_DISC  = 1;

#B
select mat, avg(nota) as media_notas, COD_DISC 
from historico 
where ano = 2015 and COD_DISC = 2
group by mat;

select * from alunos  inner  join disciplinas d ;

#c
select a.mat, 
avg(nota) media_2015_poo
from alunos a 
inner join historico h 
on a.mat = h.mat
and cod_disc = 2
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
