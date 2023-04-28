


SELECT * FROM Provider;

SELECT DISTINCT ID_Provider, (SELECT Name FROM Provider WHERE ID = ID_Provider) as [name] FROM Store ORDER BY [name];