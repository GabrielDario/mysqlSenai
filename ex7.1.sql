#exercicio 7
create schema Loja;
use Loja;

CREATE TABLE Venda (
id_nf int,
id_item int,
cod_prod int,
valor_unit DECIMAL(10,2),
quantidade int,
desconto int,
primary key (id_nf, id_item)
);

insert into venda(id_nf,id_item,cod_prod,valor_unit,quantidade,desconto) 
values (1,1,1,25,10,5),(1,2,2,13.50,3, null),(1,3,3,15,2,null),
(1,4,4,10,1,null),(1,5,5,30,1,null),(2,1,3,15,4,null),
(2,2,4,10,5,null),(2,3,5,30,7,null),(3,1,1,25,5,null),
(3,2,4,10,4,null),(3,3,5,30,5,null),(3,4,2,13.50,7,null),
(4,1,5,30,10,15),(4,2,4,10,12,5),(4,3,1,25,13,5),
(4,4,2,13.50,15,5),(5,1,3,15,3,null),(5,2,5,30,6,null),
(6,1,1,25,22,15),(6,2,3,15,25,20),(7,1,1,25,10,3),
(7,2,2,13.50,10,4),(7,3,3,15,10,4);

#A
select id_nf,id_item ,cod_prod ,valor_unit   from venda where desconto IS NULL OR desconto = 0;

#B
select id_nf,id_item ,cod_prod ,valor_unit ,(valor_unit  - VALOR_UNIT*(DESCONTO/100)) as valor_vendido 
from venda 
where desconto > 0 or desconto is not null;

#C
UPDATE venda SET desconto = 0 WHERE desconto is null  ;

#D arrumar
select id_nf,id_item ,cod_prod ,valor_unit ,quantidade ,desconto , (valor_unit * quantidade) as valorTotal,
((valor_unit * quantidade) - (valor_unit  - ( valor_unit * (desconto/100)) * quantidade  )) as valor_vendido
from venda ;

#E
select id_nf,
sum(quantidade  * valor_unit) as valor_total
from venda 
group by id_nf 
order by valor_total desc;

#F
select id_nf, 
sum(valor_unit - (valor_unit * (desconto/ 100))) as valor_vendido
from venda
group by id_nf 
order by valor_vendido desc;


#G //NAO PEDE PRA COLOCAR OS COD_PROD
select 
count(cod_prod) as contador_produto ,
sum(quantidade) as quantidade 
from venda
group by cod_prod 
order by contador_produto desc 
limit 1;

#H // nao pede qatidade
select id_nf , cod_prod, sum(quantidade) as quantidade
from venda 
group by id_nf, cod_prod 
having sum(quantidade) > 10;


#i 
select id_nf,
sum(quantidade * valor_unit) as valor_total
from venda 
group by id_nf 
having valor_total > 500
order by valor_total desc;


#j
select cod_prod , 
avg(valor_unit * (desconto / 100)) as media
from venda
group by cod_prod ;

#k
select cod_prod,
avg(desconto) as media,
max(desconto) as maximo,
min(desconto) as minimo
from venda
group by cod_prod ;

#l
select 
id_nf ,
count(id_nf) as qnt_itens
from venda
group by id_nf 
having qnt_itens > 3;

