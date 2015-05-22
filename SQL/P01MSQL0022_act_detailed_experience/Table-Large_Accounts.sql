IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts]') AND type in (N'U'))
DROP TABLE [dbo].[Large_Accounts]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Large_Accounts](
	[Accountnumber] [int] NOT NULL
) ON [PRIMARY]
END
GO
