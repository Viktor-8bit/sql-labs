



SELECT (SELECT Product.Name FROM Product WHERE ID_Product = Product.ID) as [product] FROM Store WHERE Quantity BETWEEN 2 and 14 ORDER BY [product] DESC;