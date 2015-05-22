IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FF_Cov_ALL_IsNotNull_AccountNumberList]') AND type in (N'U'))
DROP TABLE [dbo].[FF_Cov_ALL_IsNotNull_AccountNumberList]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FF_Cov_ALL_IsNotNull_AccountNumberList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FF_Cov_ALL_IsNotNull_AccountNumberList](
	[accountnumber] [float] NULL
) ON [PRIMARY]
END
GO
