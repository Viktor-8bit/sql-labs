


SELECT [прдкт].Name, 

Year([сдлк].Datee) as [год], 

datename(month, [сдлк].Datee) as [мес€ц],

ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) as [—умма]

FROM Deal as [сдлк] Inner Join Store as [склд] ON [сдлк].ID_Store = [склд].ID

Inner Join Product as [прдкт] ON [склд].ID_Product = [прдкт].ID

GROUP BY [прдкт].Name, Year([сдлк].Datee), datename(month, [сдлк].Datee);



--SELECT [прдкт].Name, Year([сдлк].Datee) as [год], 

--datename(month, [сдлк].Datee) as [мес€ц] FROM Deal as [сдлк] Inner Join Store as [склд] ON [сдлк].ID_Store = [склд].ID

--Inner Join Product as [прдкт] ON [склд].ID_Product = [прдкт].ID;