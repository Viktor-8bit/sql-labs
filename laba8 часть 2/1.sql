



SELECT TOP(3)

стрднк.Name

, ROUND(CAST(SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) as float), 2) as [сумма сделок]

, RANK() over ( ORDER BY SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) desc) as [занятое место]


FROM Employee as [стрднк] 

 JOIN Deal as [сдлк] ON [стрднк].ID = [сдлк].ID_Employee
 JOIN Store as [склд] ON [склд].ID = [сдлк].ID_Store

GROUP BY стрднк.Name




--SELECT 

--стрднк.Name, SUM([сдлк].Quantity * [склд].Price * (1 - [сдлк].Discount / 100 )) FROM Deal as [сдлк] 

--Inner JOIN Store as [склд] ON [сдлк].ID_Store = [склд].ID
--Inner JOIN Employee as [стрднк] ON [склд].ID_Provider = [стрднк].ID

--GROUP BY стрднк.Name;