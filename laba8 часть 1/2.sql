SELECT [продкт].Name as [Название], SUM([склд].Quantity) as [Количество]

FROM Store as [склд] Inner Join Product as [продкт] ON [склд].ID_Product = [продкт].ID

GROUP BY [продкт].Name  

HAVING SUM([склд].Quantity) BETWEEN 1 and 10

