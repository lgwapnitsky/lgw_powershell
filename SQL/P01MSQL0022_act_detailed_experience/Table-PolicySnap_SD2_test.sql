IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySnap_SD2_test]') AND type in (N'U'))
DROP TABLE [dbo].[PolicySnap_SD2_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySnap_SD2_test]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySnap_SD2_test](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[max_createddatetime] [datetime] NULL,
	[sourcedetailName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
