IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PVDO_ClaimsModAccountNumberList]') AND type in (N'U'))
DROP TABLE [dbo].[PVDO_ClaimsModAccountNumberList]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PVDO_ClaimsModAccountNumberList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PVDO_ClaimsModAccountNumberList](
	[AccountNumber] [float] NULL
) ON [PRIMARY]
END
GO
