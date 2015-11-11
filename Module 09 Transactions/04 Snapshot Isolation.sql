use SQLClass

-- Setup
-- Do this code first without any other session open
set transaction isolation level read committed
alter database SQLClass set Read_Committed_Snapshot On

begin transaction

update Sales.Customers set State = 'GA'

select * from Sales.Customers

-- Open another session and run select from there

-- Cleanup
rollback
alter database SQLClass set Allow_Snapshot_Isolation Off


