IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[BondPro_Coverage]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BondPro_Coverage](
	[PolicyRowId] [int] IDENTITY(1,1) NOT NULL,
	[RowId] [int] NULL,
	[Effective_Date] [datetime] NULL,
	[Expiration_Date] [datetime] NULL,
	[SAA_Code] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gross_Premium] [decimal](11, 2) NULL,
	[Agent_Comm] [decimal](11, 2) NULL,
	[Net_Premium] [decimal](11, 2) NULL,
	[Bond_Amount] [decimal](11, 2) NULL,
	[Job_State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Trans_Code] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [BPCoveragePK] PRIMARY KEY CLUSTERED 
(
	[PolicyRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPCoverageFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_Coverage]'))
ALTER TABLE [dbo].[BondPro_Coverage]  WITH CHECK ADD  CONSTRAINT [BPCoverageFK] FOREIGN KEY([RowId])
REFERENCES [dbo].[BondPro_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPCoverageFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_Coverage]'))
ALTER TABLE [dbo].[BondPro_Coverage] CHECK CONSTRAINT [BPCoverageFK]
GO
