IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_NY_GL_View1]'))
DROP VIEW [dbo].[State_NY_GL_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[State_NY_GL_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.State_NY_GL_View1
AS
SELECT     statecode, SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(currentearnedpremium) AS currentearnedpremium, 
                      SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(Incurred_Loss_ALAE_with_SS_NonCat) 
                      AS Incurred_Loss_ALAE_with_SS_NonCat, SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Coverage_Reporting_group, productcode, Fiscal_AY_Year, SUM(Policy_count_Reporting_Coverage) 
                      AS Policy_count_Reporting_Coverage, product_group, New_Renew_Tail, Renew_New_Auto, GL_Territory_Dominant_percent, 
                      GL_Dom_Terr_description, GL_Dom_Region_in_State, GL_Territory_Dominant, Branch_Region, Written_Premium_Range, 
                      Experience_Product_Group
FROM         dbo.NY_GL_premium_summary
GROUP BY statecode, Coverage_Reporting_group, productcode, Fiscal_AY_Year, product_group, New_Renew_Tail, Renew_New_Auto, 
                      GL_Territory_Dominant_percent, GL_Dom_Terr_description, GL_Dom_Region_in_State, GL_Territory_Dominant, Branch_Region, 
                      Written_Premium_Range, Experience_Product_Group
HAVING      (productcode <> ''AE'') AND (Experience_Product_Group <> ''Umbrella'')
' 
GO
