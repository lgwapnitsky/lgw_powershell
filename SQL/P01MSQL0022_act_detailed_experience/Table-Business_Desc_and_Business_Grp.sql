IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Business_Desc_and_Business_Grp]') AND type in (N'U'))
DROP TABLE [dbo].[Business_Desc_and_Business_Grp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Business_Desc_and_Business_Grp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Business_Desc_and_Business_Grp](
	[Business_Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Description_Group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
