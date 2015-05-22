IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_PolicyErrors]') AND type in (N'U'))
DROP TABLE [dbo].[BondPro_PolicyErrors]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_PolicyErrors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BondPro_PolicyErrors](
	[RowId] [int] NULL,
	[Error_Code] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPPolicyErrorsFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_PolicyErrors]'))
ALTER TABLE [dbo].[BondPro_PolicyErrors]  WITH CHECK ADD  CONSTRAINT [BPPolicyErrorsFK] FOREIGN KEY([RowId])
REFERENCES [dbo].[BondPro_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPPolicyErrorsFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_PolicyErrors]'))
ALTER TABLE [dbo].[BondPro_PolicyErrors] CHECK CONSTRAINT [BPPolicyErrorsFK]
GO
