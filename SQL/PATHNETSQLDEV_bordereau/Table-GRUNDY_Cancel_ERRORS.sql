IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_Cancel_ERRORS]') AND type in (N'U'))
DROP TABLE [dbo].[GRUNDY_Cancel_ERRORS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUNDY_Cancel_ERRORS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GRUNDY_Cancel_ERRORS](
	[Grundy_Cancel_ID] [int] NOT NULL,
	[Error_ID] [int] NOT NULL
) ON [PRIMARY]
END
GO
