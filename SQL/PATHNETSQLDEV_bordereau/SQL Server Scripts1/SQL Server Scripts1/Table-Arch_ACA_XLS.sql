IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_ACA_XLS]') AND type in (N'U'))
DROP TABLE [dbo].[Arch_ACA_XLS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_ACA_XLS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Arch_ACA_XLS](
	[Arch_ACA_XLS_ID] [int] IDENTITY(1,1) NOT NULL,
	[XLS_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Processed_Date] [datetime] NOT NULL,
	[TotalNoOfRows] [int] NULL,
	[RowsProcessed] [int] NULL,
 CONSTRAINT [PK_Arch_ACA_XLS] PRIMARY KEY CLUSTERED 
(
	[Arch_ACA_XLS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_ACA_XLS_Processed_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_ACA_XLS] ADD  CONSTRAINT [DF_Arch_ACA_XLS_Processed_Date]  DEFAULT (getdate()) FOR [Processed_Date]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_ACA_XLS_TotalNoOfRows]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_ACA_XLS] ADD  CONSTRAINT [DF_Arch_ACA_XLS_TotalNoOfRows]  DEFAULT (0) FOR [TotalNoOfRows]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_ACA_XLS_RowsProcessed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_ACA_XLS] ADD  CONSTRAINT [DF_Arch_ACA_XLS_RowsProcessed]  DEFAULT (0) FOR [RowsProcessed]
END

GO
