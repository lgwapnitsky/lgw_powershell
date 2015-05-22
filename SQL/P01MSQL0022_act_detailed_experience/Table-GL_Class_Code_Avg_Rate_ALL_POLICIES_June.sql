IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_June]') AND type in (N'U'))
DROP TABLE [dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_June]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_June]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GL_Class_Code_Avg_Rate_ALL_POLICIES_June](
	[Policy_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Effective_Date] [datetime] NULL,
	[Expiration_Date] [datetime] NULL,
	[State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Territory] [int] NULL,
	[Class_Code] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Premium] [float] NULL,
	[Exposure] [float] NULL,
	[Exposure_Adj_Fac] [varchar](23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exposure_Adj_Type] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exposure_Base] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Territory_Dominant] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Terr_Description] [varchar](175) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Region_in_State] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_Description] [varchar](175) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Avg_Rate] [float] NULL,
	[Avg_Rate_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
