IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AE_All_Lines_View_1_DNB]'))
DROP VIEW [dbo].[AE_All_Lines_View_1_DNB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AE_All_Lines_View_1_DNB]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.AE_All_Lines_View_1_DNB
AS
SELECT     dbo.AE_All_Lines_View_1.*, Act_Pricing.dbo.DNB_Mar2011_Final.DUNS_NUMBER, Act_Pricing.dbo.DNB_Mar2011_Final.CRATING, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.ORATING, Act_Pricing.dbo.DNB_Mar2011_Final.COND_IND, Act_Pricing.dbo.DNB_Mar2011_Final.BASECAT, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FINANCE, Act_Pricing.dbo.DNB_Mar2011_Final.CRIMINAL, Act_Pricing.dbo.DNB_Mar2011_Final.SUB_IND, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.TOTEMPL, Act_Pricing.dbo.DNB_Mar2011_Final.EMPLHERE, Act_Pricing.dbo.DNB_Mar2011_Final.SALES, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.NETWORTH, Act_Pricing.dbo.DNB_Mar2011_Final.INQCS, Act_Pricing.dbo.DNB_Mar2011_Final.INQREG, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.HICDTAVG, Act_Pricing.dbo.DNB_Mar2011_Final.HICDTMAX, Act_Pricing.dbo.DNB_Mar2011_Final.NPAYEXP, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.PAYEXP_S, Act_Pricing.dbo.DNB_Mar2011_Final.PAYEXP_N, Act_Pricing.dbo.DNB_Mar2011_Final.PEXP_S_N, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.AMT_PDUE, Act_Pricing.dbo.DNB_Mar2011_Final.NBR_PDUE, Act_Pricing.dbo.DNB_Mar2011_Final.AMTDUE30, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.COMPTYPE, Act_Pricing.dbo.DNB_Mar2011_Final.OWNS_IND, Act_Pricing.dbo.DNB_Mar2011_Final.RENT_IND, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.OPRESIND, Act_Pricing.dbo.DNB_Mar2011_Final.BNKRPT, Act_Pricing.dbo.DNB_Mar2011_Final.DBT_IND, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.LIENS, Act_Pricing.dbo.DNB_Mar2011_Final.SUITS, Act_Pricing.dbo.DNB_Mar2011_Final.JUDGMNTS, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.UCCFILNG, Act_Pricing.dbo.DNB_Mar2011_Final.CSCORE_GMODEL7, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.CPCT_GMODEL7, Act_Pricing.dbo.DNB_Mar2011_Final.CPOINTS_GMODEL7, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FSCORE_GMODEL7, Act_Pricing.dbo.DNB_Mar2011_Final.FPCT_GMODEL7, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FSPOINTS_GMODEL7, Act_Pricing.dbo.DNB_Mar2011_Final.BD_IND, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.LOC_IND, Act_Pricing.dbo.DNB_Mar2011_Final.CORPTYPE, Act_Pricing.dbo.DNB_Mar2011_Final.DLIENS, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.DJUDGMNT, Act_Pricing.dbo.DNB_Mar2011_Final.DSUITS, 
                      Act_Pricing.dbo.DNB_Mar2011_Final.FBASEDAT
FROM         dbo.AE_All_Lines_View_1 LEFT OUTER JOIN
                      Act_Pricing.dbo.DNB_Mar2011_Final ON dbo.AE_All_Lines_View_1.policy_effective_year = Act_Pricing.dbo.DNB_Mar2011_Final.POLICY_YEAR AND 
                      dbo.AE_All_Lines_View_1.accountnumber = Act_Pricing.dbo.DNB_Mar2011_Final.ACCOUNT_NUMBER
' 
GO
