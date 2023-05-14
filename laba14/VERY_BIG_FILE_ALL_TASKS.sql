




-- 1
-- Получить данные (время, цену на билет) о рейсах в город Томск из города Новосибирск

EXECUTE dbo.VIEW_DataTrip @CityDeparture = 'Новосибирск', @CityArrival = 'Томск';


-- 2
-- Получить суммарный доход какой-либо кассы.
SELECT * FROM dbo.VIEW_TicketOffice(2)


-- 3
-- Получить суммарные доходы касс в городе Томске.
SELECT * FROM dbo.VIEW_TicketOfice_Profit_from_TOMSK;

-- 4
-- Получить число рейсов, совершѐнных данным водителем за год.

EXECUTE dbo.VIEW_DriveCount @Id_Drive = 1, @Year = 2023;


-- 5
-- Назначить водителя на рейс

UPDATE Trip SET ID_Driver = 3 WHERE ID = 6;
UPDATE Trip SET ID_Driver = 3 WHERE ID = 5;

SELECT ID_City FROM Driver;
SELECT * FROM Trip;
SELECT *, (SELECT ID_City FROM Driver WHERE ID = ID_Driver) as [город водителя], 
    (SELECT ID_CityDeparture FROM Routee WHERE ID = ID_Routee) as [отправной город маршрута] FROM Trip;


-- 6
-- Оформить билет для клиента в город Новосибирск из Томска, с учѐтом занятых мест в автобусе.
-- ('Новосибирск'), -- 1
-- ('Томск');       -- 2

-- Томск -> Новосибирск

EXECUTE dbo.ByTicket @id_client = 7, @id_city_departure = 2, @id_city_arrival = 1, @id_ticket_office = 4;
SELECT * FROM Ticket ORDER BY ID DESC;


-- 7 ?
-- Получить число рейсов, совершѐнных автобусами «Икарус» и «ПАЗ».

SELECT * FROM dbo.CountBus();
SELECT (SELECT Trademark FROM Bus WHERE ID = ID_Bus) as [марка автобуса] FROM Trip;

-- 8
-- Проверить все свободные места на рейс.

SELECT * FROM dbo.FreePlaces(3);
SELECT * FROM dbo.FreePlaces(4);

-- 9
-- Показать число билетов, проданных кассами.

SELECT dbo.CashTicketOffic() as [количество проданных кассами билетов];

-- 10
-- Показать среднюю цену билетов.

SELECT dbo.AVGTickets() as [средняя цена билета];

SELECT (SELECT Price FROM Routee WHERE ID = [конкретный рейс].ID_Routee) FROM Ticket as [билет] 
INNER JOIN Trip as [конкретный рейс] ON [билет].ID_Trip  = [конкретный рейс].ID;

-- 11
-- Показать рейсы, цена на которые выше средней цены на билеты

SELECT * FROM dbo.MoreAVGTickets();


-- 12
-- Отменить клиенту билет, после того как он его вернул.
-- В 6 задании можно купит билеты
-- EXECUTE dbo.ByTicket @id_client = 7, @id_city_departure = 2, @id_city_arrival = 1, @id_ticket_office = 4;

SELECT * FROM Ticket;

EXECUTE dbo.RefundClientTicket @id_trip = 4, @id_client = 7; 


-- 13
-- Показать информацию о рейсах из города Томск (включая цену на билет, время рейса).

SELECT * FROM dbo.TripInfo;


-- 14
-- Посчитать количество билетов, проданных по рейсам Томск – Новосибирск за 2014-2015.

SELECT * FROM Ticket WHERE YEAR(DateOfSale) in (2014, 2015);
SELECT dbo.CountOfTickets() as [количество билетов, проданных по рейсам Томск – Новосибирск за 2014-2015.];


-- 15
-- Назначить автобус на рейс

SELECT * FROM Bus;

SELECT * FROM Trip;

SELECT * FROM Routee;

UPDATE Trip SET ID_Bus = 4 WHERE ID = 5; -- не работает кол мест 1 у авто нужно 3 мин
UPDATE Trip SET ID_Bus = 1 WHERE ID = 5; -- работает кол мест 10 у авто нудно 3 мин


-- 16
-- Получить список рейсов, на которые может быть назначен данный водитель и данный автобус с числом мест, равным 30.

SELECT * FROM Bus;
SELECT *, (SELECT MIN_QuantityPlace FROM Routee WHERE ID = [конкретный рейс].ID_Routee) as [число мест минимальное] FROM Trip as [конкретный рейс];
SELECT * FROM dbo.GetListRoutee(5)


-- 17
-- После ремонта в автобусе добавили 3 места, добавить эти места и в БД.
-- возьмём авто с 4 id

EXECUTE dbo.UpdateCountOfPlaces @id_bus = 4, @add_places = 3;

SELECT * FROM Bus;

-- смайлики в sql работают ☕
