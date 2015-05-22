IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Formula_Conditions]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Formula_Conditions]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Formula_Conditions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Formula_Conditions](
	[Formula_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Info_ID] [int] NOT NULL,
	[Formula_Text] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Formula_Desc] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Formula_Status] [tinyint] NOT NULL,
	[Formula_Default_Value] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Formula_Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_Formula] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Formula_Conditions] PRIMARY KEY CLUSTERED 
(
	[Formula_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_Formula_Conditions] UNIQUE NONCLUSTERED 
(
	[Product_Info_ID] ASC,
	[Formula_Text] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Formula_Conditions_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Formula_Conditions]'))
ALTER TABLE [dbo].[POLGEN_Formula_Conditions]  WITH CHECK ADD  CONSTRAINT [FK_Formula_Conditions_Company_Info] FOREIGN KEY([Product_Info_ID])
REFERENCES [dbo].[POLGEN_Product_Info] ([Product_Info_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Formula_Conditions_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Formula_Conditions]'))
ALTER TABLE [dbo].[POLGEN_Formula_Conditions] CHECK CONSTRAINT [FK_Formula_Conditions_Company_Info]
GO
