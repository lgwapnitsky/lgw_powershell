IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_27_Backup_Current_Table_Renames]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_27_Backup_Current_Table_Renames]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_27_Backup_Current_Table_Renames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE procedure [dbo].[usp_Step_27_Backup_Current_Table_Renames]

as

-- FootPrints Ticket #66469
-- Creator:	Erik Godfrey
-- Date: 1/23/2013
-- Description: Rename Current tables to Backup tables
--              Rename Work tables to Current tables\

-- FootPrints Ticket #73674
-- Creator:	Steve Breisch
-- Date: 6/11/2013
-- Description: Follow established process for these new tables:
--                   Latest_Policy_Information_AE_RangesOnly_View_1_table_work
--                   Latest_Policy_Information_AE_View_1_table_work
--                   Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work
--                   Latest_Policy_Information_CL_View_1_table_work
--                   Latest_Policy_Information_FF_View_1_table_work
--                   Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work
--                   Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work
--                   Latest_Policy_Information_GL_AVG_RATES_View_1_table_work
--                   Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work
--                   Latest_Policy_Information_PVCD_View_1_table_work
--                   Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work
--                   Latest_Policy_Information_UWChecklist_View_1_table_work


set nocount on

if exists (select 1 from sys.tables where name = ''Latest_All_Lines_View_1_tableBK'')
   drop table Latest_All_Lines_View_1_tableBK

if exists (select 1 from sys.tables where name = ''Latest_All_Lines_Losses_View_1_tableBK'')
   drop table Latest_All_Lines_Losses_View_1_tableBK

-- Added 6/11/2013 

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_AE_RangesOnly_View_1_tableBK'')
   drop table Latest_Policy_Information_AE_RangesOnly_View_1_tableBK
   
if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_AE_View_1_tableBK'')
   drop table Latest_Policy_Information_AE_View_1_tableBK
   
if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_tableBK'')
   drop table Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_tableBK

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_CL_View_1_tableBK'')
   drop table Latest_Policy_Information_CL_View_1_tableBK

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_FF_View_1_tableBK'')
   drop table Latest_Policy_Information_FF_View_1_tableBK
   
if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_tableBK'')
   drop table Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_tableBK
   
if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_tableBK'')
   drop table Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_tableBK

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_GL_AVG_RATES_View_1_tableBK'')
   drop table Latest_Policy_Information_GL_AVG_RATES_View_1_tableBK

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_ALL_POLICIES_GL_View_1_tableBK'')
   drop table Latest_Policy_Information_ALL_POLICIES_GL_View_1_tableBK
   
if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_PVCD_View_1_tableBK'')
   drop table Latest_Policy_Information_PVCD_View_1_tableBK
   
if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_UWChecklist_RangesOnly_View_1_tableBK'')
   drop table Latest_Policy_Information_UWChecklist_RangesOnly_View_1_tableBK

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_UWChecklist_View_1_tableBK'')
   drop table Latest_Policy_Information_UWChecklist_View_1_tableBK

exec sp_rename ''Latest_All_Lines_View_1_table'', ''Latest_All_Lines_View_1_tableBK''

exec sp_rename ''Latest_All_Lines_Losses_View_1_table'', ''Latest_All_Lines_Losses_View_1_tableBK''

exec sp_rename ''Latest_All_Lines_View_1_table_work'', ''Latest_All_Lines_View_1_table''

exec sp_rename ''Latest_All_Lines_Losses_View_1_table_work'', ''Latest_All_Lines_Losses_View_1_table''

--  Added 6/11/2013

exec sp_rename ''Latest_Policy_Information_AE_RangesOnly_View_1_table'', ''Latest_Policy_Information_AE_RangesOnly_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_AE_View_1_table'', ''Latest_Policy_Information_AE_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table'', ''Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_CL_View_1_table'', ''Latest_Policy_Information_CL_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_FF_View_1_table'', ''Latest_Policy_Information_FF_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table'', ''Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table'', ''Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_GL_AVG_RATES_View_1_table'', ''Latest_Policy_Information_GL_AVG_RATES_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_ALL_POLICIES_GL_View_1_table'', ''Latest_Policy_Information_ALL_POLICIES_GL_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_PVCD_View_1_table'', ''Latest_Policy_Information_PVCD_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table'', ''Latest_Policy_Information_UWChecklist_RangesOnly_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_UWChecklist_View_1_table'', ''Latest_Policy_Information_UWChecklist_View_1_tableBK''

exec sp_rename ''Latest_Policy_Information_AE_RangesOnly_View_1_table_work'', ''Latest_Policy_Information_AE_RangesOnly_View_1_table''

exec sp_rename ''Latest_Policy_Information_AE_View_1_table_work'', ''Latest_Policy_Information_AE_View_1_table''

exec sp_rename ''Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work'', ''Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table''

exec sp_rename ''Latest_Policy_Information_CL_View_1_table_work'', ''Latest_Policy_Information_CL_View_1_table''

exec sp_rename ''Latest_Policy_Information_FF_View_1_table_work'', ''Latest_Policy_Information_FF_View_1_table''

exec sp_rename ''Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work'', ''Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table''

exec sp_rename ''Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work'', ''Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table''

exec sp_rename ''Latest_Policy_Information_GL_AVG_RATES_View_1_table_work'', ''Latest_Policy_Information_GL_AVG_RATES_View_1_table''

exec sp_rename ''Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work'', ''Latest_Policy_Information_ALL_POLICIES_GL_View_1_table''

exec sp_rename ''Latest_Policy_Information_PVCD_View_1_table_work'', ''Latest_Policy_Information_PVCD_View_1_table''

exec sp_rename ''Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work'', ''Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table''

exec sp_rename ''Latest_Policy_Information_UWChecklist_View_1_table_work'', ''Latest_Policy_Information_UWChecklist_View_1_table''

set nocount off

' 
END
GO
