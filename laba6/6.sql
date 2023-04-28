



SELECT Store.ID, (SELECT Name FROM Provider WHERE ID = ID_Provider)  FROM Store, (SELECT ID FROM Product WHERE Product.Name like('[כה]%') ) as p_id WHERE p_id.ID = ID_Product;

SELECT Name FROM Provider WHERE ID NOT IN (SELECT ID_Provider  FROM Store, (SELECT ID FROM Product WHERE Product.Name like('[כה]%') ) as p_id WHERE p_id.ID = ID_Product)