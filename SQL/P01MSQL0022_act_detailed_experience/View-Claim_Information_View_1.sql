IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Information_View_1]'))
DROP VIEW [dbo].[Claim_Information_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Information_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Claim_Information_View_1
AS
SELECT     AccessPhlyEom.dbo.claimtransaction.transnumber, AccessPhlyEom.dbo.claimtransaction.transtypecode, 
                      AccessPhlyEom.dbo.claimtransaction.claimnumber, AccessPhlyEom.dbo.claimtransaction.claimantseq, 
                      AccessPhlyEom.dbo.claimtransaction.policytypecode, AccessPhlyEom.dbo.claimtransaction.losstypecode, 
                      AccessPhlyEom.dbo.claimtransaction.idmdccanoind, AccessPhlyEom.dbo.claimtransaction.acctngyear, 
                      AccessPhlyEom.dbo.claimtransaction.acctngmonth, AccessPhlyEom.dbo.claimtransaction.transamt, AccessPhlyEom.dbo.claimtransaction.dcind, 
                      AccessPhlyEom.dbo.claimtransaction.transdate, AccessPhlyEom.dbo.claim.lossdate, AccessPhlyEom.dbo.claim.claimcompanycode, 
                      AccessPhlyEom.dbo.claim.claimreportdate, AccessPhlyEom.dbo.claim.CAT_EventID, AccessPhlyEom.dbo.claim.examinerpid, 
                      AccessPhlyEom.dbo.GBLemployee.firstname, AccessPhlyEom.dbo.GBLemployee.lastname, AccessPhlyEom.dbo.GBLemployee.department, 
                      AccessPhlyEom.dbo.GBLemployee.active, AccessPhlyEom.dbo.policycoverage.coveragecode, AccessPhlyEom.dbo.coverage.coveragedesc, 
                      AccessPhlyEom.dbo.coverage.associationcode, AccessPhlyEom.dbo.LossTransAmtSign.numericsignmultiplier, 
                      AccessPhlyEom.dbo.claim.losscauseid, AccessPhlyEom.dbo.claimloss.ltgind, AccessPhlyEom.dbo.policycoverage.statecode, 
                      AccessPhlyEom.dbo.claim.accidentstatecode, AccessPhlyEom.dbo.GBLemployee.jobtitle, AccessPhlyEom.dbo.CAT_Event.CAT_Number, 
                      AccessPhlyEom.dbo.claim.claimproductcode, AccessPhlyEom.dbo.claimloss.losssubtypecode, AccessPhlyEom.dbo.claimloss.losstypecode AS Expr1, 
                      AccessPhlyEom.dbo.losstype.losstypedesc, AccessPhlyEom.dbo.losssubtype.losssubtypedesc, AccessPhlyEom.dbo.losscause.losscausedesc
FROM         AccessPhlyEom.dbo.coverage RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.policycoverage ON 
                      AccessPhlyEom.dbo.coverage.coveragecode = AccessPhlyEom.dbo.policycoverage.coveragecode RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.losssubtype INNER JOIN
                      AccessPhlyEom.dbo.losstype INNER JOIN
                      AccessPhlyEom.dbo.claimloss ON AccessPhlyEom.dbo.losstype.policytypecode = AccessPhlyEom.dbo.claimloss.policytypecode AND 
                      AccessPhlyEom.dbo.losstype.losstypecode = AccessPhlyEom.dbo.claimloss.losstypecode ON 
                      AccessPhlyEom.dbo.losssubtype.policytypecode = AccessPhlyEom.dbo.losstype.policytypecode AND 
                      AccessPhlyEom.dbo.losssubtype.losstypecode = AccessPhlyEom.dbo.losstype.losstypecode AND 
                      AccessPhlyEom.dbo.losssubtype.policytypecode = AccessPhlyEom.dbo.claimloss.policytypecode AND 
                      AccessPhlyEom.dbo.losssubtype.losstypecode = AccessPhlyEom.dbo.claimloss.losstypecode AND 
                      AccessPhlyEom.dbo.losssubtype.losssubtypecode = AccessPhlyEom.dbo.claimloss.losssubtypecode ON 
                      AccessPhlyEom.dbo.policycoverage.policycoverageid = AccessPhlyEom.dbo.claimloss.policycoverageid RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.LossTransAmtSign RIGHT OUTER JOIN
                      AccessPhlyEom.dbo.claimtransaction ON 
                      AccessPhlyEom.dbo.LossTransAmtSign.transtypecode = AccessPhlyEom.dbo.claimtransaction.transtypecode AND 
                      AccessPhlyEom.dbo.LossTransAmtSign.dcind = AccessPhlyEom.dbo.claimtransaction.dcind ON 
                      AccessPhlyEom.dbo.claimloss.claimnumber = AccessPhlyEom.dbo.claimtransaction.claimnumber AND 
                      AccessPhlyEom.dbo.claimloss.claimantseq = AccessPhlyEom.dbo.claimtransaction.claimantseq AND 
                      AccessPhlyEom.dbo.claimloss.policytypecode = AccessPhlyEom.dbo.claimtransaction.policytypecode AND 
                      AccessPhlyEom.dbo.claimloss.losstypecode = AccessPhlyEom.dbo.claimtransaction.losstypecode LEFT OUTER JOIN
                      AccessPhlyEom.dbo.CAT_Event INNER JOIN
                      AccessPhlyEom.dbo.claim ON AccessPhlyEom.dbo.CAT_Event.ID = AccessPhlyEom.dbo.claim.CAT_EventID INNER JOIN
                      AccessPhlyEom.dbo.losscause ON AccessPhlyEom.dbo.claim.losscauseid = AccessPhlyEom.dbo.losscause.losscauseid LEFT OUTER JOIN
                      AccessPhlyEom.dbo.GBLemployee ON AccessPhlyEom.dbo.claim.examinerpid = AccessPhlyEom.dbo.GBLemployee.personid ON 
                      AccessPhlyEom.dbo.claimtransaction.claimnumber = AccessPhlyEom.dbo.claim.claimnumber
WHERE     (AccessPhlyEom.dbo.claimtransaction.transdate > CONVERT(DATETIME, ''2004-12-31 00:00:00'', 102))
' 
GO
