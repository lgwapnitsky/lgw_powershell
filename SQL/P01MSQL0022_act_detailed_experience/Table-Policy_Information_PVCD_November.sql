IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_PVCD_November]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_PVCD_November]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_PVCD_November]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_PVCD_November](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Amendment_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Partnership_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ProPak_Elite72_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ProPak_Elite73_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Circumstance_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Professional_Services_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_BullsEye_ProPak_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Sexual_Abuse_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Amend_of_ExclusionK_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Amend_of_Severability_Provision_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Third_Party_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Punitive_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Medical_Malpractice_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Insurance_EO_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Full_Securities_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Bankruptcy_Exclusion_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Shareholder_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Past_Acts_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_No_Liab_Retent_Waiver_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Election_ERP_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Delete_Consent_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Damages_Only_Retention_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Idnum_Max] [int] NULL,
	[PVCD_Idnum] [int] NULL,
	[PVCD_PVDO_Limit] [float] NULL,
	[PVCD_PVDO_Alt_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_PVDO_RatingClass] [int] NULL,
	[PVCD_PVDO_Assets] [bigint] NULL,
	[PVCD_PVDO_Assets_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_PVEPL_Limit] [money] NULL,
	[PVCD_PVEPL_Alt_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_PVEPL_RatingClass] [int] NULL,
	[PVCD_PVEPL_Num_of_Employees] [int] NULL,
	[PVCD_Financial_Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Business_Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_PVEPL_Num_of_Employees_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EPL_Id] [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_PVEPL_ZoneMod] [float] NULL,
	[PVCD_PVDO_ZoneMod] [float] NULL,
	[PV_Zone] [float] NULL,
	[PVCD_State_DO] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_State_EPL] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ZipCode_DO] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ZipCode_EPL] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ZoneNum_DO] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ZoneNum_EPL] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_County_DO] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_County_EPL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
