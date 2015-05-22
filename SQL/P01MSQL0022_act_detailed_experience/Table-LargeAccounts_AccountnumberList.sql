IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LargeAccounts_AccountnumberList]') AND type in (N'U'))
DROP TABLE [dbo].[LargeAccounts_AccountnumberList]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LargeAccounts_AccountnumberList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LargeAccounts_AccountnumberList](
	[LargeAccount_AccountNumber] [float] NULL
) ON [PRIMARY]
END
GO
