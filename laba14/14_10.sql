





SELECT dbo.AVGTickets() as [средняя цена билета];




SELECT (SELECT Price FROM Routee WHERE ID = [конкретный рейс].ID_Routee) FROM Ticket as [билет] 
INNER JOIN Trip as [конкретный рейс] ON [билет].ID_Trip  = [конкретный рейс].ID;


