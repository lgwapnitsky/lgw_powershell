IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VS_AcctsProvidedbyUW]') AND type in (N'U'))
DROP TABLE [dbo].[VS_AcctsProvidedbyUW]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VS_AcctsProvidedbyUW]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VS_AcctsProvidedbyUW](
	[AccountNumber] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
