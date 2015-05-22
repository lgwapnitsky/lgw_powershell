IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_15_Account_Loss_Ratios]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_15_Account_Loss_Ratios]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_15_Account_Loss_Ratios]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[usp_Step_15_Account_Loss_Ratios]

as

-- Revision #1
-- FootPrints Ticket #62874
-- Revisor:	Erik Godfrey
-- Revision Date: 11/8/2012
-- Revision Description: Add Endorsement HS014, HS003, and HS003D

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

select Accountnumber,Policynumber,
sum(isnull(Ult_LDF_Incurred_Loss_ALAE_with_SS,0)) Account_UltLoss,
sum(isnull(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat,0)) Account_UltLoss_NonCat,
sum(isnull(Incurred_Loss_ALAE_with_SS,0)) Account_RepLoss,
sum(isnull(Incurred_Loss_ALAE_with_SS_NonCat,0)) Account_RepLoss_NonCat,
sum(isnull(currentearnedpremium,0)) Account_EarnedPremium,

sum(isnull(case when Coverage_Reporting_group in (''Auto Liab'', ''Auto Phys Dam'', 
			''D&O'', ''E&O'',''BOP'',''Fire & Allied'', ''Prop'', ''GL'',
			''Pers Auto Liab'', ''Pers Auto Phys Dam'') then Ult_LDF_Incurred_Loss_ALAE_with_SS else 0 end,0)) Account_UltLoss_Working_Cover,
sum(isnull(case when Coverage_Reporting_group in (''Auto Liab'', ''Auto Phys Dam'', 
			''D&O'', ''E&O'',''BOP'',''Fire & Allied'', ''Prop'', ''GL'',
			''Pers Auto Liab'', ''Pers Auto Phys Dam'') then Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat else 0 end,0)) Account_UltLoss_NonCat_Working_Cover,
sum(isnull(case when Coverage_Reporting_group in (''Auto Liab'', ''Auto Phys Dam'', 
			''D&O'', ''E&O'',''BOP'',''Fire & Allied'', ''Prop'', ''GL'',
			''Pers Auto Liab'', ''Pers Auto Phys Dam'') then Incurred_Loss_ALAE_with_SS else 0 end,0)) Account_RepLoss_Working_Cover,
sum(isnull(case when Coverage_Reporting_group in (''Auto Liab'', ''Auto Phys Dam'', 
			''D&O'', ''E&O'',''BOP'',''Fire & Allied'', ''Prop'', ''GL'',
			''Pers Auto Liab'', ''Pers Auto Phys Dam'') then Incurred_Loss_ALAE_with_SS_NonCat else 0 end,0)) Account_RepLoss_NonCat_Working_Cover,
sum(isnull(case when Coverage_Reporting_group in (''Auto Liab'', ''Auto Phys Dam'', 
			''D&O'', ''E&O'',''BOP'',''Fire & Allied'', ''Prop'', ''GL'',
			''Pers Auto Liab'', ''Pers Auto Phys Dam'') then currentearnedpremium else 0 end,0)) Account_EarnedPremium_Working_Cover
into #temp_prior_policy_sums 
from  Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_work
group by Accountnumber,Policynumber

create index idx_prior_policy_temp on #temp_prior_policy_sums(accountnumber, policynumber)
include (Account_UltLoss,Account_UltLoss_NonCat,Account_RepLoss,Account_RepLoss_NonCat,Account_EarnedPremium,
Account_UltLoss_Working_Cover,Account_UltLoss_NonCat_Working_Cover,Account_RepLoss_Working_Cover,Account_RepLoss_NonCat_Working_Cover,Account_EarnedPremium_Working_Cover)


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_ALL_POLICIES_temp]'') AND type in (N''U''))
DROP TABLE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp;

create table Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp(
	[accountnumber] [int] NULL,
	[Productcode] [varchar](50) NULL,
	[policynumber] [varchar](15) NULL,
	[policyEffectivedate] [datetime] NULL,
	[maxeffdate] [datetime] NULL,
	[policyid] [int] NULL,
	[Account_Name] [varchar](100) NULL,
	[Insured_Name] [varchar](100) NULL,
	[Property_Coverage_Form] [varchar](50) NULL,
	[Primary_Umbrella] [varchar](50) NULL,
	[underwriterPID] [int] NULL,
	[Companycode] [varchar](2) NULL,
	[billplancode] [varchar](10) NULL,
	[product_group] [nvarchar](255) NULL,
	[package_monoline] [nvarchar](255) NULL,
	[policy_effective_year] [int] NULL,
	[policy_effective_month] [int] NULL,
	[policyexpirationdate] [datetime] NULL,
	[canceldate] [datetime] NULL,
	[reinstatementdate] [datetime] NULL,
	[Prior_Policy_number] [varchar](15) NULL,
	[New_Renew_Tail] [varchar](1) NULL,
	[Branchcode] [varchar](3) NULL,
	[Renew_New_Auto] [varchar](50) NULL,
	[FAY_For_Review] [int] NULL,
	[underwriter] [varchar](50) NULL,
	[BillplanshortDesc] [varchar](10) NULL,
	[zipcode] [varchar](10) NULL,
	[Branch_Office] [varchar](50) NULL,
	[Branch_Region] [varchar](50) NULL,
	[East_MidWest_West_Region] [varchar](50) NULL,
	[program] [varchar](255) NULL,
	[NAICS] [varchar](7) NULL,
	[Program_Code] [nvarchar](50) NULL,
	[First_Policy_Year_Temp] [datetime] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[Inforce_as_of_Cat_Model_Date] [varchar](50) NULL,
	[First_Policy_Year] [varchar](13) NULL,
	[written_premium_policy] [float] NULL,
	[County] [nvarchar](511) NULL,
	[County_Pop_Density] [float] NULL,
	[Term_factor] [float] NULL,
	[Latest_PY] [varchar](9) NULL,
	[Business_Name] [nvarchar](100) NULL,
	[Business_Desc] [char](72) NULL,
	[Written_Premium_Range_for_Product] [varchar](50) NULL,
	[Written_Premium_Range] [varchar](50) NULL,
	[County_Pop_Density_Range] [varchar](50) NULL,
	[Number_of_Renewals] [int] NULL,
	[Renewals_Range] [varchar](20) NULL,
	[prior_policynumber_2] [varchar](15) NULL,
	[prior_policynumber_3] [varchar](15) NULL,
	[prior_policynumber_4] [varchar](15) NULL,
	[prior_policynumber_5] [varchar](15) NULL,
	[prior_policynumber_6] [varchar](15) NULL,
	[prior_policynumber_7] [varchar](15) NULL,
	[prior_policynumber_8] [varchar](15) NULL,
	[New_Renew_Automatic_Prior_Policy] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_2] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_3] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_4] [varchar](50) NULL,
	[New_Renew_Automatic_Prior_Policy_5] [varchar](50) NULL,
	[PIC_Producer_code] [int] NULL,
	[PIC_Commission_pct] [float] NULL,
	[Primary_Producer_code] [int] NULL,
	[Primary_Commission_pct] [float] NULL,
	[PIC_Producer] [varchar](100) NULL,
	[PIC_Producer_type] [varchar](50) NULL,
	[Primary_Producer] [varchar](100) NULL,
	[Primary_Producer_type] [varchar](50) NULL,
	[Commission_pct] [float] NULL,
	[Count_of_Account_Numbers] [float] NULL,
	[Count_of_Account_Numbers_Range] [varchar](50) NULL,
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
	[Account_Premium_range] [varchar](50) NULL,
	[Account_written_premium_for_product] [float] NULL,
	[Account_written_premium_for_product_max] [float] NULL,
	[Account_Dominant_Product] [varchar](50) NULL,
	[Account_Dominant_Product_Group] [varchar](50) NULL,
	[Account_Dominant_Product_policy_premium_max] [float] NULL,
	[Account_Dominant_Policy] [varchar](15) NULL,
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
	[Account_UltLoss_Ratio_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_priorpolperiods_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_priorpolperiods_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_Working_Cover_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_Working_Cover_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_Working_Cover_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_Working_Cover_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range] [varchar](50) NULL,
	[Endorsement_VS_001] [varchar](50) NULL,
	[PVCD_Amendment_End_Y_N] [varchar](50) NULL,
	[PVCD_Partnership_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite72_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite73_End_Y_N] [varchar](50) NULL,
	[PVCD_ProPak_Elite_Vermont7273_End_Y_N] [varchar](50) NULL,
	[PVCD_Circumstance_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Professional_Services_End_Y_N] [varchar](50) NULL,
	[PVCD_BullsEye_ProPak_End_Y_N] [varchar](50) NULL,
	[PVCD_Sexual_Abuse_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N] [varchar](50) NULL,
	[PVCD_Amend_of_ExclusionK_End_Y_N] [varchar](50) NULL,
	[PVCD_Amend_of_Severability_Provision_End_Y_N] [varchar](50) NULL,
	[PVCD_Third_Party_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Punitive_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Medical_Malpractice_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Insurance_EO_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Full_Securities_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N] [varchar](50) NULL,
	[PVCD_Bankruptcy_Exclusion_End_Y_N] [varchar](50) NULL,
	[PVCD_Shareholder_End_Y_N] [varchar](50) NULL,
	[PVCD_Past_Acts_End_Y_N] [varchar](50) NULL,
	[PVCD_No_Liab_Retent_Waiver_End_Y_N] [varchar](50) NULL,
	[PVCD_Manuscript_Endorsement_End_Y_N] [varchar](50) NULL,
	[PVCD_Election_ERP_End_Y_N] [varchar](50) NULL,
	[PVCD_Delete_Consent_End_Y_N] [varchar](50) NULL,
	[PVCD_Damages_Only_Retention_End_Y_N] [varchar](50) NULL,
	[PVCD_Class_Action_Sublimit_SubRetention_End_Y_N] [varchar](50) NULL,
	[Endorsement_MOLL] [varchar](50) NULL,
	[Endorsement_MOLL_YN] [varchar](2) NULL,
	[Endorsement_HS_009] [varchar](50) NULL,
	[Endorsement_HS_013] [varchar](50) NULL,
	[Endorsement_HS_014] [varchar](50) NULL,
	[Endorsement_HS_003] [varchar](50) NULL,
	[Endorsement_HS_003D] [varchar](50) NULL,
	[Endorsement_HS_004] [varchar](50) NULL,
	[Endorsement_GLDX] [varchar](50) NULL,
	[Endorsement_GLDX_YN] [varchar](2) NULL,
	[Endorsement_DY_CG2504] [varchar](50) NULL,
	[Endorsement_FA_Elite] [varchar](50) NULL,
	[Endorsement_Elite_YN] [varchar](2) NULL,
	[Endorsement_CG0001] [varchar](6) NULL,
	[Endorsement_CG0002] [varchar](6) NULL,
	[Source_Detail_Name] [varchar](50) NULL,
	[BusinessClassDesc] [varchar](75) NULL,
	[ProductType] [varchar](1) NULL,
	[DivisionName] [varchar](50) NULL,
	[PolicyEntityState] [varchar](2) NULL	
)
	

insert into Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp 
SELECT ps.[accountnumber]
      ,[Productcode]
      ,[policynumber]
      ,[policyEffectivedate]
      ,[maxeffdate]
      ,[policyid]
      ,[Account_Name]
      ,[Insured_Name]
      ,[Property_Coverage_Form]
      ,[Primary_Umbrella]
      ,[underwriterPID]
      ,[Companycode]
      ,[billplancode]
      ,[product_group]
      ,[package_monoline]
      ,[policy_effective_year]
      ,[policy_effective_month]
      ,[policyexpirationdate]
      ,[canceldate]
      ,[reinstatementdate]
      ,[Prior_Policy_number]
      ,[New_Renew_Tail]
      ,[Branchcode]
      ,[Renew_New_Auto]
      ,[FAY_For_Review]
      ,[underwriter]
      ,[BillplanshortDesc]
      ,[zipcode]
      ,[Branch_Office]
      ,[Branch_Region]
      ,[East_MidWest_West_Region]
      ,[program]
      ,[NAICS]
      ,[Program_Code]
      ,[First_Policy_Year_Temp]
      ,[Last_Reporting_Year]
      ,[Last_Reporting_Month]
      ,[Inforce_as_of_Cat_Model_Date]
      ,[First_Policy_Year]
      ,[written_premium_policy]
      ,[County]
      ,[County_Pop_Density]
      ,[Term_factor]
      ,[Latest_PY]
      ,[Business_Name]
      ,[Business_Desc]
      ,[Written_Premium_Range_for_Product]
      ,[Written_Premium_Range]
      ,[County_Pop_Density_Range]
      ,[Number_of_Renewals]
      ,[Renewals_Range]
      ,[prior_policynumber_2]
      ,[prior_policynumber_3]
      ,[prior_policynumber_4]
      ,[prior_policynumber_5]
      ,[prior_policynumber_6]
      ,[prior_policynumber_7]
      ,[prior_policynumber_8]
      ,[New_Renew_Automatic_Prior_Policy]
      ,[New_Renew_Automatic_Prior_Policy_2]
      ,[New_Renew_Automatic_Prior_Policy_3]
      ,[New_Renew_Automatic_Prior_Policy_4]
      ,[New_Renew_Automatic_Prior_Policy_5]
      ,[PIC_Producer_code]
      ,[PIC_Commission_pct]
      ,[Primary_Producer_code]
      ,[Primary_Commission_pct]
      ,[PIC_Producer]
      ,[PIC_Producer_type]
      ,[Primary_Producer]
      ,[Primary_Producer_type]
      ,[Commission_pct]
      ,[Count_of_Account_Numbers]
      ,[Count_of_Account_Numbers_Range]
,isnull(Premium_Summary_Account.Account_UltLoss,0) as Account_UltLoss
,isnull(Premium_Summary_Account.Account_UltLoss_NonCat,0) as Account_UltLoss_NonCat
,isnull(Premium_Summary_Account.Account_RepLoss,0) as Account_RepLoss
,isnull(Premium_Summary_Account.Account_RepLoss_NonCat,0) as Account_RepLoss_NonCat
,isnull(Premium_Summary_Account.Account_EarnedPremium,0) as Account_EarnedPremium
,isnull((select sum(Account_UltLoss) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_UltLoss_priorpolperiods
,isnull((select sum(Account_UltLoss_NonCat) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_UltLoss_NonCat_priorpolperiods
,isnull((select sum(Account_RepLoss) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_RepLoss_priorpolperiods
,isnull((select sum(Account_RepLoss_NonCat) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_RepLoss_NonCat_priorpolperiods
, isnull((select sum(Account_EarnedPremium) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_EarnedPremium_priorpolperiods
				
,isnull(Premium_Summary_Account.Account_UltLoss_Working_Cover,0) as Account_UltLoss_Working_Cover
,isnull(Premium_Summary_Account.Account_UltLoss_NonCat_Working_Cover,0) as Account_UltLoss_NonCat_Working_Cover
,isnull(Premium_Summary_Account.Account_RepLoss_Working_Cover,0) as Account_RepLoss_Working_Cover
,isnull(Premium_Summary_Account.Account_RepLoss_NonCat_Working_Cover,0) as Account_RepLoss_NonCat_Working_Cover
,isnull(Premium_Summary_Account.Account_EarnedPremium_Working_Cover,0) as Account_EarnedPremium_Working_Cover

,isnull((select sum(Account_UltLoss_Working_Cover) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_UltLoss_Working_Cover_priorpolperiods
,isnull((select sum(Account_UltLoss_NonCat_Working_Cover) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_UltLoss_NonCat_Working_Cover_priorpolperiods
,isnull((select sum(Account_RepLoss_Working_Cover) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_RepLoss_Working_Cover_priorpolperiods
,isnull((select sum(Account_RepLoss_NonCat_Working_Cover) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_RepLoss_NonCat_Working_Cover_priorpolperiods
,isnull((select sum(Account_EarnedPremium_Working_Cover) from #temp_prior_policy_sums prior_policy
where prior_policy.Accountnumber=PS.Accountnumber
and (prior_policy.policynumber = PS.Prior_Policy_number
				or prior_policy.policynumber = PS.prior_policynumber_2
				or prior_policy.policynumber = PS.prior_policynumber_3
				or prior_policy.policynumber = PS.prior_policynumber_4
				or prior_policy.policynumber = PS.prior_policynumber_5)),0) as Account_EarnedPremium_Working_Cover_priorpolperiods
				
      ,[Account_Premium_latest_year]
      ,[Account_Premium_range]
      ,[Account_written_premium_for_product]
      ,[Account_written_premium_for_product_max]
      ,[Account_Dominant_Product]
      ,[Account_Dominant_Product_Group]
      ,[Account_Dominant_Product_policy_premium_max]
      ,[Account_Dominant_Policy]
      ,[Dominant_Policy_max_effdate]
      ,[Review_quarter]
      ,[Account_UltLoss_Ratio]
      ,[Account_UltLoss_Ratio_NonCat]
      ,[Account_RepLoss_Ratio]
      ,[Account_RepLoss_Ratio_NonCat]
      ,[Account_UltLoss_Ratio_Working_Cover]
      ,[Account_UltLoss_Ratio_nonCat_Working_Cover]
      ,[Account_RepLoss_Ratio_Working_Cover]
      ,[Account_RepLoss_Ratio_nonCat_Working_Cover]
      ,[Account_UltLoss_Ratio_priorpolperiods]
      ,[Account_UltLoss_Ratio_NonCat_priorpolperiods]
      ,[Account_RepLoss_Ratio_priorpolperiods]
      ,[Account_RepLoss_Ratio_NonCat_priorpolperiods]
      ,[Account_UltLoss_Ratio_Working_Cover_priorpolperiods]
      ,[Account_UltLoss_Ratio_nonCat_Working_Cover_priorpolperiods]
      ,[Account_RepLoss_Ratio_Working_Cover_priorpolperiods]
      ,[Account_RepLoss_Ratio_nonCat_Working_Cover_priorpolperiods]
      ,[Account_UltLoss_Ratio_Range]
      ,[Account_UltLoss_Ratio_NonCat_Range]
      ,[Account_RepLoss_Ratio_Range]
      ,[Account_RepLoss_Ratio_NonCat_Range]
      ,[Account_UltLoss_Ratio_priorpolperiods_Range]
      ,[Account_UltLoss_Ratio_NonCat_priorpolperiods_Range]
      ,[Account_RepLoss_Ratio_priorpolperiods_Range]
      ,[Account_RepLoss_Ratio_NonCat_priorpolperiods_Range]
      ,[Account_UltLoss_Ratio_Working_Cover_Range]
      ,[Account_UltLoss_Ratio_NonCat_Working_Cover_Range]
      ,[Account_RepLoss_Ratio_Working_Cover_Range]
      ,[Account_RepLoss_Ratio_NonCat_Working_Cover_Range]
      ,[Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range]
      ,[Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range]
      ,[Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range]
      ,[Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range]
      ,[Endorsement_VS_001]
      ,[PVCD_Amendment_End_Y_N]
      ,[PVCD_Partnership_End_Y_N]
      ,[PVCD_ProPak_Elite72_End_Y_N]
      ,[PVCD_ProPak_Elite73_End_Y_N]
      ,[PVCD_ProPak_Elite_Vermont7273_End_Y_N]
      ,[PVCD_Circumstance_Exclusion_End_Y_N]
      ,[PVCD_Professional_Services_End_Y_N]
      ,[PVCD_BullsEye_ProPak_End_Y_N]
      ,[PVCD_Sexual_Abuse_Exclusion_End_Y_N]
      ,[PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N]
      ,[PVCD_Amend_of_ExclusionK_End_Y_N]
      ,[PVCD_Amend_of_Severability_Provision_End_Y_N]
      ,[PVCD_Third_Party_Exclusion_End_Y_N]
      ,[PVCD_Punitive_Exclusion_End_Y_N]
      ,[PVCD_Medical_Malpractice_Exclusion_End_Y_N]
      ,[PVCD_Insurance_EO_Exclusion_End_Y_N]
      ,[PVCD_Full_Securities_Exclusion_End_Y_N]
      ,[PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N]
      ,[PVCD_Bankruptcy_Exclusion_End_Y_N]
      ,[PVCD_Shareholder_End_Y_N]
      ,[PVCD_Past_Acts_End_Y_N]
      ,[PVCD_No_Liab_Retent_Waiver_End_Y_N]
      ,[PVCD_Manuscript_Endorsement_End_Y_N]
      ,[PVCD_Election_ERP_End_Y_N]
      ,[PVCD_Delete_Consent_End_Y_N]
      ,[PVCD_Damages_Only_Retention_End_Y_N]
      ,[PVCD_Class_Action_Sublimit_SubRetention_End_Y_N]
      ,[Endorsement_MOLL]
      ,[Endorsement_MOLL_YN]
      ,[Endorsement_HS_009]
      ,[Endorsement_HS_013]
      ,[Endorsement_HS_014]
      ,[Endorsement_HS_003]
      ,[Endorsement_HS_003D]
      ,[Endorsement_HS_004]
      ,[Endorsement_GLDX]
      ,[Endorsement_GLDX_YN]
      ,[Endorsement_DY_CG2504]
      ,[Endorsement_FA_Elite]
      ,[Endorsement_Elite_YN]
      ,Endorsement_CG0001
      ,Endorsement_CG0002
      ,Source_Detail_Name
      ,BusinessClassDesc
      ,ProductType
      ,DivisionName
      ,PolicyEntityState
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS
left outer join 
(select Accountnumber,
sum(isnull(Account_UltLoss,0)) Account_UltLoss,
sum(isnull(Account_UltLoss_NonCat,0)) Account_UltLoss_NonCat,
sum(isnull(Account_RepLoss,0)) Account_RepLoss,
sum(isnull(Account_RepLoss_NonCat,0)) Account_RepLoss_NonCat,
sum(isnull(Account_EarnedPremium,0)) Account_EarnedPremium,

sum(isnull(Account_UltLoss_Working_Cover,0)) Account_UltLoss_Working_Cover,
sum(isnull(Account_UltLoss_NonCat_Working_Cover,0)) Account_UltLoss_NonCat_Working_Cover,
sum(isnull(Account_RepLoss_Working_Cover,0)) Account_RepLoss_Working_Cover,
sum(isnull(Account_RepLoss_NonCat_Working_Cover,0)) Account_RepLoss_NonCat_Working_Cover,
sum(isnull(Account_EarnedPremium_Working_Cover,0)) Account_EarnedPremium_Working_Cover

from #temp_prior_policy_sums
group by Accountnumber) Premium_Summary_Account
on Premium_Summary_Account.Accountnumber=PS.Accountnumber


------------------------------------------------------------------


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp 
set 
Account_UltLoss_Ratio = (case 
	when Account_EarnedPremium > 0
	then Account_UltLoss / Account_EarnedPremium
	else Null
	end),
Account_UltLoss_Ratio_NonCat = (case 
	when Account_EarnedPremium > 0
	then Account_UltLoss_NonCat / Account_EarnedPremium
	else Null
	end),
Account_RepLoss_Ratio = (case 
	when Account_EarnedPremium > 0
	then Account_RepLoss / Account_EarnedPremium
	else Null
	end),
Account_RepLoss_Ratio_NonCat = (case 
	when Account_EarnedPremium > 0
	then Account_RepLoss_NonCat / Account_EarnedPremium
	else Null
	end),

Account_UltLoss_Ratio_Working_Cover = (case 
	when Account_EarnedPremium_Working_Cover > 0
	then Account_UltLoss_Working_Cover / Account_EarnedPremium_Working_Cover
	else Null
	end),
Account_UltLoss_Ratio_NonCat_Working_Cover = (case 
	when Account_EarnedPremium_Working_Cover > 0
	then Account_UltLoss_NonCat_Working_Cover / Account_EarnedPremium_Working_Cover
	else Null
	end),
Account_RepLoss_Ratio_Working_Cover = (case 
	when Account_EarnedPremium_Working_Cover > 0
	then Account_RepLoss_Working_Cover / Account_EarnedPremium_Working_Cover
	else Null
	end),
Account_RepLoss_Ratio_NonCat_Working_Cover = (case 
	when Account_EarnedPremium_Working_Cover > 0
	then Account_RepLoss_NonCat_Working_Cover / Account_EarnedPremium_Working_Cover
	else Null
	end),

Account_UltLoss_Ratio_priorpolperiods = (case 
	when Account_EarnedPremium_priorpolperiods > 0
	then Account_UltLoss_priorpolperiods / Account_EarnedPremium_priorpolperiods
	else Null
	end),
Account_UltLoss_Ratio_NonCat_priorpolperiods = (case 
	when Account_EarnedPremium_priorpolperiods > 0
	then Account_UltLoss_NonCat_priorpolperiods / Account_EarnedPremium_priorpolperiods
	else Null
	end),
Account_RepLoss_Ratio_priorpolperiods = (case 
	when Account_EarnedPremium_priorpolperiods > 0
	then Account_RepLoss_priorpolperiods / Account_EarnedPremium_priorpolperiods
	else Null
	end),
Account_RepLoss_Ratio_NonCat_priorpolperiods = (case 
	when Account_EarnedPremium_priorpolperiods > 0
	then Account_RepLoss_NonCat_priorpolperiods / Account_EarnedPremium_priorpolperiods
	else Null
	end),

Account_UltLoss_Ratio_Working_Cover_priorpolperiods = (case 
	when Account_EarnedPremium_Working_Cover_priorpolperiods > 0
	then Account_UltLoss_Working_Cover_priorpolperiods / Account_EarnedPremium_Working_Cover_priorpolperiods
	else Null
	end),
Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods = (case 
	when Account_EarnedPremium_Working_Cover_priorpolperiods > 0
	then Account_UltLoss_NonCat_Working_Cover_priorpolperiods / Account_EarnedPremium_Working_Cover_priorpolperiods
	else Null
	end),
Account_RepLoss_Ratio_Working_Cover_priorpolperiods = (case 
	when Account_EarnedPremium_Working_Cover_priorpolperiods > 0
	then Account_RepLoss_Working_Cover_priorpolperiods / Account_EarnedPremium_Working_Cover_priorpolperiods
	else Null
	end),
Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods = (case 
	when Account_EarnedPremium_Working_Cover_priorpolperiods > 0
	then Account_RepLoss_NonCat_Working_Cover_priorpolperiods / Account_EarnedPremium_Working_Cover_priorpolperiods
	else Null
	end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp PS




--------------------------------------------------------------------


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp 
set 
Account_UltLoss_Ratio_Range = (case 
		when Account_UltLoss_Ratio is null then ''a: no data''
		when Account_UltLoss_Ratio = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_UltLoss_Ratio_NonCat_Range = (case 
		when Account_UltLoss_Ratio_NonCat is null then ''a: no data''
		when Account_UltLoss_Ratio_NonCat = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio_NonCat < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio_NonCat < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_Range = (case 
		when Account_RepLoss_Ratio is null then ''a: no data''
		when Account_RepLoss_Ratio = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_NonCat_Range = (case 
		when Account_RepLoss_Ratio_NonCat is null then ''a: no data''
		when Account_RepLoss_Ratio_NonCat = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio_NonCat < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio_NonCat < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),

Account_UltLoss_Ratio_priorpolperiods_Range = (case 
		when Account_UltLoss_Ratio_priorpolperiods is null then ''a: no data''
		when Account_UltLoss_Ratio_priorpolperiods = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_UltLoss_Ratio_NonCat_priorpolperiods_Range = (case 
		when Account_UltLoss_Ratio_NonCat_priorpolperiods is null then ''a: no data''
		when Account_UltLoss_Ratio_NonCat_priorpolperiods = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio_NonCat_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio_NonCat_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_priorpolperiods_Range = (case 
		when Account_RepLoss_Ratio_priorpolperiods is null then ''a: no data''
		when Account_RepLoss_Ratio_priorpolperiods = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_NonCat_priorpolperiods_Range = (case 
		when Account_RepLoss_Ratio_NonCat_priorpolperiods is null then ''a: no data''
		when Account_RepLoss_Ratio_NonCat_priorpolperiods = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio_NonCat_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio_NonCat_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),


Account_UltLoss_Ratio_Working_Cover_Range = (case 
		when Account_UltLoss_Ratio_Working_Cover is null then ''a: no data''
		when Account_UltLoss_Ratio_Working_Cover = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio_Working_Cover < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio_Working_Cover < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_UltLoss_Ratio_NonCat_Working_Cover_Range = (case 
		when Account_UltLoss_Ratio_NonCat_Working_Cover is null then ''a: no data''
		when Account_UltLoss_Ratio_NonCat_Working_Cover = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio_NonCat_Working_Cover < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio_NonCat_Working_Cover < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_Working_Cover_Range = (case 
		when Account_RepLoss_Ratio_Working_Cover is null then ''a: no data''
		when Account_RepLoss_Ratio_Working_Cover = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio_Working_Cover < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio_Working_Cover < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_NonCat_Working_Cover_Range = (case 
		when Account_RepLoss_Ratio_NonCat_Working_Cover is null then ''a: no data''
		when Account_RepLoss_Ratio_NonCat_Working_Cover = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio_NonCat_Working_Cover < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio_NonCat_Working_Cover < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),

Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range = (case 
		when Account_UltLoss_Ratio_Working_Cover_priorpolperiods is null then ''a: no data''
		when Account_UltLoss_Ratio_Working_Cover_priorpolperiods = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio_Working_Cover_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio_Working_Cover_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range = (case 
		when Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods is null then ''a: no data''
		when Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods = 0.0 then ''b: zero''
		when Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range = (case 
		when Account_RepLoss_Ratio_Working_Cover_priorpolperiods is null then ''a: no data''
		when Account_RepLoss_Ratio_Working_Cover_priorpolperiods = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio_Working_Cover_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio_Working_Cover_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end),
Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range = (case 
		when Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods is null then ''a: no data''
		when Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods = 0.0 then ''b: zero''
		when Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods < 0.1 then ''c: 0% to 10%''
		when Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods < 0.5 then ''d: 10% to 50%''
		else ''e: over 50%'' 
		end)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp

drop table Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work

exec sp_rename ''Policy_Information_ALL_POLICIES_temp'',''Policy_Information_ALL_POLICIES_work''

update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

' 
END
GO
