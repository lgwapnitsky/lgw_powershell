IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_FF_October]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_FF_October]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_FF_October]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_FF_October](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Idnum] [int] NULL,
	[DF_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DF_Base_Retention] [float] NULL,
	[DF_Alt_Retention] [float] NULL,
	[DF_RatingClass] [int] NULL,
	[FF_DO_Limit] [float] NULL,
	[FF_DO_Base_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_DO_Alt_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_DO_RatingClass] [int] NULL,
	[FF_DO_Revenues] [float] NULL,
	[FF_EPL_Limit] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_Base_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_Alt_Retention] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_RatingClass] [int] NULL,
	[FF_EPL_Num_of_Employees] [float] NULL,
	[FF_Business_Type] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_Num_of_Employees_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_Num_of_Employees_Range_expanded] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_EPL_Num_of_Employees_Range_expanded_2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_DO_Revenues_range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_Trade_Assoc] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrimBusiness_Type] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_DO_Alt_Retention_int] [float] NULL,
	[FF_EPL_Limit_int] [float] NULL,
	[FF_EPL_Alt_Retention_int] [float] NULL
) ON [PRIMARY]
END
GO
