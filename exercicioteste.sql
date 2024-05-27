SHOW TABLES;

CREATE TABLE usuario(
usu_codigo INT PRIMARY KEY AUTO_INCREMENT,
usu_senha CHAR(12) NOT NULL,
usu_email VARCHAR(255) NOT NULL UNIQUE,
usu_nivel INT(2) NOT NULL,
usu_nome VARCHAR(255) NOT NULL
);

CREATE TABLE livro(
liv_codigo INT PRIMARY KEY AUTO_INCREMENT,
fk_autor VARCHAR(255) NOT NULL, 
liv_nome VARCHAR(255) NOT NULL,
liv_paginas INT(255) NOT NULL,
liv_editora VARCHAR(255) NOT NULL
);

CREATE TABLE carro(
car_codigo INT PRIMARY KEY AUTO_INCREMENT,
car_placa CHAR(7) NOT NULL UNIQUE,
fk_dono VARCHAR(255) NOT NULL,
car_ano VARCHAR(255) NOT NULL 
);

CREATE TABLE sala(
sala_codigo INT NOT NULL,
sala_nome VARCHAR(255) NOT NULL UNIQUE,
sala_bloco VARCHAR(255) NOT NULL,
fk_disciplina INT(2) NOT NULL
);

ALTER TABLE usuario MODIFY usu_senha CHAR(8);
ALTER TABLE usuario ADD usu_obs VARCHAR(255) NULL;
ALTER TABLE usuario DROP COLUMN usu_nivel;


ALTER TABLE livro CHANGE liv_nome liv_titulo VARCHAR(255);
ALTER TABLE livro ADD liv_status TINYINT(1);


INSERT
INTO carro(car_codigo, car_placa, car_ano, fk_dono)
VALUES(1 , '1234567', '2016', 'Lucas'),
(2 , '7654321', '2019', 'Marcos');

ALTER TABLE sala ADD FOREIGN KEY (fk_disciplina) REFERENCES(fk_disciplina);
ALTER TABLE sala MODIFY fk_disciplina INT(2) AUTO_INCREMENT;

INSERT
INTO sala(sala_codigo, sala_nome, sala_bloco, fk_disciplina)
VALUES(1 , 'Lucas', '2', 'Matemática'),
(2 , 'Emilly', '3', 'Biologia');

SELECT *
FROM carro;

SELECT *
FROM sala;