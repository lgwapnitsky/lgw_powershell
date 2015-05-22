IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FWA_Location]') AND type in (N'U'))
DROP TABLE [dbo].[FWA_Location]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FWA_Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FWA_Location](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyRowId] [int] NULL,
	[LocationNumber] [int] NULL,
	[BuildingNumber] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostalCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionCode] [nvarchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FWA_Location] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_LocationNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_LocationNumber]  DEFAULT (0) FOR [LocationNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_BuildingNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_BuildingNumber]  DEFAULT ('') FOR [BuildingNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_Address1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_Address1]  DEFAULT ('') FOR [Address1]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_Address2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_Address2]  DEFAULT ('') FOR [Address2]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_City]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_City]  DEFAULT ('') FOR [City]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_State]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_State]  DEFAULT ('') FOR [State]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_PostalCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_PostalCode]  DEFAULT ('') FOR [PostalCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_TransactionCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_TransactionCode]  DEFAULT ('') FOR [TransactionCode]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_FWA_Location_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FWA_Location] ADD  CONSTRAINT [DF_FWA_Location_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FWA_Location_FWA_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FWA_Location]'))
ALTER TABLE [dbo].[FWA_Location]  WITH NOCHECK ADD  CONSTRAINT [FK_FWA_Location_FWA_Policy] FOREIGN KEY([PolicyRowId])
REFERENCES [dbo].[FWA_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FWA_Location_FWA_Policy]') AND parent_object_id = OBJECT_ID(N'[dbo].[FWA_Location]'))
ALTER TABLE [dbo].[FWA_Location] CHECK CONSTRAINT [FK_FWA_Location_FWA_Policy]
GO
