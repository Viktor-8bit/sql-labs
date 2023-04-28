SELECT COUNT(ID) as 'количество сделок за заданные дни' FROM Deal WHERE DATEPART(WEEKDAY, Datee) in (3, 7, 5);

SELECT *, DATEPART(WEEKDAY, Datee) FROM Deal;