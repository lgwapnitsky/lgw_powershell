IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_GC_temp2]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_GC_temp2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_GC_temp2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_GC_temp2](
	[accountnumber] [int] NULL,
	[maxeffdate] [datetime] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
