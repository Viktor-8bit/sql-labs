SELECT 

cl.Name,

ISNULL((SELECT '�������' WHERE cl.Sex = '�'), '')
+
ISNULL((SELECT '�������' WHERE cl.Sex = '�'), '')

FROM Client as cl;

