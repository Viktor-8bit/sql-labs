


SELECT [прод].Name as [товар], ISNULL([клт].Name, 'не определён') as [покупатель], ISNULL( CAST([сдлк].Quantity as CHAR(255)), 'нет продж') as [количесто]

FROM Store as [склд] 

RIGHT JOIN Product as [прод] ON [склд].ID_Product = [прод].ID 

LEFT JOIN Deal as [сдлк] ON [сдлк].ID_Store = [склд].ID

LEFT JOIN Client as [клт] ON [сдлк].ID_Client = [клт].ID