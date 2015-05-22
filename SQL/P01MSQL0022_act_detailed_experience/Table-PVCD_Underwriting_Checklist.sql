IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_Underwriting_Checklist]') AND type in (N'U'))
DROP TABLE [dbo].[PVCD_Underwriting_Checklist]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PVCD_Underwriting_Checklist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PVCD_Underwriting_Checklist](
	[PolicyNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Employment_Handbook] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Form_5500] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Retro_Date_Applies] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_EEO1_Report_Received] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Subsidiaries_Affiliates] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Board_Experience] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Employment_Policies] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Clean_Warranty_Letter_Received] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Claims_Past_5Yrs] [float] NULL,
	[PVCD_Insider_Shareholder_Percent] [float] NULL,
	[PVCD_Number_of_Full_Time_Employees] [float] NULL,
	[PVCD_Number_of_Part_Time_Employees] [float] NULL,
	[PVCD_Number_of_Temporary_Employees] [float] NULL,
	[PVCD_Number_of_Total_Employees] [float] NULL,
	[PVCD_Employee_Salary_GT100k] [float] NULL,
	[PVCD_Plan_Assets] [float] NULL,
	[PVCD_Total_Participants] [float] NULL,
	[PVCD_Total_Claims] [float] NULL,
	[PVCD_Number_of_Full_Time_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Number_of_Part_Time_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Number_of_Temporary_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Number_of_Total_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Claims_Past_5yrs_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Insider_Shareholder_Percent_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Employee_Salary_GT100k_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_100k_Salary_to_Total_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Percent_of_Part_Time_and_Temp_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Employees_SUM_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Plan_Assets_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Total_Participants_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_UWCL_Total_Claims_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
