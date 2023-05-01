



GO

CREATE VIEW BestStudents

AS SELECT * FROM Students

GO


ALTER VIEW BestStudents

AS 

SELECT semester as [семестр], ID_Group as [номер группы], [стднт].surname as [фамилия], [стднт].name as [имя], [стднт].first_name as [отчество]
-- (SELECT MAX(semester) FROM Research as [пордмт] INNER JOIN Disciplines as [дсцплн] ON [пордмт].ID_Discipline = [дсцплн].ID WHERE grade_book_number = [стднт].grade_book_number) as [семестр]

FROM Students as [стднт] 
INNER JOIN Research as [оценк] ON [стднт].grade_book_number = [оценк].grade_book_number
INNER JOIN Disciplines as [прдмт] ON [прдмт].ID = [оценк].ID_Discipline


WHERE [прдмт].reporting = 'экзамен' AND  [оценк].grade_book_number = [стднт].grade_book_number

GROUP BY ID_Group, [стднт].surname, [стднт].name, [стднт].first_name, semester

HAVING
(SELECT MIN([оценк].score) ) = 5;