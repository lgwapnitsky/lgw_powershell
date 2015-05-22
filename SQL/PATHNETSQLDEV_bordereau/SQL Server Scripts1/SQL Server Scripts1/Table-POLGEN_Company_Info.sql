IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Info]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_Company_Info]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_Company_Info](
	[Company_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Info_ID] [int] NULL,
	[Full_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Company_Code] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Legal_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Trade_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CityName] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateAdd] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClaimPhone] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClaimFax] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClaimEmail] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_POLGEN_Company_Info] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Info]') AND name = N'IX_POLGEN_Company_Info')
CREATE UNIQUE NONCLUSTERED INDEX [IX_POLGEN_Company_Info] ON [dbo].[POLGEN_Company_Info]
(
	[Company_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_Info_POLGEN_Product_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Info]'))
ALTER TABLE [dbo].[POLGEN_Company_Info]  WITH CHECK ADD  CONSTRAINT [FK_POLGEN_Company_Info_POLGEN_Product_Info] FOREIGN KEY([Product_Info_ID])
REFERENCES [dbo].[POLGEN_Product_Info] ([Product_Info_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLGEN_Company_Info_POLGEN_Product_Info]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLGEN_Company_Info]'))
ALTER TABLE [dbo].[POLGEN_Company_Info] CHECK CONSTRAINT [FK_POLGEN_Company_Info_POLGEN_Product_Info]
GO
