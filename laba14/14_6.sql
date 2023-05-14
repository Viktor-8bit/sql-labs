




-- ('Новосибирск'), -- 1
-- ('Томск');       -- 2

-- из томска в новосиб
-- нужна Томская касса id 3 или 4, хотя в условие нет ограничения на кассу

EXECUTE dbo.ByTicket @id_client = 7, @id_city_departure = 2, @id_city_arrival = 1, @id_ticket_office = 4;
SELECT * FROM Ticket ORDER BY ID DESC;