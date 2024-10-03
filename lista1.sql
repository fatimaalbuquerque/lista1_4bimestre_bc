/* 1 */
CREATE VIEW alunos_e_cursos AS
SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    c.nome AS curso
FROM 
    aluno a
JOIN 
    matricula m ON a.id_aluno = m.id_aluno
JOIN 
    disciplina d ON m.id_disciplina = d.id_disciplina
JOIN 
    curso c ON d.id_curso = c.id_curso;
    
/* 2 */
CREATE VIEW total_alunos_por_disciplina AS
SELECT 
    d.nome AS disciplina,
    COUNT(m.id_aluno) AS total_alunos
FROM 
    disciplina d
JOIN 
    matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY 
    d.nome;
    
/* 3 */
CREATE VIEW alunos_e_status_matriculas AS
SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    m.status AS status_matricula
FROM 
    aluno a
JOIN 
    matricula m ON a.id_aluno = m.id_aluno
JOIN 
    disciplina d ON m.id_disciplina = d.id_disciplina;

/* 4 */
CREATE VIEW professores_e_turmas AS
SELECT 
    p.nome AS professor,
    d.nome AS disciplina,
    t.semestre AS semestre,
    t.horario AS horario
FROM 
    professor p
JOIN 
    turma t ON p.id_professor = t.id_professor
JOIN 
    disciplina d ON t.id_disciplina = d.id_disciplina;
    
/* 5 */
CREATE VIEW alunos_maiores_de_20_anos AS
SELECT 
    nome,
    data_nascimento
FROM 
    aluno
WHERE 
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;
    
/* 6 */
CREATE VIEW disciplinas_e_carga_horaria_por_curso AS
SELECT 
    c.nome AS curso,
    COUNT(d.id_disciplina) AS total_disciplinas,
    SUM(c.carga_horaria) AS carga_horaria_total
FROM 
    curso c
JOIN 
    disciplina d ON c.id_curso = d.id_curso
GROUP BY 
    c.nome;
    
/* 7 */
CREATE VIEW professores_e_especialidades AS
SELECT 
    nome,
    especialidade
FROM 
    professor;

/* 8 */
CREATE VIEW alunos_matriculados_em_mais_de_uma_disciplina AS
SELECT 
    a.nome AS aluno,
    COUNT(m.id_disciplina) AS total_disciplinas
FROM 
    aluno a
JOIN 
    matricula m ON a.id_aluno = m.id_aluno
GROUP BY 
    a.nome
HAVING 
    COUNT(m.id_disciplina) > 1;
    
/* 9 */
CREATE VIEW alunos_e_disciplinas_concluidas AS
SELECT 
    a.nome AS aluno,
    COUNT(m.id_disciplina) AS total_disciplinas_concluidas
FROM 
    aluno a
JOIN 
    matricula m ON a.id_aluno = m.id_aluno
WHERE 
    m.status = 'Concluído'
GROUP BY 
    a.nome;

/* 10 */
CREATE VIEW turmas_de_um_semestre AS
SELECT 
    t.semestre AS semestre,
    p.nome AS professor,
    d.nome AS disciplina,
    t.horario AS horario
FROM 
    turma t
JOIN 
    professor p ON t.id_professor = p.id_professor
JOIN 
    disciplina d ON t.id_disciplina = d.id_disciplina
WHERE 
    t.semestre = '2024.1';

/* 11 */
CREATE VIEW alunos_com_matriculas_trancadas AS
SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    m.status AS status_matricula
FROM 
    aluno a
JOIN 
    matricula m ON a.id_aluno = m.id_aluno
JOIN 
    disciplina d ON m.id_disciplina = d.id_disciplina
WHERE 
    m.status = 'Trancado';

/* 12 */
CREATE VIEW disciplinas_sem_alunos AS
SELECT 
    d.nome AS disciplina
FROM 
    disciplina d
LEFT JOIN 
    matricula m ON d.id_disciplina = m.id_disciplina
WHERE 
    m.id_disciplina IS NULL;

/* 13 */
CREATE VIEW quantidade_alunos_por_status AS
SELECT 
    m.status AS status_matricula,
    COUNT(m.id_aluno) AS total_alunos
FROM 
    matricula m
GROUP BY 
    m.status;
    
/* 14 */
CREATE VIEW total_professores_por_especialidade AS
SELECT 
    p.especialidade AS especialidade,
    COUNT(p.id_professor) AS total_professores
FROM 
    professor p
GROUP BY 
    p.especialidade;
    
/* 15 */
CREATE VIEW alunos_e_idades AS
SELECT 
    nome,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM 
    aluno;
    
/* 16 */
CREATE VIEW alunos_e_ultimas_matriculas AS
SELECT 
    a.nome AS aluno,
    MAX(m.data_matricula) AS data_matricula
FROM 
    aluno a
JOIN 
    matricula m ON a.id_aluno = m.id_aluno
GROUP BY 
    a.nome;
    
/* 17 */
CREATE VIEW disciplinas_de_um_curso AS
SELECT 
    d.nome AS disciplina
FROM 
    disciplina d
JOIN 
    curso c ON d.id_curso = c.id_curso
WHERE 
    c.nome = 'Engenharia de Software';
    
/* 18 */
CREATE VIEW professores_sem_turmas AS
SELECT 
    p.nome AS professor
FROM 
    professor p
LEFT JOIN 
    turma t ON p.id_professor = t.id_professor
WHERE 
    t.id_professor IS NULL;
    
/* 19 */
CREATE VIEW alunos_com_cpf_e_email AS
SELECT 
    nome,
    cpf,
    email
FROM 
    aluno;
    
/* 20 */
CREATE VIEW total_disciplinas_por_professor AS
SELECT 
    p.nome AS professor,
    COUNT(t.id_disciplina) AS total_disciplinas
FROM 
    professor p
JOIN 
    turma t ON p.id_professor = t.id_professor
GROUP BY 
    p.nome;