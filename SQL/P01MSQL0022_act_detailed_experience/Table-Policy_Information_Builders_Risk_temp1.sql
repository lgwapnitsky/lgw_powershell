IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Builders_Risk_temp1]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_Builders_Risk_temp1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Builders_Risk_temp1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_Builders_Risk_temp1](
	[accountnumber] [int] NULL,
	[maxeffdate] [datetime] NULL
) ON [PRIMARY]
END
GO
