IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tmp_BondPro_Reconciliation]') AND type in (N'U'))
DROP TABLE [dbo].[tmp_BondPro_Reconciliation]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tmp_BondPro_Reconciliation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tmp_BondPro_Reconciliation](
	[Bond_Id] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bond_Number] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renewal_Number] [float] NULL,
	[Effective_Date] [datetime] NULL,
	[Expiration_Date] [datetime] NULL,
	[BondFormDescription] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SAA_Code] [float] NULL,
	[Gross_Premium] [float] NULL,
	[Bond_Amount] [float] NULL,
	[Client_Code] [float] NULL,
	[Agent_Rate] [float] NULL,
	[Cancelled] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
