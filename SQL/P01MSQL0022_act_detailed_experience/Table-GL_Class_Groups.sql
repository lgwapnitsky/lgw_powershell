IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Groups]') AND type in (N'U'))
DROP TABLE [dbo].[GL_Class_Groups]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GL_Class_Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GL_Class_Groups](
	[Class_Group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Field_Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClassCode] [float] NULL,
	[Class Description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ranges] [float] NULL,
	[Dec_Places] [float] NULL,
	[Range_1] [float] NULL,
	[Range_2] [float] NULL,
	[Range_3] [float] NULL,
	[Range_4] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Range_5] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Range_6] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Range_7] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Range_8] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Range_9] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Range_10] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
