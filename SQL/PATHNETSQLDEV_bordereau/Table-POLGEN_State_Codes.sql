IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_State_Codes]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_State_Codes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_State_Codes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_State_Codes](
	[State_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Info_ID] [int] NOT NULL,
	[State_Code] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State_Status] [bit] NULL,
 CONSTRAINT [PK_State_Codes] PRIMARY KEY CLUSTERED 
(
	[State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_State_Codes] UNIQUE NONCLUSTERED 
(
	[Product_Info_ID] ASC,
	[State_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [IX_State_Codes_1] UNIQUE NONCLUSTERED 
(
	[State_ID] ASC,
	[Product_Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_State_Codes_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_State_Codes]'))
ALTER TABLE [dbo].[POLGEN_State_Codes]  WITH CHECK ADD  CONSTRAINT [FK_State_Codes_Company_Info] FOREIGN KEY([Product_Info_ID])
REFERENCES [dbo].[POLGEN_Product_Info] ([Product_Info_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_State_Codes_Company_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_State_Codes]'))
ALTER TABLE [dbo].[POLGEN_State_Codes] CHECK CONSTRAINT [FK_State_Codes_Company_Info]
GO
