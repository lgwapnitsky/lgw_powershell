IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Policy_ERRORS]') AND type in (N'U'))
DROP TABLE [dbo].[Arch_GRUNDY_Policy_ERRORS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_GRUNDY_Policy_ERRORS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Arch_GRUNDY_Policy_ERRORS](
	[Grundy_policy_Id] [int] NOT NULL,
	[Error_Id] [int] NOT NULL,
	[Update_Date] [datetime] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_ArchGRUNDY_Policy_Errors_Update_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_GRUNDY_Policy_ERRORS] ADD  CONSTRAINT [DF_ArchGRUNDY_Policy_Errors_Update_Date]  DEFAULT (getdate()) FOR [Update_Date]
END

GO
