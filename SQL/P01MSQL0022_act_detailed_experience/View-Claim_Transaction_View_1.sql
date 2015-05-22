IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Transaction_View_1]'))
DROP VIEW [dbo].[Claim_Transaction_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Transaction_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Claim_Transaction_View_1
AS
SELECT     AccessPhlyEom.dbo.claimtransaction.transnumber, AccessPhlyEom.dbo.claimtransaction.transtypecode, 
                      AccessPhlyEom.dbo.claimtransaction.claimnumber, AccessPhlyEom.dbo.claimtransaction.claimantseq, 
                      AccessPhlyEom.dbo.claimtransaction.policytypecode, AccessPhlyEom.dbo.claimtransaction.losstypecode, 
                      AccessPhlyEom.dbo.claimtransaction.idmdccanoind, AccessPhlyEom.dbo.claimtransaction.acctngyear, 
                      AccessPhlyEom.dbo.claimtransaction.acctngmonth, AccessPhlyEom.dbo.claimtransaction.transamt, AccessPhlyEom.dbo.claimtransaction.dcind, 
                      AccessPhlyEom.dbo.claimtransaction.transdate, AccessPhlyEom.dbo.claim.lossdate, AccessPhlyEom.dbo.claim.claimcompanycode, 
                      AccessPhlyEom.dbo.claim.claimreportdate, AccessPhlyEom.dbo.claim.CAT_EventID, AccessPhlyEom.dbo.claim.examinerpid, 
                      AccessPhlyEom.dbo.policycoverage.coveragecode, AccessPhlyEom.dbo.LossTransAmtSign.numericsignmultiplier, 
                      AccessPhlyEom.dbo.claim.losscauseid, AccessPhlyEom.dbo.claimloss.ltgind, AccessPhlyEom.dbo.policycoverage.statecode, 
                      AccessPhlyEom.dbo.claim.accidentstatecode, AccessPhlyEom.dbo.claimloss.losssubtypecode, AccessPhlyEom.dbo.transtype.transtypedesc, 
                      AccessPhlyEom.dbo.transtype.transtypecat, AccessPhlyEom.dbo.claimtransaction.riskcode, AccessPhlyEom.dbo.claim.policynumber, 
                      AccessPhlyEom.dbo.claim.accountnumber, 
                      AccessPhlyEom.dbo.claimtransaction.transamt * AccessPhlyEom.dbo.LossTransAmtSign.numericsignmultiplier AS transamtsigned, 
                      Act_Definitions.dbo.Transtypegroup.TranstypeGroup, AccessPhlyEom.dbo.policy.companycode, AccessPhlyEom.dbo.policy.effectivedate, 
                      AccessPhlyEom.dbo.policy.productcode, AccessPhlyEom.dbo.policy.BusinessClassID, AccessPhlyEom.dbo.policy.programcode, 
                      YEAR(AccessPhlyEom.dbo.policycoverage.effectivedate) * 100 + MONTH(AccessPhlyEom.dbo.policycoverage.effectivedate) AS EffectiveYearMonth, 
                      YEAR(AccessPhlyEom.dbo.policycoverage.effectivedate) AS EffectiveYear
FROM         AccessPhlyEom.dbo.policycoverage RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.claimloss ON 
                      AccessPhlyEom.dbo.policycoverage.policycoverageid = AccessPhlyEom.dbo.claimloss.policycoverageid RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.LossTransAmtSign RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.transtype LEFT OUTER JOIN
                      Act_Definitions.dbo.Transtypegroup ON 
                      AccessPhlyEom.dbo.transtype.transtypecode = Act_Definitions.dbo.Transtypegroup.transtypecode RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.claimtransaction ON AccessPhlyEom.dbo.transtype.transtypecode = AccessPhlyEom.dbo.claimtransaction.transtypecode ON 
                      AccessPhlyEom.dbo.LossTransAmtSign.transtypecode = AccessPhlyEom.dbo.claimtransaction.transtypecode AND 
                      AccessPhlyEom.dbo.LossTransAmtSign.dcind = AccessPhlyEom.dbo.claimtransaction.dcind ON 
                      AccessPhlyEom.dbo.claimloss.claimnumber = AccessPhlyEom.dbo.claimtransaction.claimnumber AND 
                      AccessPhlyEom.dbo.claimloss.claimantseq = AccessPhlyEom.dbo.claimtransaction.claimantseq AND 
                      AccessPhlyEom.dbo.claimloss.policytypecode = AccessPhlyEom.dbo.claimtransaction.policytypecode AND 
                      AccessPhlyEom.dbo.claimloss.losstypecode = AccessPhlyEom.dbo.claimtransaction.losstypecode LEFT OUTER JOIN
                      AccessPhlyEom.dbo.claim LEFT OUTER JOIN
                      AccessPhlyEom.dbo.policy ON AccessPhlyEom.dbo.claim.policynumber = AccessPhlyEom.dbo.policy.policynumber ON 
                      AccessPhlyEom.dbo.claimtransaction.claimnumber = AccessPhlyEom.dbo.claim.claimnumber
GROUP BY AccessPhlyEom.dbo.claimtransaction.transnumber, AccessPhlyEom.dbo.claimtransaction.transtypecode, 
                      AccessPhlyEom.dbo.claimtransaction.claimnumber, AccessPhlyEom.dbo.claimtransaction.claimantseq, 
                      AccessPhlyEom.dbo.claimtransaction.policytypecode, AccessPhlyEom.dbo.claimtransaction.losstypecode, 
                      AccessPhlyEom.dbo.claimtransaction.idmdccanoind, AccessPhlyEom.dbo.claimtransaction.acctngyear, 
                      AccessPhlyEom.dbo.claimtransaction.acctngmonth, AccessPhlyEom.dbo.claimtransaction.transamt, AccessPhlyEom.dbo.claimtransaction.dcind, 
                      AccessPhlyEom.dbo.claimtransaction.transdate, AccessPhlyEom.dbo.claim.lossdate, AccessPhlyEom.dbo.claim.claimcompanycode, 
                      AccessPhlyEom.dbo.claim.claimreportdate, AccessPhlyEom.dbo.claim.CAT_EventID, AccessPhlyEom.dbo.claim.examinerpid, 
                      AccessPhlyEom.dbo.policycoverage.coveragecode, AccessPhlyEom.dbo.LossTransAmtSign.numericsignmultiplier, 
                      AccessPhlyEom.dbo.claim.losscauseid, AccessPhlyEom.dbo.claimloss.ltgind, AccessPhlyEom.dbo.policycoverage.statecode, 
                      AccessPhlyEom.dbo.claim.accidentstatecode, AccessPhlyEom.dbo.claimloss.losssubtypecode, AccessPhlyEom.dbo.transtype.transtypedesc, 
                      AccessPhlyEom.dbo.transtype.transtypecat, AccessPhlyEom.dbo.claimtransaction.riskcode, AccessPhlyEom.dbo.claim.policynumber, 
                      AccessPhlyEom.dbo.claim.accountnumber, 
                      AccessPhlyEom.dbo.claimtransaction.transamt * AccessPhlyEom.dbo.LossTransAmtSign.numericsignmultiplier, 
                      Act_Definitions.dbo.Transtypegroup.TranstypeGroup, AccessPhlyEom.dbo.policy.companycode, AccessPhlyEom.dbo.policy.effectivedate, 
                      AccessPhlyEom.dbo.policy.productcode, AccessPhlyEom.dbo.policy.BusinessClassID, AccessPhlyEom.dbo.policy.programcode, 
                      YEAR(AccessPhlyEom.dbo.policycoverage.effectivedate) * 100 + MONTH(AccessPhlyEom.dbo.policycoverage.effectivedate), 
                      YEAR(AccessPhlyEom.dbo.policycoverage.effectivedate)
HAVING      (AccessPhlyEom.dbo.claimtransaction.transdate > CONVERT(DATETIME, ''2004-12-31 00:00:00'', 102)) AND 
                      (NOT (AccessPhlyEom.dbo.claimtransaction.transtypecode IN (''ou'', ''mu'', ''nu'', ''ma'', ''na'', ''oa'', ''ra'', ''ru'', ''sfa'', ''sfu'')))
' 
GO
