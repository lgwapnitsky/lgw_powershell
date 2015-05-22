IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FT_Organization_RapidSure]'))
DROP VIEW [dbo].[FT_Organization_RapidSure]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FT_Organization_RapidSure]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.FT_Organization_RapidSure
AS
SELECT DISTINCT
PolicyNumber,
Organization,
IDEAMemberInd,
CertificationType
FROM Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_February p
LEFT JOIN Rapidsure.dbo.PolicyRecord r
ON substring(Policynumber,1,10) = FullPolicyNum
and productcode = ''FT''
LEFT JOIN Rapidsure.dbo.PolicyModules m
ON m.PolicyRecordSK = r.PolicyRecordSK
LEFT JOIN Rapidsure.dbo.GLLOBModule g
ON g.PolicyModulesSK = m.PolicyModulesSK
WHERE productcode = ''FT''

UNION

SELECT DISTINCT
PolicyNumber,
Organization = FITNESS_ASSOC_CD,
IDEAMemberInd = IDEAMEMBER,
CertificationType = CERTIFICATION
FROM Act_Detailed_Experience.dbo.ALL_POLICIES_12_premium_summary_February p
LEFT JOIN CAMILION.dbo.POLICY_TXN r
ON substring(Policynumber,1,10) = TERM_POLICY_NUMBER_TX
and productcode = ''FT''
LEFT JOIN CAMILION.dbo.POLICY_QUOTE q
ON r.PARENT_ID = q.PARENT_ID
LEFT JOIN CAMILION.dbo.GL_QUOTE_C g
ON g.PK_ID = q.PK_ID
WHERE productcode = ''FT''
' 
GO
