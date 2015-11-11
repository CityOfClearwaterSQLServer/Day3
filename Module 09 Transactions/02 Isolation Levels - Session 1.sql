use SQLClass

-- Live Lock #1
-- Run These First
select * from Sales.Customers

begin transaction

update Sales.Customers set State = 'GA'

-- Switch to other session

rollback 


-- Live Lock #2
-- Run this after code on other session
begin transaction
insert Sales.Customers (FirstName, LastName, Email)
values ('Abby', 'Jetson', 'lostsis@cogswell.com')
-- It should be waiting for select to commit or rollback in other session

rollback