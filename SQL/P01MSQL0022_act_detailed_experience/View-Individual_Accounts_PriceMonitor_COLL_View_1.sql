IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_COLL_View_1]'))
DROP VIEW [dbo].[Individual_Accounts_PriceMonitor_COLL_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_COLL_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_PriceMonitor_COLL_View_1
AS
SELECT     PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.POLICY_NUMBER, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.EFFDATE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.EXPDATE, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.STATE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.TERRITORY, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SUBLINE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.CLASS_CODE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.LOCATION, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.VEH_NUMBER, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.COVTYPE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.VEHDES, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.VEHTYP, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.PREM, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.EXP_MOD, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SCHED_MOD, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SPC_DISC_1, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SPC_DISC_2, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.AGE_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.DED_FACTOR, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.DEDUCT, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.LIMIT_PER_DAY, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.NUMBER_OF_DAYS, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ActualCostRel, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ActualCostRel2, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.StatedAmountCovFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ClassFac, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.FleetFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.PrimaryFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SecondaryFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.LCM, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.BaseRate, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.MonthFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.DumpingFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.Factor9000, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SpecVehFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.AUXIL_RUN_LAMP, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ACCIDENT_PREVENTION, 
                      dbo.Individual_Accounts_for_Reports_View_1.accountnumber, YEAR(PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.EFFDATE) 
                      AS [Policy Year]
FROM         dbo.Individual_Accounts_for_Reports_View_1 LEFT OUTER JOIN
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure ON 
                      dbo.Individual_Accounts_for_Reports_View_1.policynumber = PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.POLICY_NUMBER
GROUP BY PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.POLICY_NUMBER, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.EFFDATE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.EXPDATE, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.STATE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.TERRITORY, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SUBLINE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.CLASS_CODE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.LOCATION, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.VEH_NUMBER, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.COVTYPE, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.VEHDES, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.VEHTYP, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.PREM, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.EXP_MOD, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SCHED_MOD, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SPC_DISC_1, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SPC_DISC_2, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.AGE_FAC, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.DED_FACTOR, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.DEDUCT, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.LIMIT_PER_DAY, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.NUMBER_OF_DAYS, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ActualCostRel, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ActualCostRel2, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.StatedAmountCovFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ClassFac, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.FleetFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.PrimaryFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SecondaryFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.LCM, PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.BaseRate, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.MonthFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.DumpingFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.Factor9000, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.SpecVehFac, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.AUXIL_RUN_LAMP, 
                      PriceMonitor.dbo.AQS_DETAIL_COLL_COMBINED_test_exposure.ACCIDENT_PREVENTION, 
                      dbo.Individual_Accounts_for_Reports_View_1.accountnumber
' 
GO
