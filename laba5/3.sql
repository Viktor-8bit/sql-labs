﻿
/*
INSERT INTO Client(Name, [Phone], [Address], [Sex]) VALUES
('Волков Богдан Максимович', '6(176)262-06-43', '547493, Калининградская область, город Москва, бульвар Гагарина, 29', 'М'),
('Голицин Пётр Степенович', '4(403)478-15-53', '291438, Мурманская область, город Дорохово, спуск Балканская, 03', 'М');
*/


SELECT Name FROM Client WHERE NAME LIKE('В%');