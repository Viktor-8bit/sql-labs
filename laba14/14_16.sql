


SELECT * FROM Bus;
SELECT *, (SELECT MIN_QuantityPlace FROM Routee WHERE ID = [конкретный рейс].ID_Routee) as [число мест минимальное] FROM Trip as [конкретный рейс];
SELECT * FROM dbo.GetListRoutee(5)