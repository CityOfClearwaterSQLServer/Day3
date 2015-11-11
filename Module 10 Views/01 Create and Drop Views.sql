use SQLClass

drop view SimpleOneTableView
go
create view SimpleOneTableView
as
select FirstName, LastName, Email as EmailAddress
from Sales.Customers
go

select *
from SimpleOneTableView
where Firstname like 'A%'

begin transaction
insert SimpleOneTableView values ('Wilma', 'Flintstone', 'wilma@bedrock.com')
rollback


drop view SimpleTwoTableView
go
create view SimpleTwoTableView
as
select FirstName, LastName, Email as EmailAddress, InvoiceNum, OrderDate
from Sales.Customers 
	join Sales.Sales	on Sales.Customers.AccountNumber = Sales.Sales.AccountNumber

select * from SimpleTwoTableView

-- Not Legal, Affects Two Base Tables
insert SimpleTwoTableView values ('Wilma', 'Flintstone', 'wilma@bedrock.com', 'INV20151111', GetDate())

-- Legal, One Table at a Time
begin transaction
	insert SimpleTwoTableView 
	(FirstName, LastName, EmailAddress)
	values ('Wilma', 'Flintstone', 'wilma@bedrock.com')
	insert SimpleTwoTableView 
	(InvoiceNum, OrderDate)
	values ('INV20151111', GetDate())

	select * from SimpleTwoTableView
	select * from Sales.Customers
	select * from Sales.Sales
rollback
