IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_25_All_Lines_Table_Creation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_25_All_Lines_Table_Creation]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_25_All_Lines_Table_Creation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE procedure [dbo].[usp_Step_25_All_Lines_Table_Creation]

as

-- FootPrints Ticket #65106
-- Creator:	Erik Godfrey
-- Date: 1/22/2013
-- Description: Create All Lines table from All Lines view

-- FootPrints Ticket #73674
-- Creator:	Steve Breisch
-- Date: 6/11/2013
-- Description: Create Latest_Policy_Information_AE_RangesOnly_View_1_table_work from view
--              Create Latest_Policy_Information_AE_View_1_table_work from view
--              Create Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work from view
--              Create Latest_Policy_Information_CL_View_1_table_work from view
--              Create Latest_Policy_Information_FF_View_1_table_work from view
--              Create Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work from view
--              Create Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work from view
--              Create Latest_Policy_Information_GL_AVG_RATES_View_1_table_work from view
--              Create Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work from view
--              Create Latest_Policy_Information_PVCD_View_1_table_work from view
--              Create Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work from view
--              Create Latest_Policy_Information_UWChecklist_View_1_table_work from view

set nocount on

if exists (select 1 from sys.tables where name = ''Latest_All_Lines_View_1_table_work'')
   drop table Latest_All_Lines_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_All_Lines_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_All_Lines_View_1
where Fiscal_AY_Year >= 2008

if not exists (select 1 from sys.indexes
               where name = ''IX_Coverage_Group''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Coverage_Group
   on Latest_All_Lines_View_1_table_work (Coverage_Group)

if not exists (select 1 from sys.indexes
               where name = ''IX_Coverage_Reporting_group''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Coverage_Reporting_group
   on Latest_All_Lines_View_1_table_work (Coverage_Reporting_group)

if not exists (select 1 from sys.indexes
               where name = ''IX_Coverage_Form''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Coverage_Form
   on Latest_All_Lines_View_1_table_work (Coverage_Form)

if not exists (select 1 from sys.indexes
               where name = ''IX_reportmixname''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_reportmixname
   on Latest_All_Lines_View_1_table_work (reportmixname)

if not exists (select 1 from sys.indexes
               where name = ''IX_prodmixname''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_prodmixname
   on Latest_All_Lines_View_1_table_work (prodmixname)

if not exists (select 1 from sys.indexes
               where name = ''IX_Product_group''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Product_group
   on Latest_All_Lines_View_1_table_work (Product_group)

if not exists (select 1 from sys.indexes
               where name = ''IX_ProductTypeName''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_ProductTypeName
   on Latest_All_Lines_View_1_table_work (ProductTypeName)

if not exists (select 1 from sys.indexes
               where name = ''IX_productcode''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_productcode
   on Latest_All_Lines_View_1_table_work (productcode)

if not exists (select 1 from sys.indexes
               where name = ''IX_CompanyCode''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_CompanyCode
   on Latest_All_Lines_View_1_table_work (CompanyCode)

if not exists (select 1 from sys.indexes
               where name = ''IX_DivisionName''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_DivisionName
   on Latest_All_Lines_View_1_table_work (DivisionName)

if not exists (select 1 from sys.indexes
               where name = ''IX_statecode''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_statecode
   on Latest_All_Lines_View_1_table_work (statecode)

if not exists (select 1 from sys.indexes
               where name = ''IX_GL_Dom_Region_in_State''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_GL_Dom_Region_in_State
   on Latest_All_Lines_View_1_table_work (GL_Dom_Region_in_State)

if not exists (select 1 from sys.indexes
               where name = ''IX_GL_Dom_Terr_Description''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_GL_Dom_Terr_Description
   on Latest_All_Lines_View_1_table_work (GL_Dom_Terr_Description)

if not exists (select 1 from sys.indexes
               where name = ''IX_regiondesc''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_regiondesc
   on Latest_All_Lines_View_1_table_work (regiondesc)

if not exists (select 1 from sys.indexes
               where name = ''IX_PrimaryProducer''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_PrimaryProducer
   on Latest_All_Lines_View_1_table_work (PrimaryProducer)

if not exists (select 1 from sys.indexes
               where name = ''IX_PICProducer''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_PICProducer
   on Latest_All_Lines_View_1_table_work (PICProducer)

if not exists (select 1 from sys.indexes
               where name = ''IX_underwriterName''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
	create index IX_underwriterName
	on Latest_All_Lines_View_1_table_work (underwriterName)

if not exists (select 1 from sys.indexes
               where name = ''IX_program''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_program
   on Latest_All_Lines_View_1_table_work (program)

if not exists (select 1 from sys.indexes
               where name = ''IX_BusinessClassDesc''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_BusinessClassDesc
   on Latest_All_Lines_View_1_table_work (BusinessClassDesc)

if not exists (select 1 from sys.indexes
               where name = ''IX_Source_Detail_Name''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Source_Detail_Name
   on Latest_All_Lines_View_1_table_work (Source_Detail_Name)

if not exists (select 1 from sys.indexes
               where name = ''IX_SLD_BusinessType''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_SLD_BusinessType
   on Latest_All_Lines_View_1_table_work (SLD_BusinessType)

if not exists (select 1 from sys.indexes
               where name = ''IX_Written_Premium_Range''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Written_Premium_Range
   on Latest_All_Lines_View_1_table_work (Written_Premium_Range)

if not exists (select 1 from sys.indexes
               where name = ''IX_Accout_Premium_Range''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Account_Premium_Range
   on Latest_All_Lines_View_1_table_work (Account_Premium_Range)

if not exists (select 1 from sys.indexes
               where name = ''IX_NewRenewalAuto''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_NewRenewalAuto
   on Latest_All_Lines_View_1_table_work (NewRenewalAuto)

if not exists (select 1 from sys.indexes
               where name = ''IX_policynumber''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_policynumber
   on Latest_All_Lines_View_1_table_work (policynumber)

if not exists (select 1 from sys.indexes
               where name = ''IX_accountnumber''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_accountnumber
   on Latest_All_Lines_View_1_table_work (accountnumber)

if not exists (select 1 from sys.indexes
               where name = ''IX_accountname''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_accountname
   on Latest_All_Lines_View_1_table_work (accountname)

if not exists (select 1 from sys.indexes
               where name = ''IX_Fiscal_AY_Year''
		       and   object_id = object_id(''Latest_All_Lines_View_1_table_work''))
   create index IX_Fiscal_AY_Year
   on Latest_All_Lines_View_1_table_work (Fiscal_AY_Year)

--  Added 6/11/2013 Latest_Policy_Information_AE_RangesOnly_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_AE_RangesOnly_View_1_table_work'')
   drop table Latest_Policy_Information_AE_RangesOnly_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_RangesOnly_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_RangesOnly_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_RangesOnly_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_RangesOnly_View_1_table_work (policynumber)

--  Added 6/11/2013 Latest_Policy_Information_AE_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_AE_View_1_table_work'')
   drop table Latest_Policy_Information_AE_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_AE_View_1_table_work(policynumber)
	
--  Added 6/11/2013 Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work'')
   drop table Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_CL_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_CL_View_1_table_work'')
   drop table Latest_Policy_Information_CL_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_CL_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_CL_View_1

update Act_Detailed_Experience.dbo.Latest_Policy_Information_CL_View_1_table_work
set CL_Deductible_int = convert(int,convert(float,CL_Deductible))

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_CL_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_CL_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_FF_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_FF_View_1_table_work'')
   drop table Latest_Policy_Information_FF_View_1_table_work
   
select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_FF_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_FF_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_FF_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_FF_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work'')
   drop table Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work
   
select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work'')
   drop table Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_GL_AVG_RATES_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_GL_AVG_RATES_View_1_table_work'')
   drop table Latest_Policy_Information_GL_AVG_RATES_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_GL_AVG_RATES_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work'')
   drop table Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_PVCD_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_PVCD_View_1_table_work'')
   drop table Latest_Policy_Information_PVCD_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_PVCD_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_PVCD_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_PVCD_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_PVCD_View_1_table_work(policynumber)

--  Added 6/11/2013 Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work'')
   drop table Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_Underwriting_Check_List_RangesOnly_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work(policynumber)

if not exists ( select 1 from sys.indexes 
				where name = ''IX_accountnumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work''))
	create index IX_accountnumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_RangesOnly_View_1_table_work(accountnumber)

--  Added 6/11/2013 Latest_Policy_Information_UWChecklist_View_1_table_work

if exists (select 1 from sys.tables where name = ''Latest_Policy_Information_UWChecklist_View_1_table_work'')
   drop table Latest_Policy_Information_UWChecklist_View_1_table_work

select *
into Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_View_1_table_work
from Act_Detailed_Experience.dbo.Latest_Policy_Information_Underwriting_Check_List_View_1

if not exists ( select 1 from sys.indexes 
				where name = ''IX_policynumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_View_1_table_work''))
	create index IX_policynumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_View_1_table_work(policynumber)

if not exists ( select 1 from sys.indexes 
				where name = ''IX_accountnumber''
				and   object_id = object_id(''Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_View_1_table_work''))
	create index IX_accountnumber 
	on Act_Detailed_Experience.dbo.Latest_Policy_Information_UWChecklist_View_1_table_work(accountnumber)

set nocount off

' 
END
GO
