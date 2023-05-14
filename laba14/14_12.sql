




-- В 6 задании можно купит билеты
-- EXECUTE dbo.ByTicket @id_client = 7, @id_city_departure = 2, @id_city_arrival = 1, @id_ticket_office = 4;

SELECT * FROM Ticket;

EXECUTE dbo.RefundClientTicket @id_trip = 4, @id_client = 7; 