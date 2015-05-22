IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_Auto_Loss_View1]'))
DROP VIEW [dbo].[All_Policies_Auto_Loss_View1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[All_Policies_Auto_Loss_View1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.All_Policies_Auto_Loss_View1
AS
SELECT     dbo.ALL_POLICIES_12_Detail_Information_1_B.Accountnumber, dbo.ALL_POLICIES_12_Detail_Information_1_B.Policy_Number, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Claim_Number, dbo.ALL_POLICIES_12_Detail_Information_1_B.Product, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Premium_State, dbo.ALL_POLICIES_12_Detail_Information_1_B.Coverage_Reporting_group, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Coverage_Form, dbo.ALL_POLICIES_12_Detail_Information_1_B.Accident_Year, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Fiscal_AY_Year, dbo.ALL_POLICIES_12_Detail_Information_1_B.Type_of_Loss_Desc, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Claim_Desc, dbo.ALL_POLICIES_12_Detail_Information_1_B.Case_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Case_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_B.Paid_Loss, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Paid_ALAE, dbo.ALL_POLICIES_12_Detail_Information_1_B.Sal_Subro, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Incurred_Loss_ALAE_with_SS, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Incurred_Loss_ALAE_with_SS_NonCat, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Reported_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_B.Open_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Closed_With_Pay_Claims, 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Closed_Without_Pay_Claims, dbo.ALL_POLICIES_12_Detail_Information_1_B.Incurred_Claims, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Occurrence_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.GL_Deductible, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_OCC_Limit, dbo.Policy_Information_ALL_POLICIES_GL_B.GLDX_Indicator, 
                      dbo.Policy_Information_ALL_POLICIES_GL_B.SAM_Form_Group, dbo.Policy_Information_ALL_POLICIES_B.Account_Premium_range, 
                      dbo.Policy_Information_ALL_POLICIES_B.Primary_Umbrella, dbo.Policy_Information_ALL_POLICIES_B.Written_Premium_Range, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Driving_School, dbo.Policy_Information_ALL_POLICIES_AUTO_B.Hired_Auto, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Non_Owned_Auto
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_B INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES_GL_B ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Policy_Number = dbo.Policy_Information_ALL_POLICIES_GL_B.policynumber INNER JOIN
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Policy_Number = dbo.Policy_Information_ALL_POLICIES_AUTO_B.policynumber LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.ALL_POLICIES_12_Detail_Information_1_B.Policy_Number = dbo.Policy_Information_ALL_POLICIES_B.policynumber
WHERE     (dbo.ALL_POLICIES_12_Detail_Information_1_B.Closed_Without_Pay_Claims = 0)
' 
GO
