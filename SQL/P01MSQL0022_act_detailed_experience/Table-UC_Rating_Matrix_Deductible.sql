IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UC_Rating_Matrix_Deductible]') AND type in (N'U'))
DROP TABLE [dbo].[UC_Rating_Matrix_Deductible]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UC_Rating_Matrix_Deductible]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UC_Rating_Matrix_Deductible](
	[Product] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Deductible] [float] NULL,
	[Factor] [float] NULL,
	[F4] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
