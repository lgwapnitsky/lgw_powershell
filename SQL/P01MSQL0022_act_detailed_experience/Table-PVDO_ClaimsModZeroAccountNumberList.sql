IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PVDO_ClaimsModZeroAccountNumberList]') AND type in (N'U'))
DROP TABLE [dbo].[PVDO_ClaimsModZeroAccountNumberList]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PVDO_ClaimsModZeroAccountNumberList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PVDO_ClaimsModZeroAccountNumberList](
	[AccountNumber] [float] NULL
) ON [PRIMARY]
END
GO
