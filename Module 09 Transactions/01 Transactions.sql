use SQLClass
-- My Session

select * from Sales.Customers

begin transaction

	update Sales.Customers set State = 'FL' where FirstName like 'A%'

save transaction UpdateTheAs

	delete Sales.Customers


rollback transaction UpdateTheAs

rollback
--commit