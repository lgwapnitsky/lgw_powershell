IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Policy_Errors_Archive]') AND type in (N'U'))
DROP TABLE [dbo].[FT_Policy_Errors_Archive]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FT_Policy_Errors_Archive]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FT_Policy_Errors_Archive](
	[RowId] [int] NOT NULL,
	[ErrorId] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FT_Policy_Errors_Archive_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FT_Policy_Errors_Archive] ADD  CONSTRAINT [DF_FT_Policy_Errors_Archive_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
