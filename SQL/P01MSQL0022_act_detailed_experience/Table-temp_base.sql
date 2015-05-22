IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_base]') AND type in (N'U'))
DROP TABLE [dbo].[temp_base]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_base]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_base](
	[idnum] [int] NULL,
	[SubmissionDate_min] [datetime] NULL,
	[SubmissionDate_max] [datetime] NULL,
	[DeclinedSubDate_min] [datetime] NULL,
	[DeclinedSubDate_max] [datetime] NULL,
	[QuoteIssuedDate_min] [datetime] NULL,
	[QuoteIssuedDate_max] [datetime] NULL,
	[DeclinedQuoteDate_min] [datetime] NULL,
	[DeclinedQuoteDate_max] [datetime] NULL,
	[BoundDate_min] [datetime] NULL,
	[BoundDate_max] [datetime] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[temp_base]') AND name = N'idx_idnum')
CREATE NONCLUSTERED INDEX [idx_idnum] ON [dbo].[temp_base]
(
	[idnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
