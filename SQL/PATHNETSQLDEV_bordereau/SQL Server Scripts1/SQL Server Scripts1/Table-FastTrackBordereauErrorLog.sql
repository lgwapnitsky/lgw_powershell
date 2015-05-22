IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastTrackBordereauErrorLog]') AND type in (N'U'))
DROP TABLE [dbo].[FastTrackBordereauErrorLog]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FastTrackBordereauErrorLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FastTrackBordereauErrorLog](
	[BordereauName] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OccurenceTime] [datetime] NULL,
	[Message] [varchar](5000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateTime] [datetime] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FastTrackBordereauErrorLog_UpdateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FastTrackBordereauErrorLog] ADD  CONSTRAINT [DF_FastTrackBordereauErrorLog_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
END

GO
