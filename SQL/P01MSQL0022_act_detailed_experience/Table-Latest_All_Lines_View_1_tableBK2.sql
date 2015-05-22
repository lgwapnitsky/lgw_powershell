IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND type in (N'U'))
DROP TABLE [dbo].[Latest_All_Lines_View_1_tableBK2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Latest_All_Lines_View_1_tableBK2](
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
	[COL_GLBI_Malpractice_Count] [decimal](38, 2) NULL,
	[COL_GLBI_Malpractice_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Count] [decimal](38, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_Injury_Count] [decimal](38, 2) NULL,
	[COL_GLBI_Injury_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_Other_Count] [decimal](38, 2) NULL,
	[COL_GLBI_Other_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count] [decimal](38, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_PropertyDamage_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_PropertyDamage_Count] [decimal](38, 2) NULL,
	[COL_GLBI_Theft_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_Theft_Count] [decimal](38, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Count] [decimal](38, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Loss] [decimal](38, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Count] [decimal](38, 2) NULL,
	[Incurred_Claims] [decimal](38, 2) NULL,
	[Commission_dollars] [float] NULL,
	[Commission_Premiums] [decimal](38, 2) NULL,
	[Price_Monitor_Standard_CovGrp_GL_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[Primary_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Playground_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Playground_Equip_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Pool_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sports_Activities_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tennis_Bubble_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tennis_Courts_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Swimming_Pools_Range] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS] [decimal](38, 2) NULL,
	[GL_Aggregate_Limit] [float] NULL,
	[GL_Deductible] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Agg_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Occurrence_Limit] [float] NULL,
	[Endorsement_GLDX_YN] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Property_Coverage_Form] [varchar](2550) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Constr_Code_Dominant_NAME] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Hail_Dominant] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP_Pop_Density_Dominant] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_Bld_Rate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FA_Avg_Bld_Rate_rd2] [float] NULL,
	[FA_Deductible] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COL_Prop_Wind_Hail_Count] [decimal](38, 2) NULL,
	[COL_Prop_Wind_Hail_Loss] [decimal](38, 2) NULL,
	[COL_Prop_Water_Other_Loss] [decimal](38, 2) NULL,
	[COL_Prop_Water_Other_Count] [decimal](38, 2) NULL,
	[COL_Prop_Water_Sprinkler_Loss] [decimal](38, 2) NULL,
	[COL_Prop_Water_Sprinkler_Count] [decimal](38, 2) NULL,
	[COL_Prop_Theft_Van_Loss] [decimal](38, 2) NULL,
	[COL_Prop_Theft_Van_Count] [decimal](38, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Loss] [decimal](38, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Count] [decimal](38, 2) NULL,
	[COL_Prop_Other_Loss] [decimal](38, 2) NULL,
	[COL_Prop_Other_Count] [decimal](38, 2) NULL,
	[Endorsement_Elite_YN] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](38, 2) NULL,
	[Auto_Vehicle_count_Total_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_PPT_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Buses_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Truck_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_VanPools_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OtherPublic_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Other_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Coll_No_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Coll_U1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Coll_1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Coll_O1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_No_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_U1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_O1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Dual_Control_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Dual_Control_Percent_Range] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriter] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_AY_Month_Ending] [int] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_UltLoss_Ratio] [float] NULL,
	[Account_UltLoss_Ratio_NonCat] [float] NULL,
	[Account_RepLoss_Ratio] [float] NULL,
	[Account_RepLoss_Ratio_NonCat] [float] NULL,
	[Account_RepLoss_Ratio_NonCat_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_RepLoss_Ratio_priorpolperiods_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renewals_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Office] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_004] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CSCORE_GMODEL8] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSCORE_GMODEL7_1] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FSCORE_GMODEL7] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CSCORE_GMODEL7] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prodmixname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reportmixname] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountname] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewRenewalAuto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[effectiveYearMonth] [int] NULL,
	[effectiveYear] [int] NULL,
	[effectiveMonth] [int] NULL,
	[expirationMonth] [int] NULL,
	[expirationYear] [int] NULL,
	[expirationYearMonth] [int] NULL,
	[Insd_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_Zip] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterName] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regiondesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[programdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[PICProducer] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[producttype] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerNumber] [int] NULL,
	[effectivedate] [datetime] NULL,
	[expirationdate] [datetime] NULL,
	[Insured_Years_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SLD_BusinessType] [char](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Incurred_Loss_ALAE_without_SS_NonCat] [decimal](38, 2) NULL,
	[accountnumber] [int] NULL,
	[Source_Detail_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClassDesc] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_Discrimination_Count] [decimal](15, 2) NULL,
	[COL_Discrimination_Loss] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Count] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Loss] [decimal](15, 2) NULL,
	[COL_Harrassment_Count] [decimal](15, 2) NULL,
	[COL_Harrassment_Loss] [decimal](15, 2) NULL,
	[COL_DO_Other_Count] [decimal](15, 2) NULL,
	[COL_DO_Other_Loss] [decimal](15, 2) NULL,
	[COL_EPL_Other_Count] [decimal](15, 2) NULL,
	[COL_EPL_Other_Loss] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Count] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Loss] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Count] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Count] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Loss] [decimal](15, 2) NULL,
	[County_Pop_Density_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bylaws_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Clean_Warranty_Letter_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Disciplinary_Administrative_or_Criminal_Actions_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Disciplinary_Action_from_Peer_Review_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Application_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Handbook_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Application_Handbook_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Financials_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Form_5500_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Information_Only_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[List_of_D_and_Os_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Standard_Setting_or_Member_Certification_Services_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Merger_Acquisition_or_Consolidation_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Loss_Letter_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Prior_Coverage_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Magazines_Periodicals_or_Newsletters_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product_Research_or_Development_Testing_Certif_Services_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Proper_Employment_Procedures_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Peer_Review_or_Disciplinary_Action_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Positive_Fund_Balance_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Plan_Assets_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Supplemental_Claim_Form_Loss_Run_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Security_Precautions_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subsidiaries_Affiliates_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Supp_Claim_Form_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Turnover_Rate_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tax_Exempt_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_E_Commerce_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website_Information_Only_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website_Transactional_E_Commerce_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[acctngyear] [int] NULL,
	[FF_Cov_ALL] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PV_Cov_ALL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyEffectivedate] [datetime] NULL,
	[policyexpirationdate] [datetime] NULL,
	[Business_Desc] [char](72) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GLDX_Indicator] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_P] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_CG0001] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range_for_Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_003] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Endorsement_HS_003D] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Account_Premium_Range')
CREATE NONCLUSTERED INDEX [IX_Account_Premium_Range] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Account_Premium_Range] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_accountname')
CREATE NONCLUSTERED INDEX [IX_accountname] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[accountname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_accountnumber')
CREATE NONCLUSTERED INDEX [IX_accountnumber] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[accountnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_BusinessClassDesc')
CREATE NONCLUSTERED INDEX [IX_BusinessClassDesc] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[BusinessClassDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_CompanyCode')
CREATE NONCLUSTERED INDEX [IX_CompanyCode] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[CompanyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Coverage_Form')
CREATE NONCLUSTERED INDEX [IX_Coverage_Form] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Coverage_Form] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Coverage_Group')
CREATE NONCLUSTERED INDEX [IX_Coverage_Group] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Coverage_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Coverage_Reporting_group')
CREATE NONCLUSTERED INDEX [IX_Coverage_Reporting_group] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Coverage_Reporting_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_DivisionName')
CREATE NONCLUSTERED INDEX [IX_DivisionName] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[DivisionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Fiscal_AY_Year')
CREATE NONCLUSTERED INDEX [IX_Fiscal_AY_Year] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Fiscal_AY_Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_GL_Dom_Region_in_State')
CREATE NONCLUSTERED INDEX [IX_GL_Dom_Region_in_State] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[GL_Dom_Region_in_State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_GL_Dom_Terr_Description')
CREATE NONCLUSTERED INDEX [IX_GL_Dom_Terr_Description] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[GL_Dom_Terr_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_NewRenewalAuto')
CREATE NONCLUSTERED INDEX [IX_NewRenewalAuto] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[NewRenewalAuto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_PICProducer')
CREATE NONCLUSTERED INDEX [IX_PICProducer] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[PICProducer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_policynumber')
CREATE NONCLUSTERED INDEX [IX_policynumber] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_PrimaryProducer')
CREATE NONCLUSTERED INDEX [IX_PrimaryProducer] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[PrimaryProducer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_prodmixname')
CREATE NONCLUSTERED INDEX [IX_prodmixname] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[prodmixname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Product_group')
CREATE NONCLUSTERED INDEX [IX_Product_group] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Product_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_productcode')
CREATE NONCLUSTERED INDEX [IX_productcode] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[productcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_ProductTypeName')
CREATE NONCLUSTERED INDEX [IX_ProductTypeName] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[ProductTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_program')
CREATE NONCLUSTERED INDEX [IX_program] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[program] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_regiondesc')
CREATE NONCLUSTERED INDEX [IX_regiondesc] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[regiondesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_reportmixname')
CREATE NONCLUSTERED INDEX [IX_reportmixname] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[reportmixname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_SLD_BusinessType')
CREATE NONCLUSTERED INDEX [IX_SLD_BusinessType] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[SLD_BusinessType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Source_Detail_Name')
CREATE NONCLUSTERED INDEX [IX_Source_Detail_Name] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Source_Detail_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_statecode')
CREATE NONCLUSTERED INDEX [IX_statecode] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[statecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_underwriterName')
CREATE NONCLUSTERED INDEX [IX_underwriterName] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[underwriterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tableBK2]') AND name = N'IX_Written_Premium_Range')
CREATE NONCLUSTERED INDEX [IX_Written_Premium_Range] ON [dbo].[Latest_All_Lines_View_1_tableBK2]
(
	[Written_Premium_Range] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
