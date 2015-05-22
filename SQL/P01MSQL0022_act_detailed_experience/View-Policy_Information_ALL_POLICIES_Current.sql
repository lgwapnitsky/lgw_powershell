IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_Current]'))
DROP VIEW [dbo].[Policy_Information_ALL_POLICIES_Current]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_Current]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[Policy_Information_ALL_POLICIES_Current] WITH SCHEMABINDING as 
select accountnumber,
	   Productcode,
	   policynumber,
	   policyEffectivedate,
       Renew_New_Auto, 
       written_premium_policy, 
       Written_Premium_Range from dbo.Policy_Information_ALL_POLICIES_June' 
GO
