create database DB_3B_22_1S;

use DB_3B_22_1S;

create table tb_produto(
id int primary key auto_increment,
nome varchar(40) unique,
preco decimal(8,2),
estoque int default 0
);

create table tb_venda(
id int primary key auto_increment,
id_prod int references tb_produto,
qtd int not null
);

insert into tb_produto values(
default, 
'monitor',
700.00,
default
);

insert into tb_produto values(
default, 
'teclado',
50.00,
5
);

create trigger tg_atualiza_estoque after insert 
on tb_venda
for each row 
update tb_produto set estoque = estoque - new.qtd
where id = new.id_prod;

create trigger tg_cancela_venda after delete
on tb_venda
for each row 
update tb_produto set estoque = estoque + old.qtd
where id = old.id_prod;


insert into tb_venda values(
default,
3,
2
);

delete from tb_venda
where id = 1;


select * from tb_produto;
select * from tb_venda;





