IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_ALL_Lines_View_2_State_IL_EPLTerrs_Table]') AND type in (N'U'))
DROP TABLE [dbo].[NPDO_ALL_Lines_View_2_State_IL_EPLTerrs_Table]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_ALL_Lines_View_2_State_IL_EPLTerrs_Table]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NPDO_ALL_Lines_View_2_State_IL_EPLTerrs_Table](
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_AY_Year] [int] NULL,
	[currentwrittenpremium] [decimal](38, 2) NULL,
	[currentearnedpremium] [decimal](38, 2) NULL,
	[Policy_count_Reporting_Coverage] [float] NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](38, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](38, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat] [decimal](38, 2) NULL,
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](38, 2) NULL,
	[Reported_Claims] [decimal](38, 2) NULL,
	[Incurred_Claims] [decimal](38, 2) NULL,
	[Commission_dollars] [float] NULL,
	[Commission_Premiums] [decimal](38, 2) NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[product_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Umbrella] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Earned_Buildings] [float] NULL,
	[Earned_Locations] [float] NULL,
	[Earned_TIV] [float] NULL,
	[GL_Dom_Terr_Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Region_in_State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_count_All_Cov_Combined] [float] NULL,
	[Account_UltLoss_Ratio_Working_Cover_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_Working_Cover_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_count_Coverage_Group] [float] NULL,
	[accountnumber] [int] NULL,
	[Primary_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_Elite_YN] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Office] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COL_Breach_of_Contract_Loss] [decimal](38, 2) NULL,
	[COL_Discrimination_Loss] [decimal](38, 2) NULL,
	[COL_Wrongful_Termination_Loss] [decimal](38, 2) NULL,
	[COL_Harrassment_Loss] [decimal](38, 2) NULL,
	[COL_SLD_All_Other_Loss] [decimal](38, 2) NULL,
	[COL_SLD_All_Other_Count] [decimal](38, 2) NULL,
	[COL_Harassment_Count] [decimal](38, 2) NULL,
	[COL_WrongfulTermination_Count] [decimal](38, 2) NULL,
	[COL_Discrimination_Count] [decimal](38, 2) NULL,
	[COL_Breach_of_Contract_Count] [decimal](38, 2) NULL,
	[First_Policy_Year] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COL_DO_Other_Count] [decimal](38, 2) NULL,
	[COL_DO_Other_Loss] [decimal](38, 2) NULL,
	[COL_EPL_Other_Count] [decimal](38, 2) NULL,
	[COL_EPL_Other_Loss] [decimal](38, 2) NULL,
	[COL_Fiduciary_Other_Count] [decimal](38, 2) NULL,
	[COL_Fiduciary_Other_Loss] [decimal](38, 2) NULL,
	[COL_Worplace_Violence_Other_Count] [decimal](38, 2) NULL,
	[COL_Worplace_Violence_Other_Loss] [decimal](38, 2) NULL,
	[COL_Internet_Other_Count] [decimal](38, 2) NULL,
	[COL_Internet_Other_Loss] [decimal](38, 2) NULL,
	[FF_DO_Limit] [float] NULL,
	[FF_EPL_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_DO_Alt_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_Num_of_Employees_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrimBusiness_Type] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_DO_RatingClass] [int] NULL,
	[FF_EPL_RatingClass] [int] NULL,
	[Financials_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Supplemental_Claim_Form_Loss_Run_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bylaws_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Handbook_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Form_5500_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_Alt_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Years_in_Operation] [decimal](18, 6) NULL,
	[Plan_Assets] [decimal](18, 6) NULL,
	[Turnover_Rate] [decimal](18, 6) NULL,
	[Plan_Assets_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Turnover_Rate_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subsidiaries_Affiliates_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Loss_Letter_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Prior_Coverage_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Clean_Warranty_Letter_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Supp_Claim_Form_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website_Transactional_E_Commerce_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website_Information_Only_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_E_Commerce_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tax_Exempt_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Standard_Setting_or_Member_Certification_Services_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Security_Precautions_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Magazines_Periodicals_or_Newsletters_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Proper_Employment_Procedures_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product_Research_or_Development_Testing_Certif_Services_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Positive_Fund_Balance_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Peer_Review_or_Disciplinary_Action_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Merger_Acquisition_or_Consolidation_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[List_of_D_and_Os_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Information_Only_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Application_Handbook_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Application_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Disciplinary_Action_from_Peer_Review_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Disciplinary_Administrative_or_Criminal_Actions_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insurance_Programs_For_Members_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[Fiscal_AY_Month_Ending] [int] NULL,
	[ProductType] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClassDesc] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Detail_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriter] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EPL_Limit_int] [int] NULL,
	[FF_DO_Alt_Retention_int] [float] NULL,
	[FF_EPL_Alt_Retention_int] [float] NULL,
	[FF_EPL_Limit_int] [float] NULL,
	[Written_Premium_Range_for_Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyEffectivedate] [datetime] NULL,
	[policyexpirationdate] [datetime] NULL,
	[Latest_PY] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_effective_month] [int] NULL,
	[policy_effective_year] [int] NULL,
	[County] [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip3] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[acctngyear] [int] NULL,
	[Territory] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Account_ProductType_P] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_S] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_U] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO