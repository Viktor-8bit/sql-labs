






SELECT * FROM dbo.CountBus();


SELECT (SELECT Trademark FROM Bus WHERE ID = ID_Bus) as [марка автобуса] FROM Trip;