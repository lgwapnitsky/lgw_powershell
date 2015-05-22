IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_View_1]'))
DROP VIEW [dbo].[All_Policies_All_LOB_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_All_LOB_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Policies_All_LOB_View_1
AS
SELECT     SUM(Policy_count_All_Cov_Combined) AS Policy_count_All_Cov_Combined, SUM(currentearnedpremium) AS currentearnedpremium, 
                      SUM(currentwrittenpremium) AS currentwrittenpremium, SUM(Incurred_Loss_ALAE_with_SS_NonCat) AS Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat) AS Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, 
                      SUM(Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat) AS Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, SUM(Reported_Claims) 
                      AS Reported_Claims, Coverage_Reporting_group, productcode, Coverage_Form, Primary_Producer, Primary_Producer_type, PIC_Producer, 
                      PIC_Producer_type, Commission_Premiums, Producer_Group, Fiscal_AY_Year, currentearnedpremium AS Expr1, Commission_pct, 
                      Primary_Commission_pct, PIC_Commission_pct, SUM(Incurred_Loss_ALAE_with_SS) AS Incurred_Loss_ALAE_with_SS, 
                      SUM(Ult_LDF_Incurred_Loss_ALAE_with_SS) AS Ult_LDF_Incurred_Loss_ALAE_with_SS, experienceproduct
FROM         dbo.ALL_POLICIES_premium_summary
GROUP BY Coverage_Reporting_group, productcode, Coverage_Form, Primary_Producer, Primary_Producer_type, PIC_Producer, PIC_Producer_type, 
                      Commission_Premiums, Producer_Group, Fiscal_AY_Year, currentearnedpremium, Commission_pct, Primary_Commission_pct, PIC_Commission_pct, 
                      experienceproduct
' 
GO
