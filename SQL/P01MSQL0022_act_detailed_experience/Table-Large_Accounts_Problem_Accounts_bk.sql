IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_Problem_Accounts_bk]') AND type in (N'U'))
DROP TABLE [dbo].[Large_Accounts_Problem_Accounts_bk]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Large_Accounts_Problem_Accounts_bk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Large_Accounts_Problem_Accounts_bk](
	[AccountNumber] [float] NULL,
	[Problem_Account_Identified_Year] [float] NULL
) ON [PRIMARY]
END
GO
