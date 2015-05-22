IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LDF_2011Q4]') AND type in (N'U'))
DROP TABLE [dbo].[LDF_2011Q4]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LDF_2011Q4]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LDF_2011Q4](
	[Coverage_Group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LDF_Group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Month] [float] NULL,
	[Loss_Dev_Factor] [float] NULL,
	[Capped_Loss_Dev_Factor] [float] NULL,
	[BF_Loss_Ratio] [float] NULL
) ON [PRIMARY]
END
GO
