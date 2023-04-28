



SELECT COUNT(ID) as 'кол. сделок за текущий мес€ц' FROM Deal WHERE MONTH(Datee) = MONTH(GETDATE());



/*
SELECT * FROM Deal WHERE ID in (1, 2, 5, 10)
SELECT MONTH(GETDATE());
*/