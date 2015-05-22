IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_0_Detailed_Experience_Setup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_0_Detailed_Experience_Setup]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_0_Detailed_Experience_Setup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'







CREATE procedure [dbo].[usp_Step_0_Detailed_Experience_Setup] as

/* This procedure performs setup for the monthly process. It sets the parameters as of the last month - if the process is being run in the second month after the month to be processed (or later), the parameter settings below will not work.
The InforceDate calculation gets the difference in months between date 0 and getdate(), then gets the date that results when you add that number of months to date 0. This is a quick way to get the first day of the month. After that it subtracts a day, which gives the last day of the last month. This is the inforce date used in the Detailed Experience process.
*/

-- FootPrints Ticket #73460
-- Creator:	Steve Breisch
-- Date: 6/11/2013
-- Description: Add new procs to the process

update dbo.Detailed_Experience_Parameters
set Last_Reporting_Month=month(DATEADD(mm,-1,getdate())),
Last_Reporting_Year=year(DATEADD(mm,-1,getdate())),
Fiscal_AY_Month_Ending=month(DATEADD(mm,-1,getdate())),
InforceDate=DATEADD(d,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0)),
Loss_Evaluation_Month=month(DATEADD(mm,-1,getdate())),
Loss_Evaluation_year=year(DATEADD(mm,-1,getdate())),
Fiscal_AY_Month_Ending_15_Month=MONTH(DATEADD(mm,-4,getdate()))

declare @run_year int
declare @run_month int

set @run_year=year(DATEADD(mm,-1,getdate()))
set @run_month=month(DATEADD(mm,-1,getdate()))

--Also set up the tracking table
insert into Detailed_Experience_Run_Log values (''usp_Step_1_Premium'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_2_Losses'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_2a_Claim_Information'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_3_Premium_Loss_Join'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_4_Policy_Information'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_5_Prior_Policy_Numbers'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_6a_Producer_Information'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_6b_Producer_Info_Premium'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_7_Policy_Product_State_CoverageGroup'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_Auto'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_FA_1_Policy'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_FA_2_Premium'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_GL'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_NPDO'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_SAM'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_CL'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_8_Coverage_AE'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_9_GL_Dominant_Territory'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_10a_GL_Class_Code_Avg_Rate_Table'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_10b_Average_GL_Rates_Policy'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_13_UW_Check_List'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14_Endorsement_DY'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14_Endorsement_EPE'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14_Endorsement_GLDX'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14_Endorsement_HS009_HS013'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14_Endorsement_MOLL'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14_Endorsement_PVCD'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14_Endorsement_VS'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_14b_Coverage_PVCD'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_15_Account_Loss_Ratios'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_16_Account_Dominant_Policy'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_17_Premium_15_Month'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_18_Losses_15_Month'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_19_Premium_Loss_Join_15_Months'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_20_Producer_Info_Premium_15_Months'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_21_Coverage_FA_2_Premium_15_Months'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_22_Create_Premium_Summary_Indexes'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_22a_Non_Hired_Non_Owned'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_22b_Non_Hired_Non_Owned'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_22c_Non_Hired_Non_Owned'',@run_year, @run_month,null,null)
insert into Detailed_Experience_Run_Log values (''usp_Step_X_BuildingRates_Property_Exposure'',@run_year, @run_month,null,null)









' 
END
GO
