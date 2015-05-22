IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Cancel_ERRORS]') AND type in (N'U'))
DROP TABLE [dbo].[Arch_GRUNDY_Cancel_ERRORS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Cancel_ERRORS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Arch_GRUNDY_Cancel_ERRORS](
	[GRUNDY_Cancel_ID] [int] NOT NULL,
	[ERROR_ID] [int] NOT NULL,
	[Update_Date] [datetime] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_GRUNDY_Cancel_ERRORS_Update_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Cancel_ERRORS] ADD  CONSTRAINT [DF_Arch_GRUNDY_Cancel_ERRORS_Update_Date]  DEFAULT (getdate()) FOR [Update_Date]
END

GO
