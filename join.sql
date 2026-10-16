--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT students.*, degrees.name  AS degree_name
FROM students 
JOIN degrees 
ON degrees.id = students.degree_id 
WHERE degrees.id = 53;

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT degrees.*, departments.name AS department_name
FROM degrees
JOIN departments 
ON departments.id = degrees.department_id 
WHERE degrees.department_id = 7
AND degrees.level = 'triennale';

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT courses.*, 
teachers.name AS teacher_name, teachers.surname AS teacher_surname
FROM courses
JOIN course_teacher
ON courses.id = course_teacher.course_id 
JOIN teachers
ON teachers.id = course_teacher.teacher_id 
WHERE teachers.id = '44'

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT students.*, degrees.name AS degree_name, degrees.LEVEL AS degree_level,
departments.name AS department_name, departments.address AS department_address
FROM students 
JOIN degrees 
ON students.degree_id = degrees.id 
JOIN departments 
ON degrees.department_id = departments.id
ORDER BY students.surname, students.name;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT degrees.*, courses.name AS course_name, courses.description AS course_description,
teachers.name AS teacher_name, teachers.surname AS teacher_surname
FROM degrees 
JOIN courses 
ON degrees.id = courses.degree_id 
JOIN course_teacher 
ON courses.id = course_teacher.course_id 
JOIN teachers 
ON teachers.id = course_teacher.teacher_id;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT COUNT(DISTINCT teachers.id)
FROM teachers 
 JOIN course_teacher 
ON teachers.id = course_teacher.teacher_id 
 JOIN courses
ON course_teacher.course_id = courses.id
 JOIN degrees 
ON courses.degree_id = degrees.id
WHERE degrees.department_id = '5' ;

--7. BONUS: Per ogni studente e corso, contare i tentativi con voto almeno 18
-- e mostrare il voto massimo ottenuto.
