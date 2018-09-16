# Lab 1

Task 1: Creati o baza de date plasata fizic in mapa MyDocuments\Data, fixand o crestere a fisierului primar a bazei de 16MB cu limita de crestere de 128 MB si a log-ului de 64 MB cu limita de crestere de 1024 MB. Pentru fisierele secundare sa se defineasca un Filegroup nou implicit, setand cresterea fisierelor secundare de 64 MB cu limita de 1024 MB.

![capturelab2](https://user-images.githubusercontent.com/43314952/45597586-271b2e00-b9d7-11e8-988d-3e2872237f26.PNG)

Task 2: Creati o baza de date, unde fisierul log sa fie fizic plasat in mapa MyDocuments\Log, numele fisierului log in mediul sistemului de operare trebuie sa se deosebeasca de cel logic definit in schema fizica. Este important ca baza de date creata sa fie compatibila cu sistemul MS SQL Server 2017 si ea sa fie accesibila numai unui singur utilizator intr-un moment de timp.

![capture-5](https://user-images.githubusercontent.com/43314952/45597635-f25ba680-b9d7-11e8-8802-209c2fd1b940.PNG)

Task 3: Creati planul de intretinere a bazei de date, construita in sarcina 1. Spatiul neutilizat de fisierele bazei de date trebuie indepartat atunci cand el atinge marimea 2000Mb. Spatiul eliberat trebuie sa fie returnat sistemului de operare. Aceasta operatiune trebuie sa ruleze in fiecare vineri, la ora 00:00. Raportul executarii planului de intretinere trebuie salvat in dosarul MyDocuments\SQL_event_logs. lnitializati executarea planului. Dupa executare, verificati rezultatele in fisierul log.

![capturelab3](https://user-images.githubusercontent.com/43314952/45597647-20d98180-b9d8-11e8-9c9f-dc91bf552f9e.PNG)

Task 4: Creati planul de intretinere a bazei de date, construite in exercitiul 2. Numele planului va fi: "Reconstruire index". In cadrul acestui plan, sistemul trebuie sa realizeze reconstruirea indecsilor numai asupra tabelelor de baza (exclusiv viziunilor) din toate schemele care exista in baza de date in cauza. Spatiul liber pe pagina trebuie sa fie 10%. Sortarea indecsilor trebuie sa se realizeze in tempdb. Dupa reconstruire, trebuie sa urmeze colectarea statisticilor complete despre indecsii reconstruiti. Al treilea pas al planului trebuie sa constituie sarcina de stergere a istoriei despre operatiile de Backup-Restore ce au avut loc pe SQL Server. Trebuie sters istoricul care este mai vechi de 6 saptamani. Acest plan trebuie sa fie executat in fiecare prima duminica a lunii. Creati dosarul MyDocuments\SQL_reports. Raportul de executare a planului trebuie sa fie adaugat in acest fisier. Procesul de mentenanta - sa fie logat in mod extended. lnitializati executarea planului. Dupa executare, verificati rezultatele in fisierul log generat.

![capturelab4](https://user-images.githubusercontent.com/43314952/45597668-5e3e0f00-b9d8-11e8-9f3f-d719f4c1f90c.PNG)


##### Microsoft(R) Server Maintenance Utility (Unicode) Version 14.0.2002
Report was generated on "VITALIE-PC".
Maintenance Plan: MaintenancePlanDatabase1
Duration: 00:00:01
Status: Succeeded.
Details:
Check Database Integrity (VITALIE-PC)
Check Database integrity on Local server connection
Databases: Database1
Include indexes
Physical only
Task start: 2018-09-16T18:19:19.
Task end: 2018-09-16T18:19:20.
Success
Command:USE [Database1]
GO
DBCC CHECKDB(N''Database1'')  WITH  PHYSICAL_ONLY

GO

Shrink Database (VITALIE-PC)
Shrink Database on Local server connection
Databases: Database1
Limit: 2000 MB
Free space: 10 %
Task start: 2018-09-16T18:19:20.
Task end: 2018-09-16T18:19:20.
Success
Command:
GO








##### Microsoft(R) Server Maintenance Utility (Unicode) Version 14.0.2002
Report was generated on "VITALIE-PC".
Maintenance Plan: Reconstruire index
Duration: 00:00:05
Status: Succeeded.
Details:
Check Database Integrity (VITALIE-PC)
Check Database integrity on Local server connection
Databases: Database2
Include indexes
Physical only
Task start: 2018-09-16T18:19:47.
Task end: 2018-09-16T18:19:47.
Success
Command:USE [Database2]
GO
DBCC CHECKDB(N''Database2'')  WITH  PHYSICAL_ONLY

GO

Rebuild Index (VITALIE-PC)
Rebuild index on Local server connection
Databases: Database2
Object: Tables and views
10% of free space
Task start: 2018-09-16T18:19:48.
Task end: 2018-09-16T18:19:48.
Success
Command:
GO

Update Statistics (VITALIE-PC)
Update Statistics on Local server connection
Databases: Database2
Object: Tables and views
All existing statistics
Task start: 2018-09-16T18:19:51.
Task end: 2018-09-16T18:19:51.
Success
Command:
GO

Clean Up History (VITALIE-PC)
Cleanup history on Local server connection
History type: Backup,Job,Maintenance Plan
Age: Older than 6 Weeks
Task start: 2018-09-16T18:19:51.
Task end: 2018-09-16T18:19:51.
Success
Command:declare @dt datetime select @dt = cast(N''2018-08-05T18:19:51'' as datetime) exec msdb.dbo.sp_delete_backuphistory @dt
GO
EXEC msdb.dbo.sp_purge_jobhistory  @oldest_date=''2018-08-05T18:19:51''
GO
EXECUTE msdb..sp_maintplan_delete_log null,null,''2018-08-05T18:19:51''

GO


