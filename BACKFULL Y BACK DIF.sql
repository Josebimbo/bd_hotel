Use Hotel

BACKUP DATABASE [Hotel] 
TO  DISK = N'D:\Hotel\BACKUP\HotelData.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'HotelData-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;

BACKUP DATABASE [Hotel] 
TO  DISK = N'D:\Hotel\BACKUP\HotelDataDIF2.bak' 
WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'HotelDataDIF-Differential2 Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10

CREATE DATABASE Hotel2
Use master

RESTORE DATABASE [Hotel] 
FROM  DISK = N'D:\Hotel\BACKUP\HotelData.bak' 
WITH  FILE = 1,  
MOVE N'Hotel_Data' TO N'D:\Hotel\DATA\Hotel_Data.mdf',
MOVE N'Hotel_Log' TO N'D:\Hotel\LOG\Hotel_Log.ldf',  
NORECOVERY,  NOUNLOAD,  STATS = 5

RESTORE DATABASE [Hotel] 
FROM  DISK = N'D:\Hotel\BACKUP\HotelDataDIF.bak' 
WITH  FILE = 1,  
MOVE N'Hotel_Data' TO N'D:\Hotel\DATA\Hotel_Data.mdf',  
MOVE N'Hotel_Log' TO N'D:\Hotel\LOG\Hotel_Log.ldf',  
NOUNLOAD,  STATS = 5
