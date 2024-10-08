UPDATE exames SET valor = valor + (valor*0.10)
WHERE valor < 200;

UPDATE pacientes SET cidade = "Rio de Janeiro",
bairro = "Ipanema"
WHERE id_paciente = 1;

SELECT id_medico "Código", nome "Nome"
FROM medicos
WHERE id_especialidade = 1

SELECT * 
FROM tabela1 INNER JOIN tabela2
ON (tabela1.campo= tabela2.campo)

SELECT id_medico "Código", m.nome "Nome",
	e.descritivo "Especialidade"
FROM medicos m INNER JOIN especialidades e
ON (m.id_especialidade=e.id_especialidade)

DATE_FORMAT(campo datax,"%d/%m/Y")

#listar todas as consultas realizadas pelos médicos codigo nome data_consulta horario_consulta

SELECT m.id_medico "Código", m.nome "Nome",
DATE_FORMAT(a.data_a,"%d/%m/%Y") "Data_Consulta",
a.horario_a "Horário_Consulta"
FROM medicos m INNER JOIN atendimentos a
ON(m.id_medico=a.id_medico)
ORDER BY  data_a

#listar listar todas pelos pacientes + sexo + só muié
SELECT p.id_paciente "Código", p.nome "Nome", p.sexo "Secho",
DATE_FORMAT(a.data_a,"%d/%m/%Y") "Data_Consulta",
a.horario_a "Horario_Consulta"
FROM pacientes p INNER JOIN atendimentos a
ON(p.id_paciente=a.id_paciente)
WHERE sexo = "F"
ORDER BY p.nome

###FUNCAO AGREGADA - AGRUPAMENTO

SUM(PARAM) - NUMERICO - SOMA VALORES
AVG(PARAM) - NUMERICO - MEDIA ARITMETICA
COUNT(PARAM) - ID - CONTADOR DE REGISTRO
MAX(PARAM) - MAIOR ELEMENTO DE UM GRUPO 
MIN(PARAM) - MENOR ELEMENTO DE UM GRUPO

DAY() - dia de um campo DATE
MONTH() - mes de um campo DATE
YEAR() - ano de um campo DATE
BETWEEN - entre
IN()
##EX1 - CALCULAR QUANTOS MÉDICOS A CLÍNICA TEM CADASTRADO

SELECT COUNT(id_medico) "Numero de medicos cadastrados"
FROM medicos
WHERE sexo = "F" AND YEAR(data_nasc) > 1990

##ex2 - contar quantos atendimentos foram realizados na linic
SELECT COUNT(*)"Num de atendimentos"
FROM atendimentos
WHERE data_a BETWEEN "2024-08-01" AND "2024-08-10"
AND id_medico IN (3,4,5)

##ex3 - calcular a media das idades entre todos os medicos

SELECT FORMAT(AVG(YEAR(CURRENT_DATE()) - YEAR(data_nasc)),2) "Média das idades dos médicos"
FROM medicos

##ex4 - calcular a media de exames cadastrados 

SELECT CONCAT("R$",FORMAT(AVG(valor),2,"de_DE")) "Média dos valores de exames"
FROM exames

SELECT SUM(valor), COUNT(valor), SUM(valor)/COUNT(valor)
FROM exames ##verificar

##ex5 - calcular a receita da clinica dos atendimentos considerando o valor da consulta padrao 250 reais

SELECT CONCAT("R$", FORMAT(COUNT(id_atendimento) * 250, 2)) "Receita da clínica"
FROM atendimentos

#ex6 achar o examas com maior valor
SELECT MAX(valor)
FROM exames

#ex7 achar o exame com menor valor

SELECT MIN(valor)
FROM exames

#ex8 achar o exame com o maior e menor valor
SELECT MAX(valor) "maior", MIN(valor) "menor"
FROM exames