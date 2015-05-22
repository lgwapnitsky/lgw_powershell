IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Policyid_RS_test]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Policyid_RS_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Policyid_RS_test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Policyid_RS_test](
	[policynumber] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PolicySK] [bigint] NULL
) ON [PRIMARY]
END
GO
