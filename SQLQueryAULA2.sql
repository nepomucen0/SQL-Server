--Linguagem de Manipula��o de Dados (DML)

--continua��o da aula anterior
--altera para obrigarmos a ter um email
alter table Usuario
alter column email varchar(200) not null
--------------- INSERINDO DADOS NA TABELA----------------------------
--o insert aqui � definido para todas as colunas da tabela
--ent�o � necess�rio que no values sejam informadas a mesma quantidade de colunas que existem na tabela
--os dados devem estar na mesma ordem que definidos na tabela
insert into Usuario
VALUES('xxx', 'xxx', 'aaa', 'email@email.com', 0, getdate())

insert into Usuario
VALUES('xxx', 'xxx', 'aaa',null, 0, getdate())

--o insert aqui � definido para algumas colunas da tabela, as que n�o forem especificadas receber�o NULL
--Os valores que ser�o inseridos quantidade e ordem das colunas especificadas, n�o necessariamente da tabela
insert into Usuario
(
cd_usuario
,Nome_Usuario
,Senha
,email
)
VALUES ('vitor','Vitor Dias','123456','vitor_dias@msn.com')

--insere um email em branco, isso � um string vazia e � diferente de NULL
(
cd_usuario
,Nome_Usuario
,Senha
,email
)
VALUES('xxx', 'xxx', 'aaabbb','')

select * from Usuario
select * from Perfil_Usuario
 
delete Perfil_Usuario

--manipula��o de dados

--atualiza usu�rios com codigo XXXX

update Usuario 
set email = 'Atualizado1'
	,senha = '123456'
--where email is null or email = ''
where email = 'Atualizado' and cd_usuario = 'vitor'


--atualiza informa��o de email para default, quando email n�o foi preenchido
update Usuario
set email = 'SemEmail'
where email is null or email <> 'Atualizado'

--atualiza todos os registros de senha que n�o sejam 123456
update Usuario
set senha = '987456'
where senha <> '123456'


--EXCLUS�O DE DADOS

--deleta o usuario 3

delete Usuario
where cd_usuario = 'vitor'

--deleta todos os registros da tabela Perfil usu�rio
delete Perfil_Usuario