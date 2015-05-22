IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prior_Claims_AE]') AND type in (N'U'))
DROP TABLE [dbo].[Prior_Claims_AE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prior_Claims_AE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Prior_Claims_AE](
	[Policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Prior_Claims] [decimal](38, 2) NOT NULL
) ON [PRIMARY]
END
GO
