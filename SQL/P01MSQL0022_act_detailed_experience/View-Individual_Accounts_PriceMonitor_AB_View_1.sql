IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_AB_View_1]'))
DROP VIEW [dbo].[Individual_Accounts_PriceMonitor_AB_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_AB_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_PriceMonitor_AB_View_1
AS
SELECT     PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.POLICY_NUMBER, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EFFDATE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EXPDATE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.STATE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.TERRITORY, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.SUBLINE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.CLASS_CODE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.LOCATION, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BUILDING, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.OCCUPANCY, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.COVNUM, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.SUBCOVNUM, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BLANKET, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PRLNUM, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PREM, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EXPOSURE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BGI_CONSTR_CODE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BG2_CONSTR_SYMBOL, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.RATING_TYPE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PROTECT_CLASS, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.RISK_TYPE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.DEDUCT, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.COINS_PERCENT, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PREM_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EXP_MOD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IND_RATE_MOD, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.SCHED_MOD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.DED_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.COINS_FAC, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.AGREED_AMOUNT, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.REPLACEMENT_COST, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.INFLATION_GUARD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.LOSS_COST, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IRM006, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IRM007, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IRM008, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.LCM, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PACK_MOD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.RATE_MOD_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BCEG_FAC, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.NOTCOI_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.MODIFIED_RATE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.zip, 
                      dbo.Individual_Accounts_for_Reports_View_1.accountnumber, YEAR(PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EFFDATE) 
                      AS [Policy Year]
FROM         dbo.Individual_Accounts_for_Reports_View_1 LEFT OUTER JOIN
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure ON 
                      dbo.Individual_Accounts_for_Reports_View_1.policynumber = PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.POLICY_NUMBER
GROUP BY PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.POLICY_NUMBER, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EFFDATE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EXPDATE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.STATE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.TERRITORY, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.SUBLINE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.CLASS_CODE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.LOCATION, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BUILDING, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.OCCUPANCY, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.COVNUM, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.SUBCOVNUM, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BLANKET, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PRLNUM, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PREM, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EXPOSURE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BGI_CONSTR_CODE, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BG2_CONSTR_SYMBOL, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.RATING_TYPE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PROTECT_CLASS, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.RISK_TYPE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.DEDUCT, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.COINS_PERCENT, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PREM_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.EXP_MOD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IND_RATE_MOD, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.SCHED_MOD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.DED_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.COINS_FAC, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.AGREED_AMOUNT, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.REPLACEMENT_COST, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.INFLATION_GUARD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.LOSS_COST, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IRM006, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IRM007, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.IRM008, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.LCM, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.PACK_MOD, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.RATE_MOD_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.BCEG_FAC, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.NOTCOI_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.MODIFIED_RATE, PriceMonitor.dbo.AQS_DETAIL_AB_PRP_test_exposure.zip, 
                      dbo.Individual_Accounts_for_Reports_View_1.accountnumber
' 
GO
