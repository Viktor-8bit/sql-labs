



USE Decanat;

GO

-- Триггер на удаление:
-- При удалении некоторой дисциплины, триггер не дает удалить дисциплины, по
-- которым хотя бы один человек получил экзамен (зачет)

CREATE TRIGGER DeleteDisciplineTrigger
ON Disciplines 
INSTEAD OF DELETE 
AS

SELECT TOP(1) ID FROM DELETED ORDER BY ID DESC

GO

ALTER TRIGGER DeleteDisciplineTrigger
ON Disciplines 
INSTEAD OF DELETE 
AS
    DECLARE @ID int, @name varchar(255), @specialty varchar(255), @semester int, @volume_in_hours int, @reporting varchar(255)

    DECLARE instdd CURSOR LOCAL FOR   
    SELECT ID, name, specialty, semester, volume_in_hours, reporting
    FROM DELETED

    OPEN instdd 
    
    FETCH NEXT FROM instdd INTO @ID, @name, @specialty, @semester, @volume_in_hours, @reporting   
    

    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        IF ( (SELECT COUNT(ID) FROM Research WHERE ID_Discipline = @ID) > 0 )
        BEGIN
            -- PRINT('нельзя удалять так-как студент сдал предмет')
            CLOSE instdd;  
            THROW 51000, 'нельзя удалять так-как студент сдал предмет', 1;  
            RETURN;
        END;
        
        DELETE Disciplines WHERE (SELECT COUNT(ID) FROM Research WHERE ID_Discipline = @ID) = 0 AND ID = @ID;
        FETCH NEXT FROM instdd INTO @ID, @name, @specialty, @semester, @volume_in_hours, @reporting   

    END;
    CLOSE instdd;  
GO


-- Назначить нового старосту в некоторую группу. Если назначаемый на должность
-- старосты студент не состоит в этой группе, следует отменить транзакцию.
CREATE TRIGGER UpdateWarden
ON Groups
INSTEAD OF UPDATE
AS
    if UPDATE(ID)
    BEGIN
        SELECT 10;
    END
    ELSE BEGIN
        SELECT 'обновление id';
    END

GO

ALTER TRIGGER UpdateWarden
    ON Groups
    INSTEAD OF UPDATE
    AS
    
    DECLARE @ID int, @name varchar(255), @specialty int, @curator varchar(6), @warden varchar(11)

    DECLARE instdd CURSOR LOCAL FOR   
    SELECT *
    FROM inserted

    OPEN instdd 
    
    FETCH NEXT FROM instdd INTO @ID, @name, @specialty, @curator, @warden   
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        --    SELECT @ID, @name, @specialty, @curator, @warden;
                if ( SELECT COUNT(*) FROM Students as [стднт] WHERE  [стднт].ID_Group = @ID AND [стднт].grade_book_number = @warden ) = 0
                BEGIN
                    -- SELECT @ID, @name, @specialty, @curator, @warden;
                    -- PRINT('староста не пренадлежит группе')
                    CLOSE instdd;  
                    THROW 51000, 'староста не пренадлежит группе', 1;  
                    RETURN;
                END; 

                PRINT('итерация')
                UPDATE Groups 
                SET 
                name = @name,
                specialty = @specialty,
                curator = @curator,
                warden =  @warden
                WHERE Groups.ID = @ID; 

                FETCH NEXT FROM instdd INTO @ID, @name, @specialty, @curator, @warden;
    END;
    CLOSE instdd;  
GO


-- Не позволить добавить информацию о сданном экзамене (или зачете), если
-- дисциплина не соответствует специальности студента.
CREATE TRIGGER InsertResearch
ON Research
INSTEAD OF INSERT
AS

    SELECT 'Вставляем значение';



GO

ALTER TRIGGER InsertResearch
ON Research
INSTEAD OF INSERT
AS

    DECLARE @inst_grade_book_number VARCHAR(11), @inst_id int, @inst_ID_Discipline int, @inst_handover_date DATE, @inst_score int

    DECLARE instdd CURSOR LOCAL FOR   
    SELECT ID, grade_book_number, ID_Discipline, handover_date, score  
    FROM inserted  
    
    OPEN instdd  
    
    FETCH NEXT FROM instdd   
    INTO @inst_id, @inst_grade_book_number, @inst_ID_Discipline, @inst_handover_date, @inst_score   
    
    WHILE @@FETCH_STATUS = 0

    BEGIN

        if ( ( SELECT specialty FROM Groups WHERE ID = (SELECT ID_Group FROM Students WHERE grade_book_number = @inst_grade_book_number) ) = (SELECT specialty FROM Disciplines WHERE ID = @inst_ID_Discipline ) )
        BEGIN
            PRINT('всё в порядке')
            INSERT INTO Research(grade_book_number, ID_Discipline, handover_date, score) 
            VALUES (
                @inst_grade_book_number,
                @inst_ID_Discipline,
                @inst_handover_date,
                @inst_score
            );
            FETCH NEXT FROM instdd   
            INTO @inst_id, @inst_grade_book_number, @inst_ID_Discipline, @inst_handover_date, @inst_score   
        END;

        ELSE BEGIN  
            --PRINT('ошибка специальность не совпадает со специальностью студента')
            CLOSE instdd;  
            THROW 51000, 'ошибка специальность не совпадает со специальностью студента', 1;  
            RETURN;
        END;
        

    END;
    CLOSE instdd;  
