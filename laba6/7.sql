SELECT 

cl.Name,

ISNULL((SELECT 'мужской' WHERE cl.Sex = 'М'), '')
+
ISNULL((SELECT 'женский' WHERE cl.Sex = 'Ж'), '')

FROM Client as cl;

