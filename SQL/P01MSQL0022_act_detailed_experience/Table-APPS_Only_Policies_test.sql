IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APPS_Only_Policies_test]') AND type in (N'U'))
DROP TABLE [dbo].[APPS_Only_Policies_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APPS_Only_Policies_test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[APPS_Only_Policies_test](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accountnumber] [int] NOT NULL
) ON [PRIMARY]
END
GO
