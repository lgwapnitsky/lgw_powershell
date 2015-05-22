IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[''aaaAccountlist]') AND type in (N'U'))
DROP TABLE [dbo].['aaaAccountlist]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[''aaaAccountlist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].['aaaAccountlist](
	[AccountNumber] [float] NULL
) ON [PRIMARY]
END
GO
