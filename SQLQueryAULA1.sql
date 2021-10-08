--------------------------CRIAÇÃO E ALTERAÇÃO DE OBJETOS-----------------------------------------
--Os comandos que iniciam  com CREATE servem para criar objetos (Linguagem de Definição de Dados (DDL))

--criação de um novo banco
create database batata

--diz para o sql em qual banco deve ser executados os scripts abaixo
use batata

--cria a tabela de usuário
create table Usuario 
(
	 id int
	,cd_usuario varchar(10)
	,Nome_Usuario varchar(300)
	,Senha varchar(30)
	,email varchar(200)
	,bloqueado bit
	,dt_inclusao date
)
--cria a chave primária da tebela (isso resultará em erro, devido a coluna id poder receber nulo)
alter table Usuario
add constraint PK_Usuario primary key(id)

--ajusta tabela para podermos criar a pk
--executar o comando acima novamente

alter table Usuario
alter column id int not null

--para gerarmos uma coluna com geracao automática de IDs, devemos definir a coluna como identity, no momento da criação
--outra forma de criar a pk da tabela
create table Usuario 
(
	 id int identity (1,1)
	,cd_usuario varchar(10)
	,Nome_Usuario varchar(300)
	,Senha varchar(30)
	,email varchar(200)
	,bloqueado bit
	,dt_inclusao date
	 CONSTRAINT PK_Usuario PRIMARY KEY (id) 
)

create table Perfil
(
	 id int identity (1,1)
	,cd_perfil varchar (30) 
	 CONSTRAINT PK_Perfil PRIMARY KEY (id) 
)

insert into Perfil 
values ('ADMIN')

insert into Perfil 
values ('USER')

insert into Perfil 
values ('MANAGER')

create table Perfil_Usuario 
(
	 id int identity (1,1)
	,id_usuario int
	,Perfil varchar(300)
	 CONSTRAINT PK_Perfil_Usuario PRIMARY KEY (id) 
)

alter table Perfil_Usuario
drop column Perfil

alter table Perfil_Usuario
add id_perfil int

alter table Perfil_Usuario
add constraint FK_Perfil_Usuario_1 foreign key(id_usuario) REFERENCES Usuario(id)

alter table Perfil_Usuario
add constraint FK_Perfil_Usuario_2 foreign key(id_perfil) REFERENCES Perfil(id)


select * from Usuario
select * from Perfil_Usuario
select * from Perfil

--ocorre erro devido a inserirmos dados em uma coluna com geração automatica de valores
insert into Usuario
values ('a','a','a','a',0,getdate())

--se tirarmos o valor do id (1)  o comando é executado com sucesso
insert into Usuario
values ('vitor','Vitor Dias','123456','vitor@email.com',0,getdate())

insert Perfil_Usuario
values (5,2)

insert Perfil_Usuario
values (10, 'ADMIN')

-------------------*************************************-----------------------------------
--------------------------EXCLUSÃO DE OBJETOS-----------------------------------------

--execlusão de constraints
alter table Usuario
drop constraint PK_Usuario

--exclusão de tabelas
drop table Usuario

--exclusão de databases
drop database batata

--erro devido a termos deletado a tabela
select * from Usuario