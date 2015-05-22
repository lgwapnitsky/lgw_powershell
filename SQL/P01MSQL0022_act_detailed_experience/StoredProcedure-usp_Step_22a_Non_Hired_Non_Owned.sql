IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_22a_Non_Hired_Non_Owned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_22a_Non_Hired_Non_Owned]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_22a_Non_Hired_Non_Owned]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[usp_Step_22a_Non_Hired_Non_Owned] as  

-- FootPrints Ticket #73460
-- Creator:	Steve Breisch
-- Date: 6/11/2013
-- Description: Step 1 of the Non Hired Non Owned Process

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[ALL_POLICIES_12_premium_summary_non_hired_non_owned_work]'') AND type in (N''U''))
Drop Table act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work;

CREATE TABLE [dbo].[ALL_POLICIES_12_premium_summary_non_hired_non_owned_work](
	[accountnumber] [int] NULL,
	[policynumber] [varchar](15) NULL,
	[policyeffectivedate] [datetime] NULL,
	[statecode] [varchar](2) NULL,
	[Coverage_Group] [varchar](50) NULL,
	[Coverage_Reporting_group] [varchar](50) NULL,
	[Coverage_Form] [varchar](50) NULL,
	[productcode] [varchar](50) NULL,
	[experienceproduct] [varchar](6) NULL,
	[Fiscal_AY_Month_Ending] [int] NULL,
	[Fiscal_AY_Year] [int] NULL,
	[acctngyear] [int] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[currentwrittenpremium] [decimal](15, 2) NULL,
	[currentearnedpremium] [decimal](15, 2) NULL,
	[Policy_count_All_Cov_Combined_WP] [float] NULL,
	[Policy_count_Reporting_Coverage_WP] [float] NULL,
	[Policy_count_Coverage_Group_WP] [float] NULL,
	[Policy_count_All_Cov_Combined] [float] NULL,
	[Policy_count_Reporting_Coverage] [float] NULL,
	[Policy_count_Coverage_Group] [float] NULL,
	[Policy_count_All_Cov_Combined_Total] [float] NULL,
	[Policy_count_Reporting_Coverage_Total] [float] NULL,
	[Policy_count_Coverage_Group_Total] [float] NULL,
	[Loss_Evaluation_Month] [int] NULL,
	[Loss_Evaluation_Year] [int] NULL,
	[Loss_ALAE_Cap] [float] NULL,
	[COL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_Discrimination_Count] [decimal](15, 2) NULL,
	[COL_Discrimination_Count_rptd] [decimal](15, 2) NULL,
	[COL_Discrimination_Loss] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Count] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Count_rptd] [decimal](15, 2) NULL,
	[COL_Wrongful_Termination_Loss] [decimal](15, 2) NULL,
	[COL_Harrassment_Count] [decimal](15, 2) NULL,
	[COL_Harrassment_Count_rptd] [decimal](15, 2) NULL,
	[COL_Harrassment_Loss] [decimal](15, 2) NULL,
	[COL_DO_Other_Count] [decimal](15, 2) NULL,
	[COL_DO_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_DO_Other_Loss] [decimal](15, 2) NULL,
	[COL_EPL_Other_Count] [decimal](15, 2) NULL,
	[COL_EPL_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_EPL_Other_Loss] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Count] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Fiduciary_Other_Loss] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Count] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Worplace_Violence_Other_Loss] [decimal](15, 2) NULL,
	[COL_Internet_Other_Count] [decimal](15, 2) NULL,
	[COL_Internet_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Internet_Other_Loss] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Count] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_SLD_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Count] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Financial_Advisor_Loss] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Count] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Misconduct_Loss] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Count] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Wills_Estate_Loss] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Count] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Corporate_Loss] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Count] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Tax_Liability_Loss] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Count] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_Violation_GAAP_Loss] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Count] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_AE_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Count] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Breach_of_Fiduciary_Liability_Loss] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Count] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Financial_Advisor_Loss] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Count] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Misconduct_Loss] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Count] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Wills_Estate_Loss] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Count] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Corporate_Loss] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Count] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Tax_Liability_Loss] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Count] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Violation_GAAP_Loss] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Count] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Negligent_Training_Loss] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Count] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_Electronic_Data_Damage_Loss] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Count] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_CL_All_Other_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Malpractice_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Malpractice_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Malpractice_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Fraud_Breach_of_Contract_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Injury_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Other_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Sexual_Assault_Molest_Abuse_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Count] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_PropertyDamage_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Theft_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Count] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_SlanderDefamtion_Loss] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Count] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Count_rptd] [decimal](15, 2) NULL,
	[COL_GLBI_Discrim_WrongfulTermination_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Count] [decimal](15, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Fire_Lightning_Explosion_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Count] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Theft_Van_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Count] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Water_Sprinkler_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Count] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Water_Other_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Count] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Wind_Hail_Loss] [decimal](15, 2) NULL,
	[COL_Prop_Other_Count] [decimal](15, 2) NULL,
	[COL_Prop_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_Prop_Other_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Count] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_AllOther_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Count] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_LIAB_PropDam_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Coll_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Glass_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Other_Loss] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Theft_Count] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Theft_Count_rptd] [decimal](15, 2) NULL,
	[COL_AUTO_PHYS_Theft_Loss] [decimal](15, 2) NULL,
	[Case_Loss] [decimal](15, 2) NULL,
	[Case_ALAE] [decimal](15, 2) NULL,
	[Paid_Loss] [decimal](15, 2) NULL,
	[Paid_ALAE] [decimal](15, 2) NULL,
	[Sal_Subro] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_without_SS] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly] [decimal](15, 2) NULL,
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](15, 2) NULL,
	[Reported_Claims] [decimal](15, 2) NULL,
	[Open_Claims] [decimal](15, 2) NULL,
	[Closed_With_Pay_Claims] [decimal](15, 2) NULL,
	[Closed_Without_Pay_Claims] [decimal](15, 2) NULL,
	[Incurred_Claims] [decimal](15, 2) NULL,
	[Case_Loss_PremSt] [decimal](15, 2),
	[Case_ALAE_PremSt] [decimal](15, 2),
	[Paid_Loss_PremSt] [decimal](15, 2),
	[Paid_ALAE_PremSt] [decimal](15, 2),
	[Sal_Subro_PremSt] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_CatOnly_PremSt] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_NonCat_PremSt] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_CatOnly_PremSt] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_NonCat_PremSt] [decimal](15, 2),
	[Incurred_Loss_ALAE_without_SS_PremSt] [decimal](15, 2),
	[Incurred_Loss_ALAE_with_SS_PremSt] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS_PremSt] [decimal](15, 2),
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat_PremSt] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_PremSt] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_CatOnly_PremSt] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat_PremSt] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_PremSt] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_CatOnly_PremSt] [decimal](15, 2),
	[Ult_LDF_Incurred_Loss_ALAE_without_SS_NonCat_PremSt] [decimal](15, 2),
	[Ult_LDF_Capped_Inc_Loss_ALAE_with_SS_PremSt] [decimal](15, 2),
	[Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat_PremSt] [decimal](15, 2),
	[Reported_Claims_PremSt] [decimal](15, 2),
	[Open_Claims_PremSt] [decimal](15, 2),
	[Closed_With_Pay_Claims_PremSt] [decimal](15, 2),
	[Closed_Without_Pay_Claims_PremSt] [decimal](15, 2),
	[Incurred_Claims_PremSt] [decimal](15, 2),
	[Experience_Product_Group] [varchar](50),
	[Commission_pct] [float] NULL,
	[Commission_dollars] [float] NULL,
	[Commission_Premiums] [float] NULL,
	[FA_Number_of_Buildings] [float] NULL,
	[FA_Number_of_Locations] [float] NULL,
	[TIV] [float] NULL,
	[Term_Factor] [float] NULL,
	[Written_Premium_Policy_FireAllied] [float] NULL,
	[Earned_Buildings] [float] NULL,
	[Earned_Locations] [float] NULL,
	[Earned_TIV] [float] NULL,
	[Earned_Buildings_Total] [float] NULL,
	[Earned_Locations_Total] [float] NULL,
	[Earned_TIV_Total] [float] NULL)

declare @First_Year as int
Set @First_Year = (select First_Year from Detailed_Experience_Parameters)  

declare @Last_Reporting_Year as int
Set @Last_Reporting_Year = (select Last_Reporting_Year from Detailed_Experience_Parameters) 	

declare @Last_Reporting_Month as int
Set @Last_Reporting_Month = (select Last_Reporting_Month from Detailed_Experience_Parameters)	

declare @Fiscal_AY_Month_Ending as int
Set @Fiscal_AY_Month_Ending = (select Fiscal_AY_Month_Ending from Detailed_Experience_Parameters)

insert into act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work
 (	accountnumber,
	policynumber,
	policyeffectivedate,
	statecode,
	Coverage_Group,
	Coverage_Reporting_group,
	Coverage_Form,
	productcode,
	experienceproduct,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	acctngyear,
	Last_Reporting_Year,
	Last_Reporting_Month,
	currentwrittenpremium,
	currentearnedpremium)
select
	accountnumber,
	policynumber,
	policyeffectivedate,
	statecode,
	step1.Coverage_Group,
	isnull(crg.Coverage_Reporting_Group,''Other'') as Coverage_Reporting_group,
	Coverage_Form,
	productcode,
	experienceproduct,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	acctngyear,
	@Last_Reporting_Year as Last_Reporting_Year,
	@Last_Reporting_Month as Last_Reporting_Month,	
	sum(currentwrittenpremium) as currentwrittenpremium,
	sum(currentearnedpremium) as currentearnedpremium
from (
	Select 
	accountnumber,
	policynumber,
	policyeffectivedate,
	statecode,
	PS.sublinecode,
	(SG.Subline_Group) as Subline_Group,
	(case 
		when ps.coveragecode = ''GLBI'' 
			and ps.productcode in (''AE'',
''AI'',
''CL'',
''DM'',
''EL'',
''EO'',
''EW'',
''FT'',
''HP'',
''IE'',
''LE'',
''MC'',
''PL'',
''SB'')
		then ''E&O'' 
		when ps.coveragecode = ''GLBI'' 
			and ps.productcode in (''AC'',
''AM'',
''AU'',
''BE'',
''BU'',
''CM'',
''CR'',
''CU'',
''DU'',
''EM'',
''EU'',
''FE'',
''FM'',
''FT'',
''GM'',
''GU'',
''HU'',
''IU'',
''LU'',
''ML'',
''MM'',
''MR'',
''MU'',
''NM'',
''NU'',
''OU'',
''PD'',
''PE'',
''RM'',
''RR'',
''RU'',
''SM'',
''SU'',
''TU'',
''TV'',
''UA'',
''UB'',
''UD'',
''UE'',
''UF'',
''UG'',
''UH'',
''UI'',
''UK'',
''UL'',
''UN'',
''UP'',
''UR'',
''UT'',
''UU'',
''UV'',
''UW'',
''VM'',
''VU'',
''YU'')
		then ''Umbrella'' 
		else (CG.Coverage_Group2) 
		end) as Coverage_Group,
	(CG.Prop_Indication_key) as Coverage_Form,
	ps.productcode,
	isnull(Prod1.experienceproduct,Prod2.experienceproduct ) as experienceproduct,

	@Fiscal_AY_Month_Ending as Fiscal_AY_Month_Ending,
	(case 
		when PS.acctngmonth <= @Fiscal_AY_Month_Ending then PS.Acctngyear
		else PS.Acctngyear + 1
		end) as Fiscal_AY_Year,
	Acctngyear,
	currentwrittenpremium,
	currentearnedpremium
from AccessPHLYEOM.dbo.premiumsummary PS
left outer join Act_Definitions.dbo.Subline SG
			  on SG.Sublinecode = ps.Sublinecode
left outer join  Act_Definitions.dbo.Coverage_Groups CG
			  on CG.Coveragecode = ps.Coveragecode			  
left outer join AccessPHLYEOM.dbo.ProductMatrix Prod1 
			on PS.Productcode = Prod1.Productcode
				and PS.ASLOBcode = Prod1.MonolineASLOBcode
				and PS.Sublinecode = Prod1.Sublinecode
				and ltrim(rtrim(ps.Coveragecode)) = Prod1.Coveragecode
				and PS.PolicyEffectivedate >= Prod1.Effectivedate
				and PS.PolicyEffectivedate < Prod1.Expirationdate	
left outer join AccessPHLYEOM.dbo.ProductMatrix Prod2 
			on PS.Productcode = Prod2.Productcode
				and PS.ASLOBcode = Prod2.MonolineASLOBcode
				and PS.Sublinecode = Prod2.Sublinecode
				and ltrim(rtrim(ps.Coveragecode)) = Prod2.Coveragecode
				and PS.PolicyExpirationdate >= Prod2.Effectivedate
				and PS.PolicyExpirationdate < Prod2.Expirationdate					  
where Acctngyear >= @First_Year
	and acctngyear * 100 + acctngmonth <= @Last_Reporting_Year * 100 + @Last_Reporting_Month
    and ps.aslobcode in (''193'',''194'',''212'') 
      and classcode in (
            ''6601'',''6602'',''6603'',''6604'',''6605'',''6670'',''6671'',''6672'',''7000'',--Non-Owned
            ''6614'',''6619'',''6625'',--Hired Auto
            ''9020''--Drive Other Car
      )

) as step1
left outer join Act_Definitions.dbo.Coverage_Reporting_Groups crg
on step1.Coverage_Group=crg.Coverage_Group
where fiscal_ay_year >= @First_Year
group by 
	accountnumber,
	policynumber,
	policyeffectivedate,
	statecode,
	step1.Coverage_Group,
	crg.Coverage_Reporting_Group,
	Coverage_Form,
	productcode,
	experienceproduct,
	Fiscal_AY_Month_Ending,
	Fiscal_AY_Year,
	acctngyear;
	
if not exists ( select 1 from sys.indexes 
where name = ''IX_policynumber''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work''))
create index IX_policynumber 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work
(policynumber);

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Group''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work''))
create index IX_Coverage_Group 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work
(Coverage_Group);

if not exists ( select 1 from sys.indexes 
where name = ''IX_Coverage_Reporting_group''
		and   object_id = object_id(''Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work''))
create index IX_Coverage_Reporting_group 
on Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work 
(Coverage_Reporting_group);

update act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work
set 
policyeffectivedate = (
	select pol.effectivedate 
	from Accessphlyeom.dbo.policy pol
	where pol.policynumber = PS.policynumber)
from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work PS
where policyeffectivedate is null;

with PolCnt_All_Cov_combined_WP(
	Policynumber, 
	Currentwrittenpremium
) as (
	select 
		B.Policynumber, 
		sum(B.currentwrittenpremium) 
	from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work B
	group by B.Policynumber ),
	
PolCnt_Reporting_Cov_combined_WP(
	Policynumber, 
	Coverage_Reporting_group,
	Currentwrittenpremium
) as (
	select 
		B.Policynumber,
		B.Coverage_Reporting_group, 
		sum(B.currentwrittenpremium) 
	from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work B
	group by 
		B.Policynumber, 
		B.Coverage_Reporting_group ),
		
PolCnt_Cov_combined_WP(
	Policynumber, 
	Coverage_Group,
	Currentwrittenpremium
) as (
	select 
		B.Policynumber,
		B.Coverage_Group, 
		sum(B.currentwrittenpremium) 
	from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work B
	group by 
		B.Policynumber, 
		B.Coverage_Group )
		
		
update act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work 
set 
Policy_count_All_Cov_Combined_WP = All_Cov.Currentwrittenpremium,
Policy_count_Reporting_Coverage_WP = Rpt_Cov.Currentwrittenpremium,
Policy_count_Coverage_Group_WP = Cov_Grp.Currentwrittenpremium,

Policy_count_All_Cov_Combined = (case 
	when PS.currentearnedpremium is not null 
		and PS.currentearnedpremium > 0 
		and Cov_Grp.Currentwrittenpremium > 0 
	then convert(decimal(20,8),currentearnedpremium) / Cov_Grp.Currentwrittenpremium
	else NULL end),
Policy_count_Reporting_Coverage = (case 
	when currentearnedpremium is not null 
		and currentearnedpremium > 0 
		and Rpt_Cov.Currentwrittenpremium > 0 
	then convert(decimal(20,8),currentearnedpremium) / Rpt_Cov.Currentwrittenpremium 
	else NULL 
	end),
Policy_count_Coverage_Group = (case 
	when currentearnedpremium is not null  
		and currentearnedpremium > 0 
		and Cov_Grp.Currentwrittenpremium > 0 
	then convert(decimal(20,8),currentearnedpremium) / Cov_Grp.Currentwrittenpremium 
		else NULL 
	end)
from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work PS
left outer join PolCnt_All_Cov_combined_WP All_Cov
	on All_Cov.Policynumber = PS.policynumber
left outer join PolCnt_Reporting_Cov_combined_WP Rpt_Cov
	on Rpt_Cov.Policynumber = PS.policynumber
		and Rpt_Cov.Coverage_Reporting_group = PS.Coverage_Reporting_group
left outer join PolCnt_Cov_combined_WP Cov_Grp
	on Cov_Grp.Policynumber = PS.policynumber
		and Cov_Grp.Coverage_Group = PS.Coverage_Group;

with PolCnt_All_Cov_combined_Cnt(
	Policynumber, 
	Policy_count_All_Cov_Combined
) as (
	select 
		B.Policynumber, 
		sum(B.Policy_count_All_Cov_Combined) 
	from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work B
	group by B.Policynumber ),
PolCnt_Reporting_Cov_combined_Cnt(
	Policynumber, 
	Coverage_Reporting_group,
	Policy_count_Reporting_Coverage
) as (
	select 
		B.Policynumber,
		B.Coverage_Reporting_group, 
		sum(B.Policy_count_Reporting_Coverage) 
	from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work B
	group by 
		B.Policynumber, 
		B.Coverage_Reporting_group ),
PolCnt_Cov_combined_Cnt(
	Policynumber, 
	Coverage_Group,
	Policy_count_Coverage_Group
) as (
	select 
		B.Policynumber,
		B.Coverage_Group, 
		sum(Policy_count_Coverage_Group) 
	from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work B
	group by 
		B.Policynumber, 
		B.Coverage_Group )
update act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work 
set 
Policy_count_All_Cov_Combined_Total =  All_Cov.Policy_count_All_Cov_Combined,
Policy_count_Reporting_Coverage_Total = Rpt_Cov.Policy_count_Reporting_Coverage,
Policy_count_Coverage_Group_Total = Cov_Grp.Policy_count_Coverage_Group,
Policy_count_All_Cov_Combined = (case
	when PS.Policy_count_All_Cov_Combined is not null 
		and PS.Policy_count_All_Cov_Combined > 0.0
	then (case 
		when All_Cov.Policy_count_All_Cov_Combined > 1.0
		then PS.Policy_count_All_Cov_Combined / All_Cov.Policy_count_All_Cov_Combined
		else PS.Policy_count_All_Cov_Combined
		end)
	else PS.Policy_count_All_Cov_Combined
	end),
Policy_count_Reporting_Coverage = (case
	when PS.Policy_count_Reporting_Coverage is not null 
		and PS.Policy_count_Reporting_Coverage > 0.0
	then (case 
		when Rpt_Cov.Policy_count_Reporting_Coverage > 1.0
		then PS.Policy_count_Reporting_Coverage / Rpt_Cov.Policy_count_Reporting_Coverage
		else PS.Policy_count_Reporting_Coverage
		end)
	else PS.Policy_count_Reporting_Coverage
	end),
Policy_count_Coverage_Group = (case
	when PS.Policy_count_Coverage_Group is not null 
		and PS.Policy_count_Coverage_Group > 0.0
	then (case 
		when Cov_Grp.Policy_count_Coverage_Group > 1.0
		then PS.Policy_count_Coverage_Group / Cov_Grp.Policy_count_Coverage_Group
		else PS.Policy_count_Coverage_Group
		end)
	else PS.Policy_count_Coverage_Group
	end)
from act_detailed_experience.dbo.ALL_POLICIES_12_premium_summary_non_hired_non_owned_work PS 
left outer join  PolCnt_All_Cov_combined_Cnt All_Cov
	on All_Cov.Policynumber = PS.policynumber 
left outer join PolCnt_Reporting_Cov_combined_Cnt Rpt_Cov
	on Rpt_Cov.Policynumber = PS.policynumber
		and Rpt_Cov.Coverage_Reporting_group = PS.Coverage_Reporting_group
left outer join  PolCnt_Cov_combined_Cnt Cov_Grp
	on Cov_Grp.Policynumber = PS.policynumber
		and Cov_Grp.Coverage_Group = PS.Coverage_Group;
		
		update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

' 
END
GO
