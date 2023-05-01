




SELECT * FROM BestStudents;

SELECT * FROM Students;
SELECT * FROM Disciplines;
SELECT * FROM Specialties;
SELECT * FROM Groups;



SELECT semester FROM Research as [пордмт] INNER JOIN Disciplines as [дсцплн] ON [пордмт].ID_Discipline = [дсцплн].ID;

SELECT *, (SELECT reporting FROM Disciplines WHERE ID = ID_Discipline), (SELECT semester FROM Disciplines WHERE ID = ID_Discipline) FROM Research WHERE grade_book_number = '10000000023'
AND  (SELECT reporting FROM Disciplines WHERE ID = ID_Discipline) = 'экзамен';

SELECT MIN(score) FROM Research WHERE grade_book_number = '10000000023'
AND  (SELECT reporting FROM Disciplines WHERE ID = ID_Discipline) = 'экзамен';