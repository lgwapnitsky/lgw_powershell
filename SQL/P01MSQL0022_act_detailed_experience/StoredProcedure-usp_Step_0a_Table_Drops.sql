IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_0a_Table_Drops]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_0a_Table_Drops]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_0a_Table_Drops]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE procedure [dbo].[usp_Step_0a_Table_Drops]

as

-- FootPrints Ticket #65106
-- Creator:	Erik Godfrey
-- Date: 2/7/2013
-- Description: Drop Previous Year Monthly Tables Prior To Execution Of Process

-- FootPrints Ticket #73460
-- Creator:	Steve Breisch
-- Date: 6/11/2013
-- Description: Add Non Hired Non Owened tables to process

set nocount on

declare @Month varchar(15)
declare @TableName varchar(100)
declare @SQLString nvarchar(max)

create table #tables_to_be_dropped (table_name varchar(100))

insert into #tables_to_be_dropped values (''RRHR_All_Policies_Price_Monitor_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_Detail_Information_1_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_Detail_Information_2_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_Detail_Information_3_'')
insert into #tables_to_be_dropped values (''ALL_CLAIMS_12_Information_1_'')
insert into #tables_to_be_dropped values (''Policy_Renewals_ALL_POLICIES_'')
insert into #tables_to_be_dropped values (''Policy_Product_State_Coverage_Data_ALL_POLICIES_'')
insert into #tables_to_be_dropped values (''Policy_Information_AE_'')
insert into #tables_to_be_dropped values (''Policy_Information_ALL_POLICIES_AUTO_'')
insert into #tables_to_be_dropped values (''Policy_Information_CL_'')
insert into #tables_to_be_dropped values (''Policy_Information_ALL_POLICIES_FireAllied_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_premium_summary_'')
insert into #tables_to_be_dropped values (''Policy_Information_ALL_POLICIES_GL_'')
insert into #tables_to_be_dropped values (''Policy_Information_FF_'')
insert into #tables_to_be_dropped values (''GL_Dominant_Territory_'')
insert into #tables_to_be_dropped values (''GL_Class_Code_Avg_Rate_ALL_POLICIES_'')
insert into #tables_to_be_dropped values (''Policy_Information_GL_AVG_RATES_'')
insert into #tables_to_be_dropped values (''Policy_Information_Underwriting_Check_List_'')
insert into #tables_to_be_dropped values (''Policy_Information_PVCD_'')
insert into #tables_to_be_dropped values (''Policy_Information_ALL_POLICIES_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_15_Detail_Information_1_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_15_Detail_Information_2_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_15_Detail_Information_3_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_15_premium_summary_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_Detail_Information_1_non_hired_non_owned_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_Detail_Information_2_non_hired_non_owned_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_Detail_Information_3_non_hired_non_owned_'')
insert into #tables_to_be_dropped values (''ALL_POLICIES_12_premium_summary_non_hired_non_owned_'')

set @Month = (select datename(m,convert(date,convert(char,Last_Reporting_Month)+''/1/1900'',101))
              from Detailed_Experience_Parameters with (nolock))

declare TableCursor cursor
for select table_name
    from #tables_to_be_dropped with (nolock)

open TableCursor

fetch next from TableCursor
into @TableName

while @@fetch_status = 0
  begin
  
  set @SQLString = ''drop table '' + @TableName + @Month
  
  exec sp_executesql @SQLString
  
  fetch next from TableCursor
  into @TableName
  
  end

close TableCursor
deallocate TableCursor

set nocount off

' 
END
GO
