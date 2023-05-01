



SELECT * FROM Specialties;

SELECT * FROM Groups;
SELECT * FROM Students;
SELECT * FROM Disciplines;
SELECT * FROM Specialties;
SELECT * FROM Research;

SELECT ID_Group FROM Students GROUP BY ID_Group;


-- 2	КИ20-11Б	3	111112	10000000011

SELECT * FROM Disciplines;

SELECT ROUND(CONVERT(float, AVG( CONVERT(float,score))), 2)
FROM Research 
WHERE (SELECT reporting FROM Disciplines WHERE ID = ID_Discipline) = 'экзамен' AND ID_Discipline = 10


SELECT dbo.GradePointAverage(10) as 'Средний балл';

EXECUTE dbo.ExamsAndCredit @Group = 'КИ20-10Б', @Semeseter = 1;




-- ТЕСТЫ ТРИГЕРОВ 
SELECT * FROM Disciplines;

-- УДАЛЕНИЕ
INSERT INTO Disciplines(name, specialty, semester, volume_in_hours, reporting) 
VALUES ('потом удалить', 1, 10, 1000, 'экзамен');


DELETE Disciplines WHERE ID = 4;
SELECT * FROM Students;
SELECT COUNT(ID) FROM Research WHERE ID_Discipline = 35;

-- ОБНОВЛЕНИЕ
UPDATE Groups SET warden = '10000000001' WHERE ID = 4; -- 10000000012, 10000000010 студент группы 4 | 10000000001 студент группы 1

SELECT COUNT(*) FROM Students WHERE ID_Group = 4 AND grade_book_number = '10000000012';
SELECT ID_Group FROM Students WHERE grade_book_number = '10000000012';
SELECT * FROM Groups;

-- ДОБОВЛЕНИЕ
SELECT * FROM Research;



INSERT INTO Research(grade_book_number, ID_Discipline, handover_date, score) VALUES 
('10000000001', 20, '1800-01-01', 3),
('10000000001', 21, '1800-01-01', 3); -- 3 - специальность | группа 1 | 21 дисциплина - 3 спец | 20 дисциплина - 2 спец | 