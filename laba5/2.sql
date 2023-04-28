

SELECT LEN(Product.Name), Product.Name, Provider.Name FROM Product, Store, Provider
WHERE [ID_Provider] = Provider.ID and ID_Product = Product.ID and LEN(Product.Name) = (SELECT MAX(LEN(Product.Name)) FROM Product);


SELECT TOP(1) LEN(Product.Name), Product.Name, Provider.Name FROM Product, Store, Provider
WHERE [ID_Provider] = Provider.ID and ID_Product = Product.ID ORDER BY LEN(Product.Name) DESC;
