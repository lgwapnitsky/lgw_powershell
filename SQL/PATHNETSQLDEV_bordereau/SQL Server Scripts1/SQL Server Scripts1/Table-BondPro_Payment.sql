IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Payment]') AND type in (N'U'))
DROP TABLE [dbo].[BondPro_Payment]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Payment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BondPro_Payment](
	[PolicyRowId] [int] IDENTITY(1,1) NOT NULL,
	[RowId] [int] NULL,
	[Bond_Number] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bond_Ren_Num] [int] NULL,
	[Effective_Date] [datetime] NULL,
	[Expiration_Date] [datetime] NULL,
	[Bond_Amount] [decimal](11, 2) NULL,
	[Gross_Premium] [decimal](11, 2) NULL,
	[Net_Premium] [decimal](11, 2) NULL,
	[Agent_Commission] [decimal](11, 2) NULL,
	[Payment_Bond_Amt] [decimal](11, 2) NULL,
	[Bond_Payment_Date] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [BPPaymentPK] PRIMARY KEY CLUSTERED 
(
	[PolicyRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPPaymentFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_Payment]'))
ALTER TABLE [dbo].[BondPro_Payment]  WITH CHECK ADD  CONSTRAINT [BPPaymentFK] FOREIGN KEY([RowId])
REFERENCES [dbo].[BondPro_Policy] ([RowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPPaymentFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_Payment]'))
ALTER TABLE [dbo].[BondPro_Payment] CHECK CONSTRAINT [BPPaymentFK]
GO
