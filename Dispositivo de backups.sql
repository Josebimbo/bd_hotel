Use Hotel
go
USE master;  
GO

--Crea dispositivo de almacenamiento
EXEC sp_addumpdevice 'disk', 'HotelData',   
'D:\Hotel\BACKUP\HotelData.bak';  
GO

BACKUP DATABASE Hotel   
 TO HotelData  
   WITH FORMAT, INIT, NAME = N'Hotel – Full Backup' ;  
GO  

DECLARE @BackupName VARCHAR(100)
SET @BackupName = N'Hotel – Full Backup 1 ' + FORMAT(GETDATE(),'yyyyMMdd_hhmmss');


SELECT      *
FROM        sys.backup_devices
GO