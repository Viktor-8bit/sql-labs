



/*
SELECT (SELECT Name FROM Product WHERE ID = [����].ID_Product) as [�����] , [����].Name as [���������] FROM Provider as [����] 
INNER JOIN Store as [����] ON [����].ID = [����].ID_Provider;
*/




SELECT [�����].Name as [�����] , [����].Name as [���������] FROM Provider as [����] 
INNER JOIN Store as [����] ON [����].ID = [����].ID_Provider
INNER JOIN Product as [�����] ON [�����].ID = [����].ID_Product;


SELECT [�����].Name as [�����] , [����].Name as [���������] FROM Provider as [����] 

INNER JOIN Store as [����] ON [����].ID = [����].ID_Provider
INNER JOIN Product as [�����] ON [�����].ID = [����].ID_Product;