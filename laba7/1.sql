



/*
SELECT (SELECT Name FROM Product WHERE ID = [склд].ID_Product) as [Товар] , [пост].Name as [Поставщик] FROM Provider as [пост] 
INNER JOIN Store as [склд] ON [пост].ID = [склд].ID_Provider;
*/




SELECT [прдкт].Name as [Товар] , [пост].Name as [Поставщик] FROM Provider as [пост] 
INNER JOIN Store as [склд] ON [пост].ID = [склд].ID_Provider
INNER JOIN Product as [прдкт] ON [прдкт].ID = [склд].ID_Product;


SELECT [прдкт].Name as [Товар] , [пост].Name as [Поставщик] FROM Provider as [пост] 

INNER JOIN Store as [склд] ON [пост].ID = [склд].ID_Provider
INNER JOIN Product as [прдкт] ON [прдкт].ID = [склд].ID_Product;