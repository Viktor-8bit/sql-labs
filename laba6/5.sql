



SELECT prod.Name FROM (SELECT Name, ID FROM Product WHERE Name LIKE('[כה]%')) as prod, Store 

WHERE Price < ( SELECT MAX(Price) * 0.2 From Store) 

and 

prod.ID = ID_Product
