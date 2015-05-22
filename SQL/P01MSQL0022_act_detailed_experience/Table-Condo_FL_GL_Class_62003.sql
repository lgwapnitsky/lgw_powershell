IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Condo_FL_GL_Class_62003]') AND type in (N'U'))
DROP TABLE [dbo].[Condo_FL_GL_Class_62003]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Condo_FL_GL_Class_62003]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Condo_FL_GL_Class_62003](
	[NCLSnum] [smallint] NOT NULL,
	[location] [smallint] NOT NULL,
	[policy_number] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[exposure] [float] NULL,
	[prem] [float] NULL,
	[exposure_adj_fac] [varchar](23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[loss_cost] [float] NULL,
	[territory] [int] NULL,
	[GL_Class_CO_LE4_Exposure] [float] NULL,
	[GL_Class_CO_LE4_RatingPrem] [float] NULL,
	[GL_Class_CO_LE4_Exposure_Adj] [float] NULL,
	[GL_Class_CO_GT4_Exposure] [float] NULL,
	[GL_Class_CO_GT4_RatingPrem] [float] NULL,
	[GL_Class_CO_GT4_Exposure_Adj] [float] NULL
) ON [PRIMARY]
END
GO
