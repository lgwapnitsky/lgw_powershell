IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_May]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_ALL_POLICIES_May]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_May]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_ALL_POLICIES_May](
	[accountnumber] [int] NULL,
	[Productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyEffectivedate] [datetime] NULL,
	[maxeffdate] [datetime] NULL,
	[policyid] [int] NULL,
	[Account_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insured_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Property_Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Umbrella] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterPID] [int] NULL,
	[Companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billplancode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[product_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_monoline] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_effective_year] [int] NULL,
	[policy_effective_month] [int] NULL,
	[policyexpirationdate] [datetime] NULL,
	[canceldate] [datetime] NULL,
	[reinstatementdate] [datetime] NULL,
	[Prior_Policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branchcode] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FAY_For_Review] [int] NULL,
	[underwriter] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillplanshortDesc] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zipcode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Office] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[East_MidWest_West_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAICS] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Program_Code] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year_Temp] [datetime] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[Inforce_as_of_Cat_Model_Date] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[written_premium_policy] [float] NULL,
	[County] [nvarchar](511) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density] [float] NULL,
	[Term_factor] [float] NULL,
	[Latest_PY] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Desc] [char](72) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range_for_Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[Renewals_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_2] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_3] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_4] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_5] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_6] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_7] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_8] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_4] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Automatic_Prior_Policy_5] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_Producer_code] [int] NULL,
	[PIC_Commission_pct] [float] NULL,
	[Primary_Producer_code] [int] NULL,
	[Primary_Commission_pct] [float] NULL,
	[PIC_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Commission_pct] [float] NULL,
	[Count_of_Account_Numbers] [float] NULL,
	[Count_of_Account_Numbers_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss] [float] NULL,
	[Account_UltLoss_NonCat] [float] NULL,
	[Account_RepLoss] [float] NULL,
	[Account_RepLoss_NonCat] [float] NULL,
	[Account_EarnedPremium] [float] NULL,
	[Account_UltLoss_priorpolperiods] [float] NULL,
	[Account_UltLoss_NonCat_priorpolperiods] [float] NULL,
	[Account_RepLoss_priorpolperiods] [float] NULL,
	[Account_RepLoss_NonCat_priorpolperiods] [float] NULL,
	[Account_EarnedPremium_priorpolperiods] [float] NULL,
	[Account_UltLoss_Working_Cover] [float] NULL,
	[Account_UltLoss_NonCat_Working_Cover] [float] NULL,
	[Account_RepLoss_Working_Cover] [float] NULL,
	[Account_RepLoss_NonCat_Working_Cover] [float] NULL,
	[Account_EarnedPremium_Working_Cover] [float] NULL,
	[Account_UltLoss_Working_Cover_priorpolperiods] [float] NULL,
	[Account_UltLoss_NonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_NonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_EarnedPremium_Working_Cover_priorpolperiods] [float] NULL,
	[Account_Premium_latest_year] [int] NULL,
	[Account_Premium_range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_written_premium_for_product] [float] NULL,
	[Account_written_premium_for_product_max] [float] NULL,
	[Account_Dominant_Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Dominant_Product_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Dominant_Product_policy_premium_max] [float] NULL,
	[Account_Dominant_Policy] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dominant_Policy_max_effdate] [datetime] NULL,
	[Review_quarter] [int] NULL,
	[Account_UltLoss_Ratio] [float] NULL,
	[Account_UltLoss_Ratio_NonCat] [float] NULL,
	[Account_RepLoss_Ratio] [float] NULL,
	[Account_RepLoss_Ratio_NonCat] [float] NULL,
	[Account_UltLoss_Ratio_Working_Cover] [float] NULL,
	[Account_UltLoss_Ratio_nonCat_Working_Cover] [float] NULL,
	[Account_RepLoss_Ratio_Working_Cover] [float] NULL,
	[Account_RepLoss_Ratio_nonCat_Working_Cover] [float] NULL,
	[Account_UltLoss_Ratio_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_NonCat_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_NonCat_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_Working_Cover_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_nonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_Working_Cover_priorpolperiods] [float] NULL,
	[Account_RepLoss_Ratio_nonCat_Working_Cover_priorpolperiods] [float] NULL,
	[Account_UltLoss_Ratio_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio_NonCat_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_NonCat_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio_NonCat_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_NonCat_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio_Working_Cover_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio_NonCat_Working_Cover_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_Working_Cover_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_NonCat_Working_Cover_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_VS_001] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Amendment_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Partnership_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ProPak_Elite72_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ProPak_Elite73_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_ProPak_Elite_Vermont7273_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[PVCD_Manuscript_Endorsement_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Election_ERP_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Delete_Consent_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Damages_Only_Retention_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PVCD_Class_Action_Sublimit_SubRetention_End_Y_N] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_MOLL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_MOLL_YN] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_009] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_013] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_014] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_003] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_003D] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_004] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_GLDX] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_GLDX_YN] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_DY_CG2504] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_FA_Elite] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_Elite_YN] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_CG0001] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_CG0002] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Detail_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClassDesc] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductType] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PolicyEntityState] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_May]') AND name = N'idx_GL_Rerating')
CREATE NONCLUSTERED INDEX [idx_GL_Rerating] ON [dbo].[Policy_Information_ALL_POLICIES_May]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_May]') AND name = N'idx_PolicyEffectiveDate')
CREATE NONCLUSTERED INDEX [idx_PolicyEffectiveDate] ON [dbo].[Policy_Information_ALL_POLICIES_May]
(
	[policyEffectivedate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_May]') AND name = N'idx_Policynumber')
CREATE NONCLUSTERED INDEX [idx_Policynumber] ON [dbo].[Policy_Information_ALL_POLICIES_May]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_May]') AND name = N'idx_Productcode')
CREATE NONCLUSTERED INDEX [idx_Productcode] ON [dbo].[Policy_Information_ALL_POLICIES_May]
(
	[Productcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
