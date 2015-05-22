IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Property_Rerating_View_for_Triangle]'))
DROP VIEW [dbo].[Property_Rerating_View_for_Triangle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Property_Rerating_View_for_Triangle]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Property_Rerating_View_for_Triangle
AS
SELECT     dbo.ALL_CLAIMS_12_Information_1_December.Claimnumber, dbo.ALL_CLAIMS_12_Information_1_December.policynumber, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Accident_Year, dbo.ALL_CLAIMS_12_Information_1_December.Accident_Month, 
                      dbo.ALL_CLAIMS_12_Information_1_December.productcode, dbo.ALL_CLAIMS_12_Information_1_December.Experienceproduct, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Coverage_Group, dbo.ALL_CLAIMS_12_Information_1_December.Coverage_Reporting_group, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_ALAE_with_SS, dbo.ALL_CLAIMS_12_Information_1_December.Claim_Incurred_Loss_Range, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Max_Incurred_Loss, dbo.ALL_CLAIMS_12_Information_1_December.Max_Incurred_Loss_Range, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_6_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_18_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_30_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_3_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_15_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_27_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_39_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_51_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_63_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_75_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_87_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_99_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_111_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_12_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_24_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_36_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_48_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_60_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_72_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_84_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_96_months, dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_108_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Incurred_Loss_120_months, dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_3_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_15_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_27_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_39_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_51_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_63_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_75_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_87_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_99_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_111_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_12_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_24_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_36_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_48_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_60_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_72_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_84_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_96_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_108_months, 
                      dbo.ALL_CLAIMS_12_Information_1_December.Capped_Incurred_Loss_120_months, AccessPHLYEOM.dbo.claimsummary.coveragecode, 
                      AccessPHLYEOM.dbo.claimsummary.statecode
FROM         dbo.ALL_CLAIMS_12_Information_1_December LEFT OUTER JOIN
                      AccessPHLYEOM.dbo.claimsummary ON dbo.ALL_CLAIMS_12_Information_1_December.productcode = AccessPHLYEOM.dbo.claimsummary.productcode AND 
                      dbo.ALL_CLAIMS_12_Information_1_December.policynumber = AccessPHLYEOM.dbo.claimsummary.policynumber AND 
                      dbo.ALL_CLAIMS_12_Information_1_December.Claimnumber = AccessPHLYEOM.dbo.claimsummary.claimnumber
' 
GO
