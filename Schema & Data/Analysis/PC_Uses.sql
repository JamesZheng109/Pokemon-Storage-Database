SELECT pcinfo.PCTown AS 'Location', pcinfo.PCRegion AS 'Region',count(transactioninfo.LocationID) AS 'Count'
FROM pcinfo JOIN transactioninfo ON pcinfo.LocationID=transactioninfo.LocationID
GROUP BY pcinfo.LocationID;