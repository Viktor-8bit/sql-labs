SELECT [продкт].Name as [Название], SUM([склд].Quantity) as [Количество],

CASE
	WHEN SUM([склд].Quantity) < 10 THEN 'Мало'
	WHEN 10 <= SUM([склд].Quantity) and SUM([склд].Quantity) <= 100 THEN 'Достаточно'
	WHEN SUM([склд].Quantity) > 100 THEN 'Избыточно'
END as [Оценка]

FROM Store as [склд] Inner Join Product as [продкт] ON [склд].[ID_Product] = [продкт].ID

GROUP BY [продкт].Name 
