




UPDATE Trip SET ID_Driver = 3 WHERE ID = 6;
UPDATE Trip SET ID_Driver = 3 WHERE ID = 5;

SELECT ID_City FROM Driver;
SELECT * FROM Trip;
SELECT *, (SELECT ID_City FROM Driver WHERE ID = ID_Driver) as [город водителя], (SELECT ID_CityDeparture FROM Routee WHERE ID = ID_Routee) as [отправной город маршрута] FROM Trip;