create database  tarefa;
use tarefa;

-- cadastro de funcionarios

create table cadfun (
CODFUN integer not null primary key,
nome varchar(40) not null,
departamento char(2),
funcao char (20),
salario decimal (10, 2)
);


show tables;

describe cadfun;
describe cadfun CODFUN;

INSERT INTO cadfun (CODFUN, nome, departamento, funcao, salario) value (12, 'CARLOS ALBERTO', '3', 'VENDEDOR', 1530.00);
INSERT INTO cadfun (CODFUN, nome, departamento, salario) value (44, 'JACIBA DA SILVA', '3', 1500.00);
INSERT INTO cadfun (CODFUN, nome, departamento, funcao, salario) value (2, 'WILSON DE MACHADO', '3', 'PROGRAMADOR', 1050.00);
INSERT INTO cadfun (CODFUN, nome, departamento, funcao, salario) value (5, 'AUGUSTO SOUZA', '3', 'PROGRAMADOR', 1050.00);
INSERT INTO cadfun (CODFUN, nome, departamento) value (6, 'ANA BASTOS', '5');
INSERT INTO cadfun (CODFUN, nome, departamento) value ('MARCELO SOUZA', '2');



-- CONSULTA 

select * from cadfun;
select nome, salario from cadfun where departamento = '3';

select nome, salario from cadfun order by nome;
select nome, salario from cadfun order by nome desc;
select nome, salario from cadfun order by nome desc;

select nome, salario from cadfun order by departamento, nome desc;
select nome, salario from cadfun where departamento = '3' order by nome;

-- ALTERAÇÃO DE REGISTRO

select * from cadfun where CODFUN = 7;
UPDATE  cadfun SET SALARIO = 2300.56 WHERE CODFUN = 7;
select * from cadfun where CODFUN = 7;
select * from cadfun where nome = 'ANA BASTOS';

set SQL_SAFE_UPDATES = 0;
UPDATE  cadfun SET departamento = '3' WHERE nome = 'ANA BASTOS';
select * from cadfun where nome = 'ANA BASTOS';
SELECT * FROM cadfun;
update CadFun SET Salario = Salario * 1.10; 

-- 6. EXCLUSÃO DE REGISTROS

DELETE FROM cadfun;
select distinct departamento from cadfun;
delete from cadfun where departamento = '2';

select * from cadfun;
select distinct departamento from cadfun;
delete from cadfun where NOME = 'MARCELO SOUZA';
select * from cadfun;


-- 7. ALTERAÇÃO DA ESTRUTURA DA TABELA

SELECT * FROM cadfun;
ALTER TABLE cadfun ADD ADMISSAO DATE;
SELECT * FROM cadfun;
UPDATE cadfun SET ADMISSAO = '2006-01-15' WHERE CODFUN = 2;
UPDATE cadfun SET ADMISSAO = '1999-10-21' WHERE CODFUN = 3;
UPDATE cadfun SET ADMISSAO = '2004-10-21' WHERE CODFUN = 4;
UPDATE cadfun SET ADMISSAO = '2006-04-26' WHERE CODFUN = 5;
UPDATE cadfun SET ADMISSAO = '1980-05-10' WHERE CODFUN = 7;
UPDATE cadfun SET ADMISSAO = '1999-12-15' WHERE CODFUN = 9;
UPDATE cadfun SET ADMISSAO = '2000-12-21' WHERE CODFUN = 12;
UPDATE cadfun SET ADMISSAO = '2000-10-21' WHERE CODFUN = 25;
SELECT * FROM cadfun;

SELECT NOME, ADMISSAO FROM cadfun where month(admissao) = 12;
SELECT NOME, ADMISSAO FROM cadfun WHERE ADMISSAO >= '2000-01-01';

INSERT INTO cadfun VALUES (15, 'MARCOS HENRIQUE', '2', 'GERENTE', 2184.33, '2006-05-25');
INSERT INTO cadfun VALUES (20, 'AUDREY TOLEDO', '2', 'SUPERVISORA', 1700.00, '2006-07-05');
INSERT INTO cadfun VALUES (22, 'SANDRA MANZANO', '2','ANALISTA', 2000.00, '2006-07-01');
INSERT INTO cadfun VALUES (24, 'MARCIO CANUTO', '2', 'PROGRAMADOR', 1200.00, '2006-07-10');
SELECT * FROM cadfun;


-- 1. OPERADORES ARITMÉTICOS

SELECT NOME, SALARIO FROM cadfun;
SELECT NOME, SALARIO + 100 FROM cadfun;
SELECT NOME, SALARIO FROM cadfun;
SELECT NOME, SALARIO * 1.20 FROM cadfun;
SELECT NOME, SALARIO FROM cadfun;

-- 2. OPERADORES DE COMPARAÇÃO OU RELACIONAIS

SELECT * FROM cadfun WHERE DEPARTAMENTO = ‘5’;
SELECT * FROM cadfun WHERE FUNCAO = 'VENDEDOR';
SELECT * FROM cadfun WHERE SALARIO <= 1700;
SELECT * FROM cadfun WHERE SALARIO > 1700 + 50;
SELECT * FROM cadfun WHERE SALARIO > (1700 + 50);

-- 3. OPERADORES LOGICOS

SELECT * FROM cadfun
 WHERE (DEPARTAMENTO = '3') AND (FUNCAO = 'PROGRAMADOR');
SELECT * FROM cadfun
 WHERE (DEPARTAMENTO = '3') OR (DEPARTAMENTO = '5');
SELECT * FROM cadfun
 WHERE NOT (FUNCAO = 'VENDEDOR');
SELECT * FROM cadfun
 WHERE (DEPARTAMENTO = '5') XOR (FUNCAO = 'PROGRAMADOR');

-- 4. OPERADORES ADICIONAIS

ALTER TABLE cadfun ADD FILHOS SMALLINT;
ALTER TABLE morto ADD FILHOS SMALLINT;
SELECT NOME, FILHOS FROM cadfun;
SELECT CODFUN, NOME, FILHOS FROM cadfun
 WHERE FILHOS IS NULL;
SELECT CODFUN, NOME, FILHOS FROM cadfun
 WHERE NOT FILHOS IS NULL;
SELECT CODFUN, NOME, FILHOS FROM cadfun
 WHERE FILHOS IS NOT NULL;
SELECT CODFUN, NOME, FILHOS FROM cadfun
 WHERE NOT (FILHOS IS NULL);

UPDATE cadfun SET FILHOS = 1 WHERE CODFUN = 2;
UPDATE cadfun SET FILHOS = 3 WHERE CODFUN = 3;
UPDATE cadfun SET FILHOS = 2 WHERE CODFUN = 5;
UPDATE cadfun SET FILHOS = 1 WHERE CODFUN = 9;
UPDATE cadfun SET FILHOS = 4 WHERE CODFUN = 20;
UPDATE cadfun SET FILHOS = 3 WHERE CODFUN = 25;
SELECT CODFUN, NOME, FILHOS FROM cadfun;
SELECT CODFUN, NOME, FILHOS FROM cadfun
 WHERE FILHOS IS NULL;
SELECT CODFUN, NOME, FILHOS FROM cadfun
 WHERE NOT (FILHOS IS NULL);
SELECT * FROM cadfun
 WHERE SALARIO BETWEEN 1700 AND 2000;
SELECT * FROM cadfun
 WHERE SALARIO NOT BETWEEN 1700 AND 2000;
SELECT * FROM cadfun
 WHERE DEPARTAMENTO IN ('2', '3');
SELECT * FROM cadfun
 WHERE DEPARTAMENTO NOT IN ('2', '3');

SELECT * FROM cadfun WHERE NOME LIKE 'A%';
SELECT * FROM cadfun WHERE NOME LIKE '_A%';
SELECT * FROM cadfun WHERE NOME LIKE '%AN%';
SELECT * FROM cadfun WHERE SALARIO LIKE '%6';
SELECT * FROM cadfun WHERE SALARIO LIKE '_5%2';
SELECT * FROM cadfun WHERE NOME NOT LIKE '%AN%';

