IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_23_Table_Renames]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_23_Table_Renames]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_23_Table_Renames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE procedure [dbo].[usp_Step_23_Table_Renames]

as

-- Revision #1
-- FootPrints Ticket #65106
-- Revisor:	Erik Godfrey
-- Revision Date: 1/22/2013
-- Revision Description: Remove Alter View

-- Revision #2
-- FootPrints Ticket #73460
-- Revisor:	Steve Breisch
-- Revision Date: 6/11/2013
-- Revision Description: Add Non Hired Non Owened tables to process

declare @month varchar(15)
declare @table_name varchar(100)
declare @SQLString nvarchar(max)

create index idx_GL_Rerating on Policy_Information_ALL_POLICIES_work
      (policynumber)

create table #tables_to_be_renamed (table_name varchar(100))

insert into #tables_to_be_renamed values(''ALL_POLICIES_12_Detail_Information_1_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_12_Detail_Information_2_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_12_Detail_Information_3_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_12_premium_summary_work'')
insert into #tables_to_be_renamed values(''GL_Class_Code_Avg_Rate_ALL_POLICIES_work'')
insert into #tables_to_be_renamed values(''Policy_Information_GL_AVG_RATES_work'')
insert into #tables_to_be_renamed values(''Policy_Information_Underwriting_Check_List_work'')
insert into #tables_to_be_renamed values(''Policy_Information_PVCD_work'')
insert into #tables_to_be_renamed values(''ALL_CLAIMS_12_Information_1_work'')
insert into #tables_to_be_renamed values(''Policy_Information_ALL_POLICIES_work'')
insert into #tables_to_be_renamed values(''Policy_Renewals_ALL_POLICIES_work'')
insert into #tables_to_be_renamed values(''Policy_Product_State_Coverage_Data_ALL_POLICIES_work'')
insert into #tables_to_be_renamed values(''Policy_Information_ALL_POLICIES_AUTO_work'')
insert into #tables_to_be_renamed values(''Policy_Information_ALL_POLICIES_FireAllied_work'')
insert into #tables_to_be_renamed values(''Policy_Information_ALL_POLICIES_GL_work'')
insert into #tables_to_be_renamed values(''Policy_Information_FF_work'')
insert into #tables_to_be_renamed values(''Policy_Information_CL_work'')
insert into #tables_to_be_renamed values(''Policy_Information_AE_work'')
insert into #tables_to_be_renamed values(''GL_Dominant_Territory_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_15_Detail_Information_1_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_15_Detail_Information_2_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_15_Detail_Information_3_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_15_premium_summary_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_12_Detail_Information_1_non_hired_non_owned_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_12_Detail_Information_2_non_hired_non_owned_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_12_Detail_Information_3_non_hired_non_owned_work'')
insert into #tables_to_be_renamed values(''ALL_POLICIES_12_premium_summary_non_hired_non_owned_work'')

select @month=(
select Datename(m,CONVERT(date,convert(char,Last_Reporting_Month)+''/1/1900'',101)) from Act_Detailed_Experience..Detailed_Experience_Parameters)

DECLARE csr_Table_Name CURSOR FOR
select table_name from #tables_to_be_renamed

open csr_Table_Name

FETCH NEXT FROM csr_Table_Name
into @table_name

WHILE @@FETCH_STATUS = 0
      BEGIN
      
      set @SQLString=''exec sp_rename ''''''+@table_name+'''''',''''''+substring(@table_name, 1,len(@table_name)-4)+@month+''''''''
            
      EXECUTE sp_executesql @SQLString
      --print @sqlstring
      
      FETCH NEXT FROM csr_Table_Name
      into @table_name
      END

close csr_Table_Name
deallocate csr_Table_Name


-- Code commented out as part of Revision #1
-- Alter view to be executed in usp_Step_24_View_Updates

--set @SQLString=''ALTER view [dbo].[Policy_Information_ALL_POLICIES_Current] WITH SCHEMABINDING as 
--select accountnumber,
--	   Productcode,
--	   policynumber,
--	   policyEffectivedate,
--       Renew_New_Auto, 
--       written_premium_policy, 
--       Written_Premium_Range from dbo.Policy_Information_ALL_POLICIES_''+@month
       
--EXECUTE sp_executesql @SQLString




' 
END
GO
