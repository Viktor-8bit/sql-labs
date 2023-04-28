
SELECT [прдкт].Name as [Наименование],  datename(month, [сдлк].Datee) as [Месяц],

YEAR([сдлк].Datee) as [Год],

ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) as [Сумма]

FROM Deal as [сдлк] Inner Join Store as [склд] ON [склд].ID = [сдлк].ID_Store

Inner Join Product as [прдкт] ON [прдкт].ID = [склд].ID_Product

WHERE [сдлк].ID_Store = 4 


GROUP BY [сдлк].ID_Store, YEAR([сдлк].Datee), datename(month, [сдлк].Datee)
, [прдкт].Name

HAVING ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) < 300;


--SELECT

--[прдкт].Name as [Наименование], 

--datename(month, [сдлк].Datee) as [Месяц] ,

--YEAR([сдлк].Datee) as [Год],

--ROUND(CAST(([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) as [check]

--FROM Deal as [сдлк] 

--Inner Join Store as [склд] ON [склд].ID = [сдлк].ID_Store

--Inner Join Product as [прдкт] ON [прдкт].ID = [склд].ID_Product 


--WHERE [сдлк].ID_Store = 4


