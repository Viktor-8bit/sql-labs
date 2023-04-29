



SELECT * FROM Specialties;

SELECT * FROM Groups;
SELECT * FROM Students;
SELECT * FROM Disciplines;
SELECT * FROM Specialties;


SELECT ID_Group FROM Students GROUP BY ID_Group;


-- 2	КИ20-11Б	3	111112	10000000011

SELECT * FROM Disciplines;

SELECT ROUND(CONVERT(float, AVG( CONVERT(float,score))), 2)
FROM Research 
WHERE (SELECT reporting FROM Disciplines WHERE ID = ID_Discipline) = 'экзамен' AND ID_Discipline = 10


SELECT dbo.GradePointAverage(10) as 'Средний балл';

EXECUTE dbo.ExamsAndCredit @Group = 'КИ20-10Б', @Semeseter = 1;

