IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_GL_November]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_ALL_POLICIES_GL_November]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_GL_November]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_ALL_POLICIES_GL_November](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyid] [int] NULL,
	[GL_Occurrence_Limit] [float] NULL,
	[GL_Aggregate_Limit] [float] NULL,
	[GL_Deductible] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GLDX_Indicator] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Exclusion_from_CG_21_46] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form_PI_SS_2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form_PI_SO_008] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form_PI_SO_007] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form_PI_HF_11] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form_PI_CAM_003] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_SS_2_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_SS_2_Agg_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_SO_008_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_SO_008_Agg_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_SO_007_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_SO_007_Agg_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_HF_11_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_HF_11_Agg_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_CAM_003_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_PI_CAM_003_Agg_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_OCC_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Agg_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAM_Form_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
