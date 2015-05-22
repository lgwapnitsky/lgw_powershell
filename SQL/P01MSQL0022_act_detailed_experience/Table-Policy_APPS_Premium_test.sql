IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_APPS_Premium_test]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_APPS_Premium_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_APPS_Premium_test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_APPS_Premium_test](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[currentwrittenpremium] [decimal](15, 2) NULL
) ON [PRIMARY]
END
GO
