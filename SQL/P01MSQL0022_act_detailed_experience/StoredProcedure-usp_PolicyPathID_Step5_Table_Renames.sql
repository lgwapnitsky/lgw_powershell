IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step5_Table_Renames]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PolicyPathID_Step5_Table_Renames]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PolicyPathID_Step5_Table_Renames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE procedure [dbo].[usp_PolicyPathID_Step5_Table_Renames]

as

-- Policy PathId Monthly Step 5
-- FootPrints Ticket #59691
-- Erik Godfrey
-- 7/16/2012

if exists (select 1 from sys.tables
           where name = ''Policy_PATHID_InformationBK'')
   drop table Act_Detailed_Experience.dbo.Policy_PATHID_InformationBK

exec sp_rename ''Policy_PATHID_Information'', ''Policy_PATHID_InformationBK''

exec sp_rename ''Policy_PATHID_Information_work'', ''Policy_PATHID_Information''

if exists (select 1 from sys.tables
           where name = ''Policy_PATHID_InformationBK'')
   drop table Act_Detailed_Experience.dbo.Policy_Forms_InformationBK
   
exec sp_rename ''Policy_Forms_Information'', ''Policy_Forms_InformationBK''

exec sp_rename ''Policy_Forms_Information_work'', ''Policy_Forms_Information''

if exists (select 1 from sys.tables
           where name = ''Policy_PATHID_InformationBK'')
   drop table Act_Detailed_Experience.dbo.Policy_PATHID_Information_JudgmtMod_BK
   
exec sp_rename ''Policy_PATHID_Information_JudgmtMod'', ''Policy_PATHID_Information_JudgmtMod_BK''

exec sp_rename ''Policy_PATHID_Information_JudgmtMod_work'', ''Policy_PATHID_Information_JudgmtMod''

if exists (select 1 from sys.tables
           where name = ''Policy_PATHID_InformationBK'')
   drop table Act_Detailed_Experience.dbo.Policy_PATHID_Information_LossRatios_BK
   
exec sp_rename ''Policy_PATHID_Information_LossRatios'', ''Policy_PATHID_Information_LossRatios_BK''

exec sp_rename ''Policy_PATHID_Information_LossRatios_work'', ''Policy_PATHID_Information_LossRatios''

' 
END
GO
