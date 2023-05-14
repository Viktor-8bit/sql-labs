







SELECT * FROM Bus;

SELECT * FROM Trip;

SELECT * FROM Routee;

UPDATE Trip SET ID_Bus = 4 WHERE ID = 5; -- не работает кол мест 1 у авто нужно 3 мин
UPDATE Trip SET ID_Bus = 1 WHERE ID = 5; -- работает кол мест 10 у авто нудно 3 мин