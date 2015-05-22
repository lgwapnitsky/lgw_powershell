IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CONSLIAB_Claims_Study]'))
DROP VIEW [dbo].[CONSLIAB_Claims_Study]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CONSLIAB_Claims_Study]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.CONSLIAB_Claims_Study
AS
SELECT     TOP (100) PERCENT Accident_Year, Policy_Number, Claim_Number, Claim_Desc, Premium_State, report_year, policy_year, Type_of_Loss, 
                      Type_of_Loss_Desc
FROM         dbo.ALL_POLICIES_12_Detail_Information_1_LQE
WHERE     (Product = ''CL'') AND (Claim_Desc NOT LIKE ''% ike %'')
GROUP BY Claim_Desc, Claim_Number, Accident_Year, Policy_Number, Premium_State, report_year, policy_year, Type_of_Loss, Type_of_Loss_Desc
ORDER BY Accident_Year
' 
GO
