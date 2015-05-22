IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FWA_Policy_Errors]') AND type in (N'U'))
DROP TABLE [dbo].[FWA_Policy_Errors]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FWA_Policy_Errors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FWA_Policy_Errors](
	[RowId] [int] NOT NULL,
	[ErrorId] [int] NOT NULL
) ON [PRIMARY]
END
GO
