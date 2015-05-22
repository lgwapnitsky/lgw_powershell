IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_All_Lines_View_1]'))
DROP VIEW [dbo].[HC_All_Lines_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_All_Lines_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HC_All_Lines_View_1
AS
SELECT     statecode, Coverage_Reporting_group, productcode, Fiscal_AY_Year, currentwrittenpremium, currentearnedpremium, Policy_count_Reporting_Coverage, 
                      Incurred_Loss_ALAE_with_SS_NonCat, Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, COL_GLBI_Malpractice_Count, COL_GLBI_Malpractice_Loss, 
                      COL_GLBI_Fraud_Breach_of_Contract_Count, COL_GLBI_Fraud_Breach_of_Contract_Loss, COL_GLBI_Injury_Count, COL_GLBI_Injury_Loss, COL_GLBI_Other_Count, 
                      COL_GLBI_Other_Loss, COL_GLBI_Sexual_Assault_Molest_Abuse_Count, COL_GLBI_Sexual_Assault_Molest_Abuse_Loss, COL_GLBI_PropertyDamage_Loss, 
                      COL_GLBI_PropertyDamage_Count, COL_GLBI_Theft_Loss, COL_GLBI_Theft_Count, COL_GLBI_SlanderDefamtion_Loss, COL_GLBI_SlanderDefamtion_Count, 
                      COL_GLBI_Discrim_WrongfulTermination_Loss, COL_GLBI_Discrim_WrongfulTermination_Count, Incurred_Claims, Commission_dollars, Commission_Premiums, 
                      New_Renew_Tail, Renew_New_Auto, Branch_Region, Coverage_Group, Primary_Umbrella, Earned_Buildings, Earned_Locations, Earned_TIV, Primary_Producer, 
                      Policy_count_All_Cov_Combined, Account_UltLoss_Ratio_Working_Cover_Range, Account_RepLoss_Ratio_Working_Cover_Range, Policy_count_Coverage_Group, 
                      Primary_Producer_type, Incurred_Loss_ALAE_with_SS, Capped_Incurred_Loss_ALAE_with_SS, Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, Endorsement_GLDX_YN, policynumber, Coverage_Form, COL_Prop_Wind_Hail_Count, COL_Prop_Wind_Hail_Loss, 
                      COL_Prop_Water_Other_Loss, COL_Prop_Water_Other_Count, COL_Prop_Water_Sprinkler_Loss, COL_Prop_Water_Sprinkler_Count, COL_Prop_Theft_Van_Loss, 
                      COL_Prop_Theft_Van_Count, COL_Prop_Fire_Lightning_Explosion_Loss, COL_Prop_Fire_Lightning_Explosion_Count, COL_Prop_Other_Loss, 
                      COL_Prop_Other_Count, Endorsement_Elite_YN, Incurred_Loss_ALAE_with_SS_CatOnly, First_Policy_Year, PIC_Producer, underwriter, Fiscal_AY_Month_Ending, 
                      Last_Reporting_Year, Last_Reporting_Month, Account_UltLoss_Ratio, Account_UltLoss_Ratio_NonCat, Account_RepLoss_Ratio, Account_RepLoss_Ratio_NonCat, 
                      Account_RepLoss_Ratio_NonCat_priorpolperiods_Range, Account_RepLoss_Ratio_priorpolperiods_Range, Renewals_Range, Branch_Office, Endorsement_HS_004, 
                      productdesc, prodmixname, ProductTypeName, reportmixname, accountname, Account_Name, CompanyCode, Product_group, NewRenewalAuto, effectiveYearMonth, 
                      effectiveYear, effectiveMonth, expirationMonth, expirationYear, expirationYearMonth, Insd_State, Insd_City, Insd_Zip, underwriterName, regiondesc, programdesc, 
                      program, Written_Premium_Range, Number_of_Renewals, PICProducer, PrimaryProducer, PrimaryProducerType, Account_Premium_Range, DivisionName, 
                      producttype, PrimaryProducerNumber, effectivedate, expirationdate, Insured_Years_Range, SLD_BusinessType, Incurred_Loss_ALAE_without_SS_NonCat, 
                      accountnumber, Source_Detail_Name, BusinessClassDesc, COL_Breach_of_Contract_Count, COL_Breach_of_Contract_Loss, COL_Discrimination_Count, 
                      COL_Discrimination_Loss, COL_Wrongful_Termination_Count, COL_Wrongful_Termination_Loss, COL_Harrassment_Count, COL_Harrassment_Loss, 
                      COL_DO_Other_Count, COL_DO_Other_Loss, COL_EPL_Other_Count, COL_EPL_Other_Loss, COL_Fiduciary_Other_Count, COL_Fiduciary_Other_Loss, 
                      COL_Worplace_Violence_Other_Count, COL_Worplace_Violence_Other_Loss, COL_SLD_All_Other_Count, COL_SLD_All_Other_Loss, County_Pop_Density_Range, 
                      acctngyear, GL_Dom_Region_in_State, Price_Monitor_Standard_CovGrp_GL_Monitored_range, Price_Monitor_Standard_Cov_Grp_Monitored_range, 
                      Endorsement_CG0001
FROM         dbo.Latest_All_Lines_View_1
WHERE     (productcode = ''HC'') AND (Fiscal_AY_Year > 2007) AND (PrimaryProducerNumber = 16543)
' 
GO
