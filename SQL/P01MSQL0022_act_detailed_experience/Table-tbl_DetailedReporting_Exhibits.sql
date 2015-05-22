IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_DetailedReporting_Exhibits]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_DetailedReporting_Exhibits]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_DetailedReporting_Exhibits]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_DetailedReporting_Exhibits](
	[MatchKey] [int] NULL,
	[Category] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExhibitOrder] [int] NULL,
	[ExhibitDesc] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group3] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group4] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader3] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupHeader4] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSort1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSortDirection1] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSort2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSortDirection2] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSort3] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSortDirection3] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSort4] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupSortDirection4] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncludeGroupTotals1] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncludeGroupTotals2] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncludeGroupTotals3] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncludeGroupTotals4] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSort1] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSortDirection1] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSort2] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DetailedSortDirection2] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MeasureList] [int] NULL
) ON [PRIMARY]
END
GO
