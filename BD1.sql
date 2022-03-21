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
'monitor ultra-wide',
700.00,
4
);


