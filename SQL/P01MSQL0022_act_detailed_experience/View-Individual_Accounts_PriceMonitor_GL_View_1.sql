IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_GL_View_1]'))
DROP VIEW [dbo].[Individual_Accounts_PriceMonitor_GL_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Individual_Accounts_PriceMonitor_GL_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Individual_Accounts_PriceMonitor_GL_View_1
AS
SELECT     dbo.Policy_PATHID_Information.accountnumber, dbo.Policy_PATHID_Information.accountname, dbo.Policy_PATHID_Information.regioncode, 
                      dbo.Policy_PATHID_Information.regiondesc, dbo.Policy_PATHID_Information.PICProducer, dbo.Policy_PATHID_Information.PrimaryProducer, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PolicySnapshotID, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PolicyNumber, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.SourceSystemPolicyKey, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PriorPolicyNumber, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.SnapShotType, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PolicyEffectiveDate, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PolicyExpirationDate, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PolicyState, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.Product, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.SIC, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PackageOrMonoline, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PrimaryCommissionPct, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PICCommissionPct, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.InsurableID, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PriorInsurableID, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PriorInsurableIDMatchType, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.CoverageCode, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.Territory, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.RiskType, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LLMTIDX, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.Exposure, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ExposureAdjustmentFactor, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ExposureBase, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ExposureAdjustmentType, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.Premium, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PremiumState, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.Subline, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ClassCode, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ClassDescription, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.AggregateLimit, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.OccuranceLimit, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.Deductible, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.CombinedDeductibleIndicator, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.InsurableEffectiveDate, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.InsurableExpirationDate, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LocationAddress1, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LocationAddress2, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LocationCity, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LocationState, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LocationZIP, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.AQSStateSequence, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.AQSLocationSequence, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.AQSBuildingSequence, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.AQSSublineSequence, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.AQSClassSequence, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.IssuanceDateTime, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PremiumOverride, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PremiumProxy, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ExposureProxy, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.SourceSystemKeyValue, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ClaimsMadeOrOccurance, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.RetroActiveDate, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.GrossSales, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PolicyTerm, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PremiumTerm, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.DedFactor, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.FringeExcl, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.StandardCombinedMod, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ExperienceMod, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.IRPM2, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ScheduleMod, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.SOPC, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ExpenseMod, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.MiscMod, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ILF, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ILF_OverRide, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LossCost, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LCM, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PackMod, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.RMF, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.BIDedFactor_Override, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.FinalBaseRate, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.LossCost_Override, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PackMod_Override, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ClaimsMadeFac, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.ClaimsMadeFac_Override, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.FringeExclusion, PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.BIDedFactor, 
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PDDedFactor
FROM         dbo.Policy_PATHID_Information LEFT OUTER JOIN
                      PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA ON 
                      dbo.Policy_PATHID_Information.policynumber = PriceMonitorSystem.dbo.PriceMonitorBaseDataLIA.PolicyNumber INNER JOIN
                      dbo.Individual_Accounts_for_Reports_View_2 ON dbo.Policy_PATHID_Information.accountnumber = dbo.Individual_Accounts_for_Reports_View_2.accountnumber
' 
GO
