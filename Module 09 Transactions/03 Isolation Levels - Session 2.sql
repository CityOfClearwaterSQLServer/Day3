use SQLClass

-- Live Lock #1
-- Run this after code on other session
select * from Sales.Customers
-- It should be waiting for update to commit or rollback in other session


-- Live Lock #2
-- Run this code first
set transaction isolation level Serializable

begin transaction

select * from Sales.Customers
where FirstName like 'A%'
-- Switch to other session

rollback