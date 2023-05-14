

 

-- 1
    -- 'Икарус' и 'ПАЗ' - в лабе 
    -- 'ЛиАЗ-5292' и 'ПАЗ-672' и 'ПАЗ-4234' и 'ЛиАЗ-677' - для разнообразия


    INSERT INTO Client(Surname, Name, Patronymic, Info) VALUES
        (NULL, 'Антон', NULL, 'клиент'), -- 1
        (NULL, 'Маша', NULL, 'клиент'),  -- 2
        (NULL, 'Катя', NULL, 'клиент'),  -- 3
        (NULL, 'Пётр', NULL, 'клиент'),  -- 4 
        (NULL, 'Стёпа', NULL, 'клиент'), -- 5
        (NULL, 'Вадим', NULL, 'клиент'), -- 6
        
        -- тест 6 задания
        (NULL, 'Олег', NULL, 'клиент'); -- 7


    INSERT INTO City(Name) VALUES 
        ('Новосибирск'), -- 1
        ('Томск');       -- 2

    INSERT INTO Driver(Surname, Name, Patronymic, ID_City) VALUES 
        (NULL, 'Игорь', NULL, 1), -- 1 из Новосибирска
        (NULL, 'Олег' , NULL, 2), -- 2 из Томска
        (NULL, 'Аня'  , NULL, 1); -- 3 из новосибирска

    INSERT INTO Bus(Trademark, QuantityPlace, StateNumber) VALUES
        ('Икарус', 3, '000000'),            -- 1
        ('ПАЗ',    8, '000001'),            -- 2
        ('ПАЗ-672', 10, '000002'),          -- 3
        ('ПАЗ-672', 1, '000003'),           -- 4
        ('EleMMent PALAZZO', 30, '000004'); -- 5

    INSERT INTO Routee(TimeDeparture, TravelTime, ID_CityDeparture, ID_CityArrival, Price, MIN_QuantityPlace) VALUES 
    
        -- маршруты Новосибирск -> Томск
        ('10:00:00', 30, 1, 2, 300, 3), -- 1
        ('12:00:00', 40, 1, 2, 250, 3), -- 2

        -- маршруты Томск -> Новосибирск
        ('14:00:00', 30, 2, 1, 500, 3), -- 3
        ('16:00:00', 40, 2, 1, 600, 3), -- 4

        -- маршрут Новосибирск -> Томск
        ('10:00:00', 30, 1, 2, 300, 3), -- 5

        -- маршрут Томск -> Новосибирск
        ('10:00:00', 30, 2, 1, 300, 3), -- 6
        
        -- делаем хотя бы 1 рейс с требованием к количеству мест больше 30
        ('04:04:04', 30, 2, 1, 5000, 9000); -- 7
    
    INSERT INTO Trip(ID_Routee, ID_Bus, ID_Driver, DateDeparture) VALUES
    
        -- маршруты Новосибирск -> Томск
        (1, 1, 1, '2023-05-09'), -- 1
        (2, 2, 1, '2023-05-09'), -- 2
        
        -- маршруты Томск -> Новосибирск
        (3, 1, 2, '2014-05-10'), -- 3
        (4, 2, 2, '2015-05-10'), -- 4

        -- тест тригера на обновление данных
        (5, 3, NULL, '2023-05-13'), -- 5
        (6, 3, NULL, '2023-05-13'), -- 6

        -- тест на доступность для автобуса с 30 местами
        (7, NULL, NULL, '2060-03-14'); -- 7

    INSERT INTO TicketOffice(ID_City, Address) VALUES
        
        -- Кассы в Новосибирске
        (1, 'Ул 1 города Новосибирск'), -- 1
        (1, 'Ул 2 города Новосибирск'), -- 2

        -- кассы в Томске
        (2, 'Ул 1 города Томск'),       -- 3
        (2, 'Ул 2 города Томск');       -- 4

    INSERT INTO Ticket(ID_TicketOffice, ID_Trip, DateOfSale, ID_Client) VALUES
        -- маршруты Новосибирск -> Томск
        (1, 1, '2023-05-09', 1),
        (1, 1, '2023-05-09', 2),
        (1, 1, '2023-05-09', 3),

        (2, 2, '2023-05-09', 4),
        (2, 2, '2023-05-09', 5),
        (2, 2, '2023-05-09', 6),

        -- маршруты Томск -> Новосибирск
        (3, 3, '2014-05-10', 1),
        (3, 3, '2014-05-10', 2),
        (3, 3, '2014-05-10', 3),

        (4, 4, '2015-05-10', 4),
        (4, 4, '2015-05-10', 5),
        (4, 4, '2015-05-10', 6);

    GO

    -- 1
    -- Получить данные (время, цену на билет) о рейсах в город Томск из города Новосибирск

    CREATE PROCEDURE VIEW_DataTrip(@CityDeparture VARCHAR, @CityArrival VARCHAR)
    AS
        SELECT TravelTime as [время путешествия], Price as [цена на билет] FROM Routee WHERE 
        ID_CityDeparture = (SELECT TOP(1) ID FROM City WHERE Name = @CityDeparture) 
            AND 
        ID_CityArrival = (SELECT TOP(1) ID FROM City WHERE Name = @CityArrival);

    GO
    
    ALTER PROCEDURE VIEW_DataTrip(@CityDeparture VARCHAR(255), @CityArrival VARCHAR(255))
    AS
        SELECT TravelTime as [время путешествия], Price as [цена на билет] FROM Routee WHERE 
        ID_CityDeparture = (SELECT ID FROM City WHERE Name = @CityDeparture) 
            AND 
        ID_CityArrival = (SELECT ID FROM City WHERE Name = @CityArrival);

-- 2

    -- Получить суммарный доход какой-либо кассы.
    GO 

        CREATE FUNCTION VIEW_TicketOffice(@ID_TicketOffice INT)
        RETURNS TABLE
        AS
        RETURN (SELECT * FROM TicketOffice)

    GO

        ALTER FUNCTION VIEW_TicketOffice(@ID_TicketOffice INT)
        RETURNS TABLE
        AS
        RETURN (SELECT SUM([маршрут].Price) as [доход кассы] FROM TicketOffice as [касса]
        
        INNER JOIN Ticket as [билет] ON [касса].ID = ID_TicketOffice 
        INNER JOIN Trip as [конкретный рейс] ON [билет].ID_Trip = [конкретный рейс].ID
        INNER JOIN Routee as [маршрут] ON [конкретный рейс].ID_Routee = [маршрут].ID
        WHERE [касса].ID = @ID_TicketOffice)

    GO

-- 3

    -- Получить суммарные доходы касс в городе Томске
    CREATE VIEW VIEW_TicketOfice_Profit_from_TOMSK
    AS
    SELECT * FROM TicketOffice;

    GO

    ALTER VIEW VIEW_TicketOfice_Profit_from_TOMSK
    AS
        SELECT SUM([маршрут].Price) as [суммарный доход касс в томские] FROM TicketOffice as [касса]
        
        INNER JOIN Ticket as [билет] ON [касса].ID = [билет].ID_TicketOffice 
        INNER JOIN Trip as [конкретный рейс] ON [билет].ID_Trip = [конкретный рейс].ID
        INNER JOIN Routee as [маршрут] ON [конкретный рейс].ID_Routee = [маршрут].ID
        WHERE [касса].ID_City = (SELECT ID FROM City WHERE Name = 'Томск')
-- 4

    -- Получить число рейсов, совершѐнных данным водителем за год

    GO

    CREATE PROCEDURE VIEW_DriveCount(@Id_Drive INT)
    AS
        SELECT COUNT(*) FROM Trip WHERE ID_Driver = @Id_Drive;

    GO
    
    ALTER PROCEDURE VIEW_DriveCount(@Id_Drive INT, @Year INT)
    AS
        SELECT COUNT(*) as [количество совершѐнных рейсов] FROM Trip WHERE ID_Driver = @Id_Drive AND YEAR(DateDeparture) = @Year;

    GO
-- 5

    -- Назначить водителя на рейс.


    CREATE TRIGGER TripSet
    ON Trip
    INSTEAD OF UPDATE
    AS
        SELECT 'назначаем водителя на рейс';

    GO

    ALTER TRIGGER TripSet
    ON Trip
    INSTEAD OF UPDATE
    AS
        DECLARE @ID int, @id_route int, @id_bus int, @id_driver int, @date_departure varchar(11)

        DECLARE instdd CURSOR LOCAL FOR   
        SELECT *
        FROM inserted

        OPEN instdd 
        
        FETCH NEXT FROM instdd INTO @ID, @id_route, @id_bus, @id_driver, @date_departure   
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            --    SELECT @ID, @name, @specialty, @curator, @warden;
                    if (SELECT ID_City FROM Driver WHERE ID = @id_driver) != (SELECT ID_CityDeparture FROM Routee WHERE ID = @id_route)
                    BEGIN
                        -- SELECT @ID, @name, @specialty, @curator, @warden;
                        -- PRINT('староста не пренадлежит группе')
                        CLOSE instdd;  
                        THROW 51000, 'город отправления не совпадает с родным городом водителя', 1;  
                        RETURN;
                    END; 

                    PRINT('итерация')
                    UPDATE Trip 
                    SET 
                    ID_Routee = @id_route,
                    ID_Bus = @id_bus,
                    ID_Driver = @id_driver,
                    DateDeparture = @date_departure
                    WHERE Trip.ID = @ID; 

                    FETCH NEXT FROM instdd INTO @ID, @id_route, @id_bus, @id_driver, @date_departure;
        END;
        CLOSE instdd;  



-- 6
    GO
    -- Оформить билет для клиента в город Новосибирск из Томска, с учѐтом занятых мест в автобусе.

    CREATE PROCEDURE ByTicket(@id_client int)
    AS
        BEGIN

            SELECT * FROM Client;

        END;
    
    GO

    ALTER PROCEDURE ByTicket(@id_client int, @id_city_departure int, @id_city_arrival int, @id_ticket_office int)
    AS
        BEGIN
            -- проверка на то чтобы касса была в городе отправления, но в тз такого ограничения нет
            --IF (SELECT ID_City FROM TicketOffice WHERE ID = @id_ticket_office) = @id_city_departure
                --BEGIN
                    DECLARE @id_trip int;
                    
                        SELECT @id_trip = MAX(ID) FROM Trip as [конкретный рейс]
                        WHERE 
                        ID_Routee in ( SELECT ID FROM Routee 
                            WHERE ID_CityArrival = @id_city_arrival 
                            AND ID_CityDeparture = @id_city_departure)
                        AND (SELECT COUNT(*) FROM Ticket WHERE ID_Trip = [конкретный рейс].ID) < (SELECT QuantityPlace FROM Bus WHERE ID = [конкретный рейс].ID_Bus);
                    
                    --SELECT @id_trip;

                    IF @id_trip is NULL
                        BEGIN
                            PRINT('подходящего билета не найдено')
                        END;
                    ELSE    
                        BEGIN
                            PRINT('покупаю билет')  
                            INSERT INTO Ticket(ID_TicketOffice, ID_Trip, DateOfSale, ID_Client) VALUES (@id_ticket_office, @id_trip, GETDATE(), @id_client);
                        END;
                --END;
        END;



-- 7
    
    GO

    -- Получить число рейсов, совершѐнных автобусами «Икарус» и «ПАЗ».
     CREATE FUNCTION CountBus()
        RETURNS TABLE
        AS
        RETURN (SELECT Count(*) as [чтсло рейсов] FROM Bus)

    GO

        ALTER FUNCTION CountBus()
        RETURNS TABLE
        AS

        RETURN (SELECT COUNT(*) as [число рейсов совершѐнных автобусами «Икарус» и «ПАЗ»] FROM Trip as [конкретный рейс] 
            WHERE (SELECT Trademark FROM Bus WHERE ID = [конкретный рейс].ID_Bus) in ('Икарус', 'ПАЗ') )

    GO
-- 8

    -- Проверить все свободные места на рейс.
     CREATE FUNCTION FreePlaces(@id_trip int)
        RETURNS TABLE
        AS
        RETURN (SELECT (SELECT COUNT(*) FROM Ticket WHERE ID_Trip = [конкретный рейс].ID) as [заянто мест],
                        [автобус].QuantityPlace as [всего мест],
                        [автобус].QuantityPlace - (SELECT COUNT(*) FROM Ticket WHERE ID_Trip = [конкретный рейс].ID) as [свободно мест]
                        FROM Trip as [конкретный рейс] INNER JOIN Bus as [автобус] ON [конкретный рейс].ID_Bus = [автобус].ID 
                        WHERE [конкретный рейс].ID = @id_trip)

    GO

        ALTER FUNCTION FreePlaces(@id_trip int)
        RETURNS TABLE
        AS
        RETURN (SELECT (SELECT COUNT(*) FROM Ticket WHERE ID_Trip = [конкретный рейс].ID) as [заянто мест],
                        [автобус].QuantityPlace as [всего мест],
                        [автобус].QuantityPlace - (SELECT COUNT(*) FROM Ticket WHERE ID_Trip = [конкретный рейс].ID) as [свободно мест],
                        @id_trip as [id рейса]
                        FROM Trip as [конкретный рейс] INNER JOIN Bus as [автобус] ON [конкретный рейс].ID_Bus = [автобус].ID 
                        WHERE [конкретный рейс].ID = @id_trip)
    GO
-- 9

    -- Показать число билетов, проданных кассами.


    CREATE FUNCTION CashTicketOffic()
    RETURNS INT
    AS
        BEGIN
            DECLARE @count int;
        
            SELECT @count = COUNT(*) FROM Ticket
            RETURN @count
        END;
    GO

    ALTER FUNCTION CashTicketOffic()
    RETURNS INT
    AS
        BEGIN
            DECLARE @count int;
        
            SELECT @count = COUNT(*) FROM Ticket
            RETURN @count
        END;
    GO

-- 10

    -- Показать среднюю цену билетов.
    CREATE FUNCTION AVGTickets()
    RETURNS FLOAT
    AS
        BEGIN
            DECLARE @count float;
        
            SELECT @count = (SELECT AVG(Price) FROM Routee WHERE ID = [конкретный рейс].ID_Routee) FROM Ticket as [билет] 
            INNER JOIN Trip as [конкретный рейс] ON [билет].ID_Trip  = [конкретный рейс].ID 
            RETURN @count
        END;
    GO

    ALTER FUNCTION AVGTickets()
    RETURNS FLOAT
    AS
        BEGIN
            DECLARE @count float;
        
            SELECT @count = AVG([рейс по расписанию].Price) FROM Ticket as [билет] 
            INNER JOIN Trip as [конкретный рейс] ON [билет].ID_Trip  = [конкретный рейс].ID 
            INNER JOIN Routee as [рейс по расписанию] ON [рейс по расписанию].ID = [конкретный рейс].ID_Routee
            RETURN @count
        END;
    GO

-- 11
    -- Показать рейсы, цена на которые выше средней цены на билеты.
    CREATE FUNCTION MoreAVGTickets()
    RETURNS TABLE
    AS
        RETURN ( SELECT * FROM Trip )
            
    GO

    ALTER FUNCTION MoreAVGTickets()
    RETURNS TABLE
    AS
         RETURN ( SELECT [рейс по расписанию].Price as [цена],
                         (SELECT Name FROM City WHERE ID = [рейс по расписанию].ID_CityDeparture ) as [город отправления],
                         (SELECT Name FROM City WHERE ID = [рейс по расписанию].ID_CityArrival ) as [город прибытия],
                         [конкретный рейс].DateDeparture as [дата отправления],
                          dbo.AVGTickets() as [средняя цена на билет]
                         FROM Trip as [конкретный рейс] 
         INNER JOIN Routee as [рейс по расписанию] ON [конкретный рейс].ID_Routee = [рейс по расписанию].ID
         WHERE [рейс по расписанию].Price > dbo.AVGTickets())

    GO

-- 12
    -- Отменить клиенту билет, после того как он его вернул.
    CREATE PROCEDURE RefundClientTicket(@id_trip int, @id_client int)
    AS
        BEGIN
            DELETE TOP(1) FROM Ticket WHERE ID_Trip = @id_trip AND ID_Client = @id_client;
        
        END;

    GO
-- 13
    -- Показать информацию о рейсах из города Томск (включая цену на билет, время рейса).
    CREATE VIEW TripInfo
    AS
        SELECT  [конкретный рейс].DateDeparture as [дата отправления],
                [рейс по расписанию].Price as [цена билета],
                [рейс по расписанию].TravelTime as [время рейса в минутах],
                [рейс по расписанию].ID_CityDeparture as [город отправления] FROM Trip as [конкретный рейс] 
            INNER JOIN Routee as [рейс по расписанию] ON [конкретный рейс].ID_Routee = [рейс по расписанию].ID 
            WHERE [рейс по расписанию].ID_CityDeparture = (SELECT ID FROM City WHERE Name = 'Томск');

    GO

    ALTER VIEW TripInfo
    AS
        SELECT  [конкретный рейс].DateDeparture as [дата отправления],
                [рейс по расписанию].Price as [цена билета],
                [рейс по расписанию].TravelTime as [время рейса в минутах],
                (SELECT Name FROM City WHERE ID = [рейс по расписанию].ID_CityDeparture) as [город отправления]
                FROM Trip as [конкретный рейс] 
            INNER JOIN Routee as [рейс по расписанию] ON [конкретный рейс].ID_Routee = [рейс по расписанию].ID 
            WHERE [рейс по расписанию].ID_CityDeparture = (SELECT ID FROM City WHERE Name = 'Томск');

    GO

-- 14
    -- Посчитать количество билетов, проданных по рейсам Томск – Новосибирск за 2014-2015.
    CREATE FUNCTION CountOfTickets()
    RETURNS INT
    AS
        BEGIN
            RETURN (SELECT COUNT(*) FROM Ticket as [билет] 
                INNER JOIN Trip as [конкретный рейс] ON [конкретный рейс].ID = [билет].ID_Trip
                INNER JOIN Routee as [рейс по расписанию] ON [рейс по расписанию].ID = [конкретный рейс].ID_Routee
                WHERE [рейс по расписанию].ID_CityDeparture = (SELECT ID FROM City WHERE Name = 'Томск')
                      AND [рейс по расписанию].ID_CityArrival = (SELECT ID FROM City WHERE Name = 'Новосибирск')
                      AND YEAR([билет].DateOfSale) IN (2014, 2015) ) ;
        END;

    GO

    ALTER FUNCTION CountOfTickets()
    RETURNS INT
    AS
        BEGIN
            RETURN (SELECT COUNT(*) FROM Ticket as [билет] 
                INNER JOIN Trip as [конкретный рейс] ON [конкретный рейс].ID = [билет].ID_Trip
                INNER JOIN Routee as [рейс по расписанию] ON [рейс по расписанию].ID = [конкретный рейс].ID_Routee
                WHERE [рейс по расписанию].ID_CityDeparture = (SELECT ID FROM City WHERE Name = 'Томск')
                      AND [рейс по расписанию].ID_CityArrival = (SELECT ID FROM City WHERE Name = 'Новосибирск')
                      AND YEAR([билет].DateOfSale) IN (2014, 2015) ) ;
        END;
    
    GO
-- 15
    -- Назначить автобус на рейс
ALTER TRIGGER TripSet
    ON Trip
    INSTEAD OF UPDATE
    AS
        DECLARE @ID int, @id_route int, @id_bus int, @id_driver int, @date_departure varchar(11)

        DECLARE instdd CURSOR LOCAL FOR   
        SELECT *
        FROM inserted

        OPEN instdd 
        
        FETCH NEXT FROM instdd INTO @ID, @id_route, @id_bus, @id_driver, @date_departure   
        
        WHILE @@FETCH_STATUS = 0
        BEGIN
            --    SELECT @ID, @name, @specialty, @curator, @warden;
                    if (SELECT ID_City FROM Driver WHERE ID = @id_driver) != (SELECT ID_CityDeparture FROM Routee WHERE ID = @id_route)
                    BEGIN
                        -- SELECT @ID, @name, @specialty, @curator, @warden;
                        -- PRINT('староста не пренадлежит группе')
                        CLOSE instdd;  
                        THROW 51000, 'город отправления не совпадает с родным городом водителя', 1;  
                        RETURN;
                    END; 

                    if (SELECT QuantityPlace FROM Bus WHERE ID = @id_bus) < (SELECT MIN_QuantityPlace FROM Routee WHERE ID = @id_route)
                    BEGIN
                        CLOSE instdd;  
                        THROW 51001, 'автобус не соответствует минимальному требованию по количеству мест', 1;  
                        RETURN;
                    END;


                    PRINT('итерация')
                    UPDATE Trip 
                    SET 
                    ID_Routee = @id_route,
                    ID_Bus = @id_bus,
                    ID_Driver = @id_driver,
                    DateDeparture = @date_departure
                    WHERE Trip.ID = @ID; 

                    FETCH NEXT FROM instdd INTO @ID, @id_route, @id_bus, @id_driver, @date_departure;
        END;
        CLOSE instdd;  

    GO
-- 16
    -- Получить список рейсов, на которые может быть назначен данный водитель и данный автобус с числом мест, равным 30.
    CREATE FUNCTION GetListRoutee(@id_bus INT)
    RETURNS TABLE
    AS
        RETURN (SELECT [конкретный рейс].ID, 
            (SELECT Name FROM City WHERE ID = [рейс по расписанию].ID_CityArrival) as [город куда],
            (SELECT Name FROM City WHERE ID = [рейс по расписанию].ID_CityDeparture) as [город откуда],
            [рейс по расписанию].MIN_QuantityPlace as [минимальное количество мест] FROM Trip as [конкретный рейс] 
            INNER JOIN Routee as [рейс по расписанию] ON [конкретный рейс].ID_Routee = [рейс по расписанию].ID
            WHERE (SELECT QuantityPlace FROM Bus as [автбс] WHERE [автбс].ID = @id_bus) >= [рейс по расписанию].MIN_QuantityPlace ); 

    GO

-- 17
    -- После ремонта в автобусе добавили 3 места, добавить эти места и в БД.
    CREATE PROCEDURE UpdateCountOfPlaces(@id_bus INT, @places_count INT)
    AS
    BEGIN
        DECLARE @old INT;
        SELECT @old = QuantityPlace FROM Bus WHERE ID = @id_bus;
        UPDATE Bus SET QuantityPlace = @old + @places_count WHERE ID = @id_bus;
        PRINT('количество мест обновлено')
    END;

    GO

    ALTER PROCEDURE UpdateCountOfPlaces(@id_bus INT, @add_places INT)
    AS
    BEGIN
        DECLARE @old INT;
        SELECT @old = QuantityPlace FROM Bus WHERE ID = @id_bus;
        UPDATE Bus SET QuantityPlace = @old + @add_places WHERE ID = @id_bus;
        PRINT('количество мест обновлено')
    END;

