EXEC master.dbo.xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'SOFTWARE\Microsoft\MSSQLServer\SQLServerAgent', N'UseDatabaseMail', N'REG_DWORD', 1
GO
EXEC master.dbo.xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'SOFTWARE\Microsoft\MSSQLServer\SQLServerAgent', N'DatabaseMailProfile', N'REG_SZ', N'sqladmin'
GO
EXEC msdb.dbo.sp_set_sqlagent_properties @sqlserver_restart=1, 
		@monitor_autostart=1, 
		@auto_start=1, 
		@jobhistory_max_rows=1000, 
		@jobhistory_max_rows_per_job=100, 
		@errorlog_file=N'E:\SQL2005_systemdb\MSSQL.1\MSSQL\LOG\SQLAGENT.OUT', 
		@errorlogging_level=3, 
		@job_shutdown_timeout=15, 
		@email_save_in_sent_folder=1, 
		@oem_errorlog=0, 
		@cpu_poller_enabled=0, 
		@idle_cpu_percent=10, 
		@idle_cpu_duration=600, 
		@login_timeout=30, 
		@alert_replace_runtime_tokens=0
GO
