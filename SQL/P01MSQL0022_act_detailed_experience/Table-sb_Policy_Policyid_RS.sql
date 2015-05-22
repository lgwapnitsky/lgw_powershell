IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_Policyid_RS]') AND type in (N'U'))
DROP TABLE [dbo].[sb_Policy_Policyid_RS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_Policyid_RS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_Policy_Policyid_RS](
	[Policynumber] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PolicySK] [bigint] NULL
) ON [PRIMARY]
END
GO
