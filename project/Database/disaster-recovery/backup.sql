

DECLARE @filename VARCHAR(20) 
DECLARE @filepath VARCHAR(100) 
DECLARE @backup_date VARCHAR(10) 
 
 
SET @filepath = 'C:\MSSQL\Backup\' 
  
SET @backup_date = CONVERT(VARCHAR(20),GETDATE()) 
  
BEGIN 
  
SET @filename = @filepath + @backup_date + '_database_backup.BAK' 
  
BACKUP DATABASE s16guest06 TO DISK = @filename 
  
END 
