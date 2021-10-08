--criar database da loja de sapatos
create database lojasapato

--selecionar database para usar
use lojasapato

--criar tabela de fornecedor
create table Fornecedor 
(
	id int identity primary key
	, nome varchar(200)
	, cnpj varchar(14)
	, endereco varchar (200)
)

--criar tabela de modelo
create table Modelo
(
	id int identity primary key
	, id_fornecedor int
	, codigo_ref varchar(50)
	, cor varchar (50)
	, tamanho int
)

--alter table Modelo
--alter column codigo_ref varchar(50) not null
--add CONSTRAINT AK_Codigo_Ref_1 UNIQUE (codigo_ref)

--criar tabela de estoque
create table Estoque
(
	id int identity primary key
	, id_modelo int
	, qnt int
)

--adicionar chave estrangeira ligando id_fornecedor(Modelo) ao id(Fornecedor)
alter table Modelo
add constraint FK_Modelo_1 foreign key (id_fornecedor) References Fornecedor(id)

--adicionar chave estrangeira ligando id_modelo(Estoque) ao id(Modelo)
alter table Estoque
add constraint FK_Estoque_1 foreign key (id_modelo) References Modelo(id)

--inserir fornecedor
insert into Fornecedor
VALUES
 ('Nike','1111111111111','BH-MG')
,('Puma','2222222222222','RJ-RJ')
,('Adidas','3333333333333','SP-SP')
,('Arezzo','4444444444444','MN-AM')
,('Vans','5555555555555','SP-SP')

SELECT *FROM FORNECEDOR
select * from Modelo

--inserir modelos
insert into Modelo
VALUES
 (1, '1','Branco', 40)
,(1, '2','Preto', 41)
,(1, '3','Preto', 42)
,(1, '4','Branco', 43)
,(1, '5','Bege', 39)
,(1, '6','Vermelho', 40)
,(1, '7','Azul', 39)
,(1, '8','Branco', 38)
,(1, '9','Preto', 38)
,(2, '1','Branco', 40)
,(2, '2','Preto', 41)
,(2, '3','Preto', 42)
,(2, '4','Branco', 43)
,(2, '5','Bege', 39)
,(2, '6','Vermelho', 40)
,(2, '7','Azul', 39)
,(2, '8','Branco', 38)
,(2, '9','Preto', 38)
,(3, '1','Branco', 40)
,(3, '2','Preto', 41)
,(3, '3','Preto', 42)
,(3, '4','Branco', 43)
,(3, '5','Bege', 39)
,(3, '6','Vermelho', 40)
,(3, '7','Azul', 39)
,(3, '8','Branco', 38)
,(3, '9','Preto', 38)
,(4, '1','Branco', 40)
,(4, '2','Preto', 41)
,(4, '3','Preto', 42)
,(4, '4','Branco', 43)
,(4, '5','Bege', 39)
,(4, '6','Vermelho', 40)
,(4, '7','Azul', 39)
,(4, '8','Branco', 38)
,(4, '9','Preto', 38)
,(5, '1','Branco', 40)
,(5, '2','Preto', 41)
,(5, '3','Preto', 42)
,(5, '4','Branco', 43)
,(5, '5','Bege', 39)
,(5, '6','Vermelho', 40)
,(5, '7','Azul', 39)
,(5, '8','Branco', 38)
,(5, '9','Preto', 38)

select * from estoque

--inserir modelos e respectivas quantidades no estoque
insert into Estoque
VALUES
 (1, '15')
,(2, '15')
,(3, '15')
,(4, '15')
,(5, '15')
,(6, '15')
,(7, '15')
,(8, '15')
,(9, '15')
,(10, '15')
,(11, '15')
,(12, '15')
,(13, '15')
,(14, '15')
,(15, '15')
,(16, '15')
,(17, '15')
,(18, '15')
,(19, '15')
,(20, '15')
,(21, '15')
,(22, '15')
,(23, '15')
,(24, '15')
,(25, '15')
,(26, '15')
,(27, '15')
,(28, '15')
,(29, '15')
,(30, '15')
,(31, '15')
,(32, '15')
,(33, '15')
,(34, '15')
,(35, '15')
,(36, '15')
,(37, '15')
,(38, '15')
,(39, '15')
,(40, '15')
,(41, '15')
,(42, '15')
,(43, '15')
,(44, '15')
,(45, '15')

--simular retiradas no estoque
update Estoque 
set qnt = '8'
where id in (1,5,10,15,20)


--simular exclusao de fornecedor
delete Modelo
where id_fornecedor = 5

delete Fornecedor
where nome = 'Vans'

--tentativa de excluir com join (nao consegui ainda)
select 
	f.id
	,f.nome as [Nome do Fornecedor]
from Fornecedor as f
inner join Modelo as m
	on  f.id = m.id_fornecedor
group by 
	f.id
	,f.nome
order by f.nome

------- PARTE 2--------

create table Categoria (id int identity primary key, nome varchar (200))

create table Cliente (id int identity primary key, nome varchar(300), cpf varchar(11), endereco varchar(300), sexo varchar(1))

create table Vendas (id int identity, id_modelo int, id_cliente int, quantidade int, dtVenda datetime)

-- adicionando FK na tabela vendas
alter table Vendas
add constraint FK_Vendas_1 foreign key (id_modelo) References Modelo(id)
alter table Vendas
add constraint FK_Vendas_2 foreign key (id_cliente) References Cliente(id)


insert into Categoria
values
('Tênis')
,('Sapato')
,('Sandália')
,('Bota')
,('Chinelo')
,('Salto Alto')

insert into Cliente
values
('Ana', '11111111111','BH-MG', 'F')
,('Antonio', '01111111111','BH-MG', 'M')
,('Beatriz', '00111111111','BH-MG', 'F')
,('Joao', '00011111111','BH-MG', 'M')
,('Jose', '00001111111','SP-SP', 'M')
,('Vitoria', '00000111111','SP-SP', 'F')
,('Marlene', '11111111111','SP-SP', 'F')
,('Raysa', '11111111110','SP-SP', 'F')
,('Victor', '11111111100','SP-SP', 'M')
,('Mario', '11111111000','SP-SP', 'M')
,('Judas', '11111110000','RJ-RJ', 'M')
,('Maria', '11111100000','RJ-RJ', 'F')
,('Fernando', '10111111111','RJ-RJ', 'M')
,('Michelle', '11111111101','RJ-RJ', 'F')
,('Rodrigo', '10111111101','BH-MG', 'M')

insert into Vendas
values
( 1, 1, 2, ' ')
,( 2, 2, 2, ' ')
,( 3, 3, 2, ' ')
,( 4, 4, 2, ' ')
,( 5, 5, 2, ' ')
,( 6, 6, 1, ' ')
,( 7, 7, 1, ' ')
,( 8, 8, 1, ' ')
,( 9, 9, 1, ' ')
,( 10, 10, 1, ' ')
,( 11, 11, 1, ' ')
,( 11, 12, 1, ' ')
,( 12, 13, 2, ' ')
,( 13, 14, 2, ' ')
,( 14, 15, 1, ' ')
,( 15, 15, 2, ' ')
,( 16, 14, 2, ' ')
,( 17, 13, 2, ' ')
,( 18, 12, 2, ' ')
,( 19, 11, 2, ' ')
,( 20, 10, 2, ' ')
,( 21, 9, 2, ' ')
,( 22, 8, 2, ' ')
,( 23, 7, 2, ' ')
,( 24, 6, 2, ' ')
,( 25, 8, 2, ' ')
,( 26, 5, 1, ' ')
,( 27, 4, 1, ' ')
,( 28, 6, 1, ' ')
,( 29, 3, 1, ' ')
,( 30, 2, 1, ' ')
,( 31, 11, 1, ' ')
,( 32, 1, 1, ' ')
,( 33, 6, 1, ' ')
,( 34, 6, 1, ' ')
,( 35, 6, 1, ' ')
,( 36, 6, 1, ' ')
,( 44, 10, 9, ' ')
,( 43, 10, 1, ' ')
,( 42, 11, 2, ' ')
,( 41, 11, 2, ' ')
,( 40, 11, 7, ' ')
,( 39, 15, 2, ' ')
,( 28, 15, 3, ' ')
,( 17, 15, 1, ' ')
,( 16, 7, 1, ' ')
,( 1, 13, 2, ' ')
,( 11, 14, 1, ' ')
,( 10, 1, 2, ' ')
,( 41, 2, 1, ' ')


select * from Fornecedor
select * from vendas
select * from cliente
select * from Categoria
select * from Modelo
select * from estoque

--adicionando novas colunas na tabela modelo e adicionando outra FK
alter table Modelo
add valor decimal
alter table Modelo
add id_categoria int
alter table Modelo
add constraint FK_Modelo_2 foreign key (id_categoria) References Categoria(id)

--adicionando mais modelos, se necessario
insert into Modelo
values
 (6, '1','Branco', 40, 50.60, 4)
,(6, '2','Preto', 41, 79.90, 4)
,(6, '3','Preto', 42, 89.90, 5)
,(6, '4','Branco', 43, 10.90, 5)
,(6, '5','Bege', 39, 29.90, 6)
,(6, '6','Vermelho', 40, 109.90, 6)
,(6, '7','Azul', 39, 200.00, 6)
,(6, '8','Branco', 38, 80.50, 5)
,(6, '9','Preto', 38, 99.99, 4)

--preenchendo valores nulos de novas linhas da tabela e alterando algumas categorias e valores
update Modelo 
set valor = 60.00
	,id_categoria = 1
where valor is null and id_categoria is null

update Modelo 
set valor = 80.00
where cor = 'Branco'

update Modelo 
set valor = 40.00
where cor = 'Azul'

update Modelo 
set id_categoria = 2
where cor = 'Preto'

update Modelo 
set id_categoria = 3
where cor = 'Bege'


--1.	Listar os modelos que possuem menos de 10 itens no estoque (Com código de refência e nome fornecedor)
select id count () 
from Modelo
group by codigo_ref, id_fornecedor

--2.	Listar a quantidade de modelos que cada fornecedor possui na nossa loja
select * from Modelo
select * from estoque

select 
	 f.id
	,f.nome as [Nome do fornecedor]
	,sum (m.id_fornecedor) as total
from fornecedor as f
inner join modelo as m
	on f.id = m.id_fornecedor
group by 
	f.id, f.nome
order by f.id
