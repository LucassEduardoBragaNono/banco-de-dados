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
select p.id_paciente "Código", p.nome "Nome", p.sexo "Secho",
DATE_FORMAT(a.data_a,"%d/%m/%Y") "Data_Consulta",
a.horario_a "Horario_Consulta"
from pacientes p inner join atendimentos a
on(p.id_paciente=a.id_paciente)
where sexo = "F"
ORDER BY p.nome
