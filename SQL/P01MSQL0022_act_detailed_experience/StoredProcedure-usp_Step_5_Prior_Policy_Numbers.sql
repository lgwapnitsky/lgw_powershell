IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_5_Prior_Policy_Numbers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_5_Prior_Policy_Numbers]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_5_Prior_Policy_Numbers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[usp_Step_5_Prior_Policy_Numbers]

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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Renewals_ALL_POLICIES_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.Policy_Renewals_ALL_POLICIES_work

Select
	temp8.policynumber,
	temp8.prior_policynumber,
	temp8.prior_policynumber_2,
	temp8.prior_policynumber_3,
	temp8.prior_policynumber_4,
	temp8.prior_policynumber_5,
	temp8.prior_policynumber_6,
	temp8.prior_policynumber_7,
	temp8.prior_policynumber_8,

		(Case 	when (temp8.prior_policynumber is Null 
				or left(ltrim(temp8.prior_policynumber),1) = ''N''
				or temp8.prior_policynumber = '''')
			then 0 
			else 1 +
			(Case 	When (temp8.prior_policynumber_2 is Null 
				or left(ltrim(temp8.prior_policynumber_2),1) = ''N''
					or temp8.prior_policynumber_2 = '''')
				then 0 
				else 1 +
				(Case 	When (temp8.prior_policynumber_3 is Null 
					or left(ltrim(temp8.prior_policynumber_3),1) = ''N''
						or temp8.prior_policynumber_3 = '''')
					then 0 
					else 1 +
					(Case 	When (temp8.prior_policynumber_4 is Null 
						or left(ltrim(temp8.prior_policynumber_4),1) = ''N''
							or temp8.prior_policynumber_4 = '''')
						then 0 
						else 1 +
						(Case 	When (temp8.prior_policynumber_5 is Null 
								or left(ltrim(temp8.prior_policynumber_5),1) = ''N''
								or temp8.prior_policynumber_5 = '''')
							then 0 
							else 1 +
						(Case 	When (temp8.prior_policynumber_6 is Null 
								or left(ltrim(temp8.prior_policynumber_6),1) = ''N''
								or temp8.prior_policynumber_6 = '''')
							then 0 
							else 1 +
						(Case 	When (temp8.prior_policynumber_7 is Null 
								or left(ltrim(temp8.prior_policynumber_7),1) = ''N''
								or temp8.prior_policynumber_7 = '''')
							then 0 
							else 1 +
						(Case 	When (temp8.prior_policynumber_8 is Null 
								or left(ltrim(temp8.prior_policynumber_8),1) = ''N''
								or temp8.prior_policynumber_8 = '''')
							then 0 
							else 1 
							end)
							end)
							end)
							end)
						end)
					end)
				end)
			end) as 	Number_of_Renewals,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_2,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_3,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_4,
			CAST(null as varchar(50)) as New_Renew_Automatic_Prior_Policy_5 
into Act_Detailed_Experience.dbo.Policy_Renewals_ALL_POLICIES_work
from
(Select
	temp7.policynumber,
	temp7.prior_policynumber,
	temp7.prior_policynumber_2,
	temp7.prior_policynumber_3,
	temp7.prior_policynumber_4,
	temp7.prior_policynumber_5,
	temp7.prior_policynumber_6,
	temp7.prior_policynumber_7,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp7.prior_policynumber_7=PO.policynumber))) as prior_policynumber_8
from
(Select
	temp6.policynumber,
	temp6.prior_policynumber,
	temp6.prior_policynumber_2,
	temp6.prior_policynumber_3,
	temp6.prior_policynumber_4,
	temp6.prior_policynumber_5,
	temp6.prior_policynumber_6,
	ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp6.prior_policynumber_6=PO.policynumber))) as prior_policynumber_7
from
(Select
	temp5.policynumber,
	temp5.prior_policynumber,
	temp5.prior_policynumber_2,
	temp5.prior_policynumber_3,
	temp5.prior_policynumber_4,
	temp5.prior_policynumber_5,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp5.prior_policynumber_5=PO.policynumber))) as prior_policynumber_6
from
(Select
	temp4.policynumber,
	temp4.prior_policynumber,
	temp4.prior_policynumber_2,
	temp4.prior_policynumber_3,
	temp4.prior_policynumber_4,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp4.prior_policynumber_4=PO.policynumber))) as prior_policynumber_5
from
(Select
	temp3.policynumber,
	temp3.prior_policynumber,
	temp3.prior_policynumber_2,
	temp3.prior_policynumber_3,
	ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp3.prior_policynumber_3=PO.policynumber))) as prior_policynumber_4
from
(Select
	temp2.policynumber,
	temp2.prior_policynumber,
	temp2.prior_policynumber_2,
	 ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp2.prior_policynumber_2=PO.policynumber))) as prior_policynumber_3
from
(Select
	temp1.policynumber,
	temp1.prior_policynumber,
	 rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where temp1.prior_policynumber=PO.policynumber)) as prior_policynumber_2
from
(select distinct
	policynumber,
	ltrim(rtrim((select distinct PO.prevpolicynumber
				from AccessPHLYEOM.dbo.policy PO
				where PS.policynumber=PO.policynumber))) as prior_policynumber 
from AccessPHLYEOM.dbo.premiumsummary PS
--where Productcode in (''me'')
) as temp1
) as temp2
) as temp3
) as temp4
) as temp5
) as temp6
) as temp7
) as temp8



----------------------------------------------------------------------------------


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_ALL_POLICIES_temp]'') AND type in (N''U''))
DROP TABLE Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp;


select [accountnumber] ,
	[Productcode] ,
	ps.[policynumber] ,
	[policyEffectivedate] ,
	[maxeffdate] ,
	[policyid] ,
	[Account_Name] ,
	[Insured_Name] ,
	[Property_Coverage_Form] ,
	[Primary_Umbrella] ,
	[underwriterPID] ,
	[Companycode] ,
	[billplancode] ,
	[product_group] ,
	[package_monoline] ,
	[policy_effective_year] ,
	[policy_effective_month] ,
	[policyexpirationdate] ,
	[canceldate] ,
	[reinstatementdate] ,
	[Prior_Policy_number] ,
	[New_Renew_Tail] ,
	[Branchcode] ,
	[Renew_New_Auto] ,
	[FAY_For_Review] ,
	[underwriter] ,
	[BillplanshortDesc] ,
	[zipcode] ,
	[Branch_Office] ,
	[Branch_Region] ,
	[East_MidWest_West_Region] ,
	[program] ,
	[NAICS] ,
	[Program_Code] ,
	[First_Policy_Year_Temp] ,
	[Last_Reporting_Year] ,
	[Last_Reporting_Month] ,
	[Inforce_as_of_Cat_Model_Date] ,
	[First_Policy_Year] ,
	[written_premium_policy] ,
	[County] ,
	[County_Pop_Density] ,
	[Term_factor] ,
	[Latest_PY] ,
	[Business_Name] ,
	[Business_Desc] ,
	[Written_Premium_Range_for_Product] ,
	[Written_Premium_Range] ,
	[County_Pop_Density_Range],
Renew.Number_of_Renewals as Number_of_Renewals,
 (case 
	when Renew.number_of_renewals is null then ''a: Null''
	when Renew.number_of_renewals = 0 then ''b: 0''
	when Renew.number_of_renewals = 1 then ''c: 1''
	when Renew.number_of_renewals = 2 then ''d: 2''
	when Renew.number_of_renewals = 3 then ''e: 3''
	else ''f: 4 or more'' 
	end) as Renewals_Range,
Renew.prior_policynumber_2 as prior_policynumber_2,
Renew.prior_policynumber_3 as prior_policynumber_3,
Renew.prior_policynumber_4 as prior_policynumber_4,
Renew.prior_policynumber_5 as prior_policynumber_5,
Renew.prior_policynumber_6 as prior_policynumber_6,
Renew.prior_policynumber_7 as prior_policynumber_7,
Renew.prior_policynumber_8 as prior_policynumber_8,
PS.New_Renew_Automatic_Prior_Policy,
PS.New_Renew_Automatic_Prior_Policy_2,
PS.New_Renew_Automatic_Prior_Policy_3,
PS.New_Renew_Automatic_Prior_Policy_4,
PS.New_Renew_Automatic_Prior_Policy_5,
 PIC_Producer_code,
 PIC_Commission_pct,
 Primary_Producer_code,
 Primary_Commission_pct,
 PIC_Producer,
 PIC_Producer_type,
 Primary_Producer,
 Primary_Producer_type,
 Commission_pct,
 Count_of_Account_Numbers,
 Count_of_Account_Numbers_Range,
 Account_UltLoss,
 Account_UltLoss_NonCat,
 Account_RepLoss,
 Account_RepLoss_NonCat,
 Account_EarnedPremium,
 Account_UltLoss_priorpolperiods,
 Account_UltLoss_NonCat_priorpolperiods,
 Account_RepLoss_priorpolperiods,
 Account_RepLoss_NonCat_priorpolperiods,
 Account_EarnedPremium_priorpolperiods,
 Account_UltLoss_Working_Cover,
 Account_UltLoss_NonCat_Working_Cover,
 Account_RepLoss_Working_Cover,
 Account_RepLoss_NonCat_Working_Cover,
 Account_EarnedPremium_Working_Cover,
 Account_UltLoss_Working_Cover_priorpolperiods,
 Account_UltLoss_NonCat_Working_Cover_priorpolperiods,
 Account_RepLoss_Working_Cover_priorpolperiods,
 Account_RepLoss_NonCat_Working_Cover_priorpolperiods,
 Account_EarnedPremium_Working_Cover_priorpolperiods,
 Account_Premium_latest_year,
 Account_Premium_range,
 Account_written_premium_for_product,
 Account_written_premium_for_product_max,
 Account_Dominant_Product,
 Account_Dominant_Product_Group,
 Account_Dominant_Product_policy_premium_max,
 Account_Dominant_Policy,
 Dominant_Policy_max_effdate,
 Review_quarter,
 Account_UltLoss_Ratio,
 Account_UltLoss_Ratio_NonCat,
 Account_RepLoss_Ratio,
 Account_RepLoss_Ratio_NonCat,
 Account_UltLoss_Ratio_Working_Cover,
 Account_UltLoss_Ratio_nonCat_Working_Cover,
 Account_RepLoss_Ratio_Working_Cover,
 Account_RepLoss_Ratio_nonCat_Working_Cover,
 Account_UltLoss_Ratio_priorpolperiods,
 Account_UltLoss_Ratio_NonCat_priorpolperiods,
 Account_RepLoss_Ratio_priorpolperiods,
 Account_RepLoss_Ratio_NonCat_priorpolperiods,
 Account_UltLoss_Ratio_Working_Cover_priorpolperiods,
 Account_UltLoss_Ratio_nonCat_Working_Cover_priorpolperiods,
 Account_RepLoss_Ratio_Working_Cover_priorpolperiods,
 Account_RepLoss_Ratio_nonCat_Working_Cover_priorpolperiods,
 Account_UltLoss_Ratio_Range,
 Account_UltLoss_Ratio_NonCat_Range,
 Account_RepLoss_Ratio_Range,
 Account_RepLoss_Ratio_NonCat_Range,
 Account_UltLoss_Ratio_priorpolperiods_Range,
 Account_UltLoss_Ratio_NonCat_priorpolperiods_Range,
 Account_RepLoss_Ratio_priorpolperiods_Range,
 Account_RepLoss_Ratio_NonCat_priorpolperiods_Range,
 Account_UltLoss_Ratio_Working_Cover_Range,
 Account_UltLoss_Ratio_NonCat_Working_Cover_Range,
 Account_RepLoss_Ratio_Working_Cover_Range,
 Account_RepLoss_Ratio_NonCat_Working_Cover_Range,
 Account_UltLoss_Ratio_Working_Cover_priorpolperiods_Range,
 Account_UltLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range,
 Account_RepLoss_Ratio_Working_Cover_priorpolperiods_Range,
 Account_RepLoss_Ratio_NonCat_Working_Cover_priorpolperiods_Range,
 Endorsement_VS_001,
 PVCD_Amendment_End_Y_N,
 PVCD_Partnership_End_Y_N,
 PVCD_ProPak_Elite72_End_Y_N,
 PVCD_ProPak_Elite73_End_Y_N,
 PVCD_ProPak_Elite_Vermont7273_End_Y_N,
 PVCD_Circumstance_Exclusion_End_Y_N,
 PVCD_Professional_Services_End_Y_N,
 PVCD_BullsEye_ProPak_End_Y_N,
 PVCD_Sexual_Abuse_Exclusion_End_Y_N,
 PVCD_Amended_Def_of_Employee_Incl_Ind_Contractors_End_Y_N,
 PVCD_Amend_of_ExclusionK_End_Y_N,
 PVCD_Amend_of_Severability_Provision_End_Y_N,
 PVCD_Third_Party_Exclusion_End_Y_N,
 PVCD_Punitive_Exclusion_End_Y_N,
 PVCD_Medical_Malpractice_Exclusion_End_Y_N,
 PVCD_Insurance_EO_Exclusion_End_Y_N,
 PVCD_Full_Securities_Exclusion_End_Y_N,
 PVCD_FAILURE_TO_MAINT_INSUR_EXCLUSION_End_Y_N,
 PVCD_Bankruptcy_Exclusion_End_Y_N,
 PVCD_Shareholder_End_Y_N,
 PVCD_Past_Acts_End_Y_N,
 PVCD_No_Liab_Retent_Waiver_End_Y_N,
 PVCD_Manuscript_Endorsement_End_Y_N,
 PVCD_Election_ERP_End_Y_N,
 PVCD_Delete_Consent_End_Y_N,
 PVCD_Damages_Only_Retention_End_Y_N,
 PVCD_Class_Action_Sublimit_SubRetention_End_Y_N,
 Endorsement_MOLL,
 Endorsement_MOLL_YN,
 Endorsement_HS_009,
 Endorsement_HS_013,
 Endorsement_HS_014,
 Endorsement_HS_003,
 Endorsement_HS_003D,
 Endorsement_HS_004,
 Endorsement_GLDX,
 Endorsement_GLDX_YN,
 Endorsement_DY_CG2504,
 Endorsement_FA_Elite,
 Endorsement_Elite_YN,
 Endorsement_CG0001,
 Endorsement_CG0002,
 Source_Detail_Name,
 BusinessClassDesc,
 ProductType,
 DivisionName,
 PolicyEntitystate
into Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_temp
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS
left join Act_Detailed_Experience.dbo.Policy_Renewals_ALL_POLICIES_work Renew
on PS.Policynumber = Renew.PolicyNumber


drop table Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work

exec sp_rename ''Policy_Information_ALL_POLICIES_temp'', ''Policy_Information_ALL_POLICIES_work''


update Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
set
New_Renew_Automatic_Prior_Policy = 
            (select distinct RNA.Renew_New_Auto
            from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work RNA
            where PS.prior_policy_number = RNA.policynumber),
New_Renew_Automatic_Prior_Policy_2 = 
            (select distinct RNA.Renew_New_Auto
            from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work RNA
            where PS.prior_policynumber_2 = RNA.policynumber),
New_Renew_Automatic_Prior_Policy_3 = 
            (select distinct RNA.Renew_New_Auto
            from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work RNA
            where PS.prior_policynumber_3 = RNA.policynumber),
New_Renew_Automatic_Prior_Policy_4 = 
            (select distinct RNA.Renew_New_Auto
            from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work RNA
            where PS.prior_policynumber_4 = RNA.policynumber),
New_Renew_Automatic_Prior_Policy_5 = 
            (select distinct RNA.Renew_New_Auto
            from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work RNA
            where PS.prior_policynumber_5 = RNA.policynumber)
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work PS




update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

' 
END
GO
