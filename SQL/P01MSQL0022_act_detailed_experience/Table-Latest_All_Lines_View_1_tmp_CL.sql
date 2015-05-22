IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tmp_CL]') AND type in (N'U'))
DROP TABLE [dbo].[Latest_All_Lines_View_1_tmp_CL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_View_1_tmp_CL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Latest_All_Lines_View_1_tmp_CL](
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[currentearnedpremium] [decimal](38, 2) NULL,
	[SLD_BusinessType] [char](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
