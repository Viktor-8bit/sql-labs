

 

SELECT [����].ID, [����].Name as [�����], [�������].Name as [���������], [����].Quantity as [����������] FROM Product as [����] 
LEFT JOIN Store as [����] ON [����].ID = [����].ID_Product
LEFT JOIN Provider as [�������] ON [�������].ID = [����].ID_Provider;


