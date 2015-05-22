IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_APPS_PremiumSummary_View_1]'))
DROP VIEW [dbo].[Individual_Accounts_APPS_PremiumSummary_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_APPS_PremiumSummary_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_APPS_PremiumSummary_View_1
AS
SELECT     AccessPhlyEom.dbo.premiumsummary.accountnumber, AccessPhlyEom.dbo.premiumsummary.policynumber, 
                      AccessPhlyEom.dbo.premiumsummary.policyeffectiveyear, AccessPhlyEom.dbo.premiumsummary.companycode, 
                      AccessPhlyEom.dbo.premiumsummary.productcode, AccessPhlyEom.dbo.premiumsummary.insuredaddrid, 
                      AccessPhlyEom.dbo.premiumsummary.accountaddrid, AccessPhlyEom.dbo.premiumsummary.raterpid, 
                      AccessPhlyEom.dbo.premiumsummary.underwriterpid, AccessPhlyEom.dbo.premiumsummary.brokerageind, 
                      AccessPhlyEom.dbo.premiumsummary.policyeffectivedate, AccessPhlyEom.dbo.premiumsummary.policyexpirationdate, 
                      AccessPhlyEom.dbo.premiumsummary.policycanceldate, AccessPhlyEom.dbo.premiumsummary.policycanceltypecode, 
                      AccessPhlyEom.dbo.premiumsummary.policycancelreasoncode, AccessPhlyEom.dbo.premiumsummary.policystatus, 
                      AccessPhlyEom.dbo.premiumsummary.aslobcode, AccessPhlyEom.dbo.premiumsummary.sublinecode, 
                      AccessPhlyEom.dbo.premiumsummary.classcode, AccessPhlyEom.dbo.premiumsummary.statecode, AccessPhlyEom.dbo.premiumsummary.territory, 
                      AccessPhlyEom.dbo.premiumsummary.coveragecode, AccessPhlyEom.dbo.premiumsummary.acctngyear, 
                      AccessPhlyEom.dbo.premiumsummary.acctngmonth, AccessPhlyEom.dbo.premiumsummary.premiumeffectivedate, 
                      AccessPhlyEom.dbo.premiumsummary.premiumexpirationdate, AccessPhlyEom.dbo.premiumsummary.currentwrittenpremium, 
                      AccessPhlyEom.dbo.premiumsummary.currentearnedpremium, AccessPhlyEom.dbo.premiumsummary.totalwrittenpremium, 
                      AccessPhlyEom.dbo.premiumsummary.totalearnedpremium, AccessPhlyEom.dbo.premiumsummary.createdate, 
                      AccessPhlyEom.dbo.premiumsummary.createpid, AccessPhlyEom.dbo.premiumsummary.createdelegatepid, 
                      AccessPhlyEom.dbo.premiumsummary.updatedate, AccessPhlyEom.dbo.premiumsummary.updatepid, 
                      AccessPhlyEom.dbo.premiumsummary.updatedelegatepid, AccessPhlyEom.dbo.premiumsummary.fullyearnedind
FROM         dbo.Individual_Accounts_for_Reports_View_1 LEFT OUTER JOIN
                      AccessPhlyEom.dbo.premiumsummary ON 
                      dbo.Individual_Accounts_for_Reports_View_1.policynumber = AccessPhlyEom.dbo.premiumsummary.policynumber
WHERE     (AccessPhlyEom.dbo.premiumsummary.currentwrittenpremium <> 0)
' 
GO
