IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_NoGUID]') AND type in (N'U'))
DROP TABLE [dbo].[BondPro_NoGUID]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_NoGUID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BondPro_NoGUID](
	[Bond_ID] [char](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bond_Number] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bond_Ren_Num] [int] NULL,
	[SAA_Code] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gross_Premium] [decimal](11, 2) NULL,
	[Bond_Amount] [decimal](11, 2) NULL,
	[Cancelled] [char](22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]
END
GO
