use SQLClass

drop index Sales.Customers.idxCustomersFirstNameLastName
create index idxCustomersFirstNameLastName			
on Sales.Customers(FirstName, LastName)
include (Email)
with (fillfactor = 50, pad_index = on)

select AccountNumber, FirstName, LastName, Email
from Sales.Customers 
order by FirstName desc, LastName desc
-- View Execution Plan


-- Check Fragmentation
select a.index_id, b.name, a.avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats(db_id(N'SQLClass'), object_id(N'Sales.Customers'), null, null, null) as a
    join sys.indexes as b on a.object_id = b.object_id and a.index_id = b.index_id; 

-- Rebuild or Reorg Index
alter index idxCustomersFirstNameLastName
on Sales.Customers
rebuild										-- reorganize



-- Possible other syntaxes
	-- create unique index ...
	-- create clustered index ...
	-- create nonclustered index ...
