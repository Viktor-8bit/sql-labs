
SELECT 

стрднк.Name as [стрдник]
, YEAR([сдлк].Datee) as [год]
, MONTH([сдлк].Datee) as [месц]
, ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) as [Сумма сделк],

(ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) - ISNULL(lag(ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) ) over (order by стрднк.Name), 0)) as [разнца с предидущим] 


FROM Employee as [стрднк] 

RIGHT JOIN Deal as [сдлк] ON [стрднк].ID = [сдлк].ID_Employee
Inner JOIN Store as [склд] ON [склд].ID = [сдлк].ID_Store

GROUP BY стрднк.Name, YEAR([сдлк].Datee), MONTH([сдлк].Datee);


--SELECT 3150000 - 1640000;