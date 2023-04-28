
SELECT TOP(3) [прдкт].Name, ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) as [Сумма]

FROM Deal as [сдлк] Inner Join Store as [склд] ON [сдлк].ID_Store = [склд].ID

Inner Join Product as [прдкт] ON [склд].ID_Product = [прдкт].ID

GROUP BY [прдкт].Name

ORDER BY [Сумма] DESC
