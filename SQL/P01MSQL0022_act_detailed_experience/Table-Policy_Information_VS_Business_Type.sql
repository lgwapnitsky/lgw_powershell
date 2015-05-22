IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_VS_Business_Type]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_VS_Business_Type]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_VS_Business_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_VS_Business_Type](
	[accountnumber] [int] NULL,
	[policynumber] [char](72) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
