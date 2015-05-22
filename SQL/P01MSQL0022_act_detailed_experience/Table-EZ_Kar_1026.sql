IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EZ_Kar_1026]') AND type in (N'U'))
DROP TABLE [dbo].[EZ_Kar_1026]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EZ_Kar_1026]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EZ_Kar_1026](
	[col1] [int] NULL
) ON [PRIMARY]
END
GO
