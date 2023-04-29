


GO

CREATE FUNCTION GradePointAverage(@DisciplineID INT)
RETURNS int
AS

BEGIN
    
    DECLARE @test int;
    SET @test = 10;

    RETURN @test;

END;



GO

ALTER FUNCTION GradePointAverage(@DisciplineID INT)
RETURNS float
AS

BEGIN
    
    -- DECLARE @ScoreSumm int;
    -- DECLARE @StudentCount int;
    DECLARE @ReturnValue float;
    
    -- SELECT @StudentCount = COUNT(grade_book_number) FROM Research WHERE ID_Discipline = @DisciplineID;
    -- SELECT @ScoreSumm = SUM(score) FROM Research WHERE ID_Discipline = @DisciplineID;

    -- SELECT @StudentCount = CASE 
    --         WHEN @StudentCount = 0 THEN 1
    --         WHEN @StudentCount > 0 THEN @StudentCount
    --     END;

    -- SELECT @ReturnValue =  
    -- CASE (SELECT reporting FROM Disciplines WHERE ID =  @DisciplineID) 
    --     WHEN 'зачет' THEN 0
    --     WHEN 'курсовая' THEN 0
    --     WHEN 'экзамен' THEN @ScoreSumm / @StudentCount
    -- END;

    SELECT @ReturnValue = ROUND(CONVERT(float, AVG( CONVERT(float,score))), 2)
        FROM Research 
        WHERE (SELECT reporting FROM Disciplines WHERE ID = ID_Discipline) = 'экзамен' AND ID_Discipline = @DisciplineID
    

    RETURN @ReturnValue;

END;

GO

CREATE PROCEDURE ExamsAndCredit(@Group nvarchar(50),   @Semeseter int)
AS   

    SELECT *
    FROM Disciplines   
    WHERE semester = @Semeseter AND specialty = (SELECT specialty FROM Groups WHERE name = @Group)
    
GO

ALTER PROCEDURE ExamsAndCredit(@Group nvarchar(50),   @Semeseter int)
AS   

    SELECT @Group as 'Группа', name, volume_in_hours, reporting
    FROM Disciplines   
    WHERE semester = @Semeseter AND specialty = (SELECT specialty FROM Groups WHERE name = @Group)

GO

CREATE PROCEDURE ExamsAndCredit1(@Group nvarchar(50),   @Semeseter int)
AS   
    SELECT * FROM Groups;
GO

ALTER PROCEDURE ExamsAndCredit1(@Group nvarchar(50),   @Semeseter int)
AS   
    SELECT * FROM Students;
GO

DROP PROCEDURE ExamsAndCredit1;