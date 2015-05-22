IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_22_Create_Premium_Summary_Indexes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_22_Create_Premium_Summary_Indexes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_22_Create_Premium_Summary_Indexes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE procedure [dbo].[usp_Step_22_Create_Premium_Summary_Indexes] as 

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

if not exists ( select 1 from sys.indexes 
where name = ''IX_accountnumber''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_accountnumber 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work
(accountnumber);

if not exists ( select 1 from sys.indexes 
where name = ''IX_policynumber''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_policynumber 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work
(policynumber);


if not exists ( select 1 from sys.indexes 
where name = ''IX_statecode''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_statecode 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work
(statecode);

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Group''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_Coverage_Group 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work
(Coverage_Group);

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Reporting_group''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_Coverage_Reporting_group 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work 
(Coverage_Reporting_group);

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Form''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_Coverage_Form 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work 
(Coverage_Form);

if not exists ( select 1 from sys.indexes 
where name = ''IX_productcode''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_productcode 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work 
(productcode);


if not exists ( select 1 from sys.indexes 
where name = ''IX_Fiscal_AY_Year''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work''))
create index IX_Fiscal_AY_Year 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work 
(Fiscal_AY_Year);



if not exists ( select 1 from sys.indexes 
where name = ''IX_accountnumber''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_accountnumber 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(accountnumber)

if not exists ( select 1 from sys.indexes 
where name = ''IX_policynumber''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_policynumber 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(policynumber)


if not exists ( select 1 from sys.indexes 
where name = ''IX_statecode''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_statecode 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(statecode)

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Group''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_Coverage_Group 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(Coverage_Group)

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Reporting_group''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_Coverage_Reporting_group 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(Coverage_Reporting_group)

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Form''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_Coverage_Form 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(Coverage_Form)

if not exists ( select 1 from sys.indexes 
where name = ''IX_productcode''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_productcode 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(productcode)


if not exists ( select 1 from sys.indexes 
where name = ''IX_Fiscal_AY_Year''
		and   object_id = object_id(''act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work''))
create index IX_Fiscal_AY_Year 
on act_detailed_experience.dbo.ALL_POLICIES_15_premium_summary_work 
(Fiscal_AY_Year)

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)


' 
END
GO
