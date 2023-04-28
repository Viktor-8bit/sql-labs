

 

SELECT [прод].ID, [прод].Name as [товар], [пствщик].Name as [поставщик], [склд].Quantity as [количество] FROM Product as [прод] 
LEFT JOIN Store as [склд] ON [прод].ID = [склд].ID_Product
LEFT JOIN Provider as [пствщик] ON [пствщик].ID = [склд].ID_Provider;


