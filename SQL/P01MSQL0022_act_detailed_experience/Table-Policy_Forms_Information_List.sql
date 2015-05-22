IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Forms_Information_List]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Forms_Information_List]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Forms_Information_List]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Forms_Information_List](
	[Key] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Form_Number] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Form_Desc] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Table_Row_Count] [float] NULL,
	[F5] [float] NULL
) ON [PRIMARY]
END
GO
