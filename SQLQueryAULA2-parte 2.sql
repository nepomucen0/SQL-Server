--Consultas
--Definição das tabelas usadas para as consultas

create table Cliente ( id int identity primary key, nome varchar(200), cpf varchar(12), estado varchar(2), cidade varchar(200), sexo varchar(1))

insert into Cliente
values
 ('Angelo','01010111110','RJ','Angra','M')
,('Joana','01111111110','RJ','Angra','F')
,('Alex','11111111110','MG','Belo Horizonte','M')
,('Barbara','01111111111','MG','Belo Horizonte','F')
,('Rodrigo','11111111111','MG','Belo Horizonte','M')
,('Michelle','12345678899','MG','Belo Horizonte','F')
,('Ze','12341118899','SP','Uba','M')
,('Paulo','22245678899','SP','Uba','M')
,('Mauro','22222222222','SP','Uba','M')

create table Vendas ( id int identity, valor decimal, id_cliente int)
alter table Vendas
add constraint FK_Vendas_1 foreign key (id_cliente) References Cliente(id)

alter table Vendas
add id_produto int

insert into Vendas
values
 (40.00, 4)
,(10.00, 1)
,(10.00, 1)
,(10.00, 2)
,(10.00, 2)
,(10.00, 3)
,(10.00, 3)
,(10.00, 3)
,(10.00, 3)
,(10.00, 3)
,(10.00, 3)
,(10.00, 4)

create table Produtos (id int identity (1,1) primary key, nome varchar(500))
insert into Produtos
values
	('Doritos')
	,('Fandangos')

--------------------------------------------------------------------------------------------
--seleção de dados sem filtro
--* server para selecionarmos todas as colunas

select * from Cliente

select 
	id
	,cpf 
	,nome
	,estado
	,cidade
from cliente

--podemos buscar somente algumas colunas

select cpf, nome from cliente

--busca com filtro  de um ou mais colunas

select * from cliente
where estado = 'SP'and nome = 'Ze'

--buca clientes que comecem com a letra V
--V% = Comecem com a letra V e tenham quaisquer caracteres depois disso

select * from cliente
where nome like 'M%'

--buca clientes que terminem com a letra A
--%A = Quaisquer caracteres antes, terminando a palavra com A

select * from cliente
where nome like '%o'

--buca clientes que tenham R em qualquer lugar do nome
--%R% = Quaisquer caracteres antes um R e quaisquer caracteres depois

select * from cliente
where nome like '%u%'

--caso tenha que fazer esse tipo de busca em um campo numérico, temos que fazer o cast para varchar
--funciona parecido com o convert e o parse
--na pratica estamos dizendo olhando o CPF como um varchar,
--busque registros que tenham o número 5 em qualquer lugar

select * from cliente
where cast(cpf as varchar(12)) like '%5%'

--filtro com intervalor de menor e maior valor

select * from cliente
where id <=2 and id <=5

--podemos escrever com o between where coluna between (entre) menor valor AND maior valor 

select * from cliente
where id between 2 and 5

--consulta com OR

select * from cliente
where estado = 'SP' or estado = 'MG'

--consulta com uma lista de valores utilizando o IN

select * from cliente
where estado in ('SP','MG')
 
select * from cliente
where id in (2,5,1)

--Ordenação - Retornamos os resultados ordenados pelas colunas definidas no order by
--dois tipos de ordenação
--asc - ascendente (do menor para o maior)
--desc - descendente (do maior para o menor)
--quando não passado o sentido da ordenação o padrão é asc

select * from cliente
order by nome desc --asc

select * from cliente
order by nome, estado --desc

--agrupando valores 
--o group by nós realizamos subgrupos de dados
-- ou seja no exemplo abaixo agrupamos por estado e sexo
--o count que é uma função que retorna a quantidade de registros, funcionará da seguinte forma
--dentro de um grupo de registros (Ex: pessoas do RJ com sexo feminino) conte quantas linhas possuem 
--esses dados

select estado, count (*) 
from cliente
group by estado

--agrupando valores 
--o group by nós realizamos subgrupos de dados
-- ou seja no exemplo abaixo agrupamos por estado e sexo
--o count que é uma função que retorna a quantidade de registros, funcionará da seguinte forma
--dentro de um grupo de registros (Ex: pessoas do RJ com sexo feminino) conte quantas linhas possuem 
--esses dados

select estado,sexo, count (*) 
from cliente
group by sexo,estado
order by estado

--temos diversas função de agregação que trabalham com grupos, abaixo temos algumas delas
--sum - soma os valores da coluna passada em um grupo
--max - maior valor do grupo
--min - menor valor do grupo
--avg - média do grupo - a fórmula executado é da media normal (SOMA DOS REGISTROS/ Número de REGISTROS)
--count - quantidde de registros dentro daquele grupo

select id_cliente as cliente, sum(valor) as total
from Vendas
group by id_cliente
order by total desc

select 
	id_cliente as cliente
	, sum(valor) as total
	, max (valor) as maximo
	, min(valor) as minimo
	, AVG(valor) as media
	, count(*) as quantidade
from Vendas
group by id_cliente
order by total desc

select 
	id_cliente as cliente
	,count(*) as vendas
from Vendas
group by id_cliente


--cartesiano--
--sempre nessa ordem -> select - from - where - group by - order by
select 
	c.id
	,c.nome as [Nome do Cliente]
	,sum (v.valor) as total
from cliente c, vendas v
where c.id = v.id_cliente
group by 
	c.id
	,c.nome
order by c.id


--USANDO JOIN--
select 
	c.id
	,c.nome as [Nome do Cliente]
	,sum (v.valor) as total
from Cliente c
inner join Vendas v
	on c.id = v.id_cliente
group by 
	c.id
	,c.nome
order by c.nome

--left join
select												--5
	c.id
	,c.nome as [Nome do Cliente]
	,sum (isnull(v.valor,0)) as total
from Cliente c										--1
left join Vendas v									--2
	on c.id = v.id_cliente							--3 where (caso tenha)
group by											--4
	c.id
	,c.nome
order by c.nome										--6

--right join
select 
	c.id
	,c.nome as [Nome do Cliente]
	,sum (v.valor) as total
from Cliente c
right join Vendas v
	on c.id = v.id_cliente
group by 
	c.id
	,c.nome
order by c.nome

--left excluding join
select *
	,c.nome as [Nome do Cliente]
from Cliente c 
left join Vendas v 
	on c.id = v.id_cliente 
where v.id is null
order by c.id

-- full other join
select
* 
from Cliente c
full outer join Vendas v
	on  c.id = v.id_cliente
full outer join Produto p
	on  v.id_produto = p.id

select *
	 ,c.nome as [Nome do Cliente]
	 ,(select MAX(id) from Cliente) maxid
from Cliente c
left join Vendas v
	on c.id = v.id_cliente	
where v.id is null
order by c.id

--select dentro de select
select *
from Cliente c
left join 
		(
		select
			 id_cliente as cliente
			,SUM(valor) as valor
		 from Vendas
		 group by id_cliente
		) r
	on c.id = r.cliente
where r.valor > 20








delete Cliente
where id = 9
