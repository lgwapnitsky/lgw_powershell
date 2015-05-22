IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AE_SPSS_Data_Step_1_View_1]'))
DROP VIEW [dbo].[AE_SPSS_Data_Step_1_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AE_SPSS_Data_Step_1_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.AE_SPSS_Data_Step_1_View_1
AS
SELECT     ISNULL(SUM(currentearnedpremium), 0) AS currentearnedpremium, ISNULL(SUM(Incurred_Loss_ALAE_with_SS_NonCat), 0) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, ISNULL(SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat), 0) 
                      AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, ISNULL(SUM(Incurred_Claims), 0) AS Incurred_Claims, Renew_New_Auto, Branch_Region, program, 
                      Written_Premium_Range, Coverage_Group, Primary_Producer, Primary_Producer_type, County_Pop_Density_Range, 
                      Clean_Warranty_Letter_Received_YN, Price_Monitor_Standard_Cov_Grp_Monitored_range, Engagement_Letters_YN, 
                      Supp_Claim_Form_Received_YN, No_Prior_Coverage_YN, Suits_For_Fees_YN, No_Qualified_Peer_Review_YN, Successful_Peer_Review_YN, 
                      Prior_Coverage_YN, Attestation_Range, Audit_Range, BookKeeping_Range, Compilation_Range, Corporate_Financial_Planning_Range, 
                      Corporate_Tax_Range, Data_Processing_Range, Individual_Tax_Range, MAS_Services_Range, Other_Assurance_Range, 
                      Personal_Financial_Planning_Range, Review_Range, SEC_Work_Range, AE_Limit_Type_Trim, AE_Revenue_Per_Accountant_Range, AE_Limit_Trim, 
                      AE_Revenues_range, AE_Program_Type, AE_Years_Prior_to_Retro, AE_Num_of_Accountants_Range, AE_Accountant_Type, statecode
FROM         dbo.AE_All_Lines_View_1
GROUP BY Renew_New_Auto, Branch_Region, program, Written_Premium_Range, Coverage_Group, Primary_Producer, Primary_Producer_type, 
                      County_Pop_Density_Range, Clean_Warranty_Letter_Received_YN, Price_Monitor_Standard_Cov_Grp_Monitored_range, Engagement_Letters_YN, 
                      Supp_Claim_Form_Received_YN, No_Prior_Coverage_YN, Suits_For_Fees_YN, No_Qualified_Peer_Review_YN, Successful_Peer_Review_YN, 
                      Prior_Coverage_YN, Attestation_Range, Audit_Range, BookKeeping_Range, Compilation_Range, Corporate_Financial_Planning_Range, 
                      Corporate_Tax_Range, Data_Processing_Range, Individual_Tax_Range, MAS_Services_Range, Other_Assurance_Range, 
                      Personal_Financial_Planning_Range, Review_Range, SEC_Work_Range, AE_Limit_Type_Trim, AE_Revenue_Per_Accountant_Range, AE_Limit_Trim, 
                      AE_Revenues_range, AE_Program_Type, AE_Years_Prior_to_Retro, AE_Num_of_Accountants_Range, AE_Accountant_Type, statecode
' 
GO
