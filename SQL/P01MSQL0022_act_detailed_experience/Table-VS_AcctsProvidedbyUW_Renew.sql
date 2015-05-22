IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VS_AcctsProvidedbyUW_Renew]') AND type in (N'U'))
DROP TABLE [dbo].[VS_AcctsProvidedbyUW_Renew]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VS_AcctsProvidedbyUW_Renew]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VS_AcctsProvidedbyUW_Renew](
	[AccountNumber_Renewed] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
