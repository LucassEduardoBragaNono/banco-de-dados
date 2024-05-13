SHOW TABLES;

CREATE TABLE cliente(
	cli_codigo INT(10) PRIMARY KEY,
	cli_nome VARCHAR(255) NOT NULL,
	cli_endereco VARCHAR(255) NOT NULL,
	cli_email VARCHAR(255) NOT NULL UNIQUE,
	cli_obs VARCHAR(255) NULL 
);

DESCRIBE cliente;

ALTER TABLE cliente MODIFY cli_obs VARCHAR(255) NOT NULL;
ALTER TABLE cliente DROP COLUMN cli_endereco;
ALTER TABLE cliente ADD cli_telefone INT(11) NOT NULL;

CREATE TABLE equipamento(
	equip_codigo INT(11) PRIMARY KEY,
	equip_descricao VARCHAR(255) NOT NULL,
	equip_detalhes VARCHAR(255) NOT NULL,
	equip_obs VARCHAR(255) NOT NULL
	/*FOREIGN KEY (fk_cli_codigo) references cliente (cli_codigo) outra forma*/
);

DESCRIBE equipamento;

ALTER TABLE equipamento ADD FOREIGN KEY (fk_cli_codigo) REFERENCES cliente(cli_codigo);
ALTER TABLE equipamento MODIFY equip_obs VARCHAR(255) NULL;

CREATE TABLE marca(
	marca_codigo INT(10) PRIMARY KEY,
	marca_nome VARCHAR(255) NOT NULL
);

DESCRIBE marca;
ALTER TABLE equipamento ADD fk_marca_codigo INT(10) NOT NULL;
ALTER TABLE equipamento ADD FOREIGN KEY(fk_marca_codigo) REFERENCES marca(marca_codigo)

CREATE TABLE tecnicos(
	tec_codigo INT(10) PRIMARY KEY,
	tec_nome VARCHAR(255) NOT NULL,
	tec_telefone VARCHAR(255) NOT NULL
);

DESCRIBE tecnico;

CREATE TABLE itens(
	item_codigo INT(10) PRIMARY KEY,
	item_descricao VARCHAR(255) NOT NULL,
	item_valor DECIMAL(5,2) NOT NULL
);

DESCRIBE itens;

CREATE TABLE servico(
	ser_codigo INT(10) PRIMARY KEY,
	ser_descricao VARCHAR(255) NOT NULL,
	ser_horas INT(1) NOT NULL,
	ser_valor DECIMAL(5,2) NOT NULL
);

DESCRIBE servico;
