USE Hotel
GO

CREATE TABLE dbo.DemoTable
( DemoTableId int IDENTITY(1,1) PRIMARY KEY,
  FirstLargeColumn nvarchar(600),
  BigIntColumn bigint
);
GO

SET NOCOUNT ON;
INSERT INTO DemoTable (FirstLargeColumn,BigIntColumn)
  VALUES('This is some testdata',12345);
GO 5000