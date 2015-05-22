IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Reconciliation]') AND type in (N'U'))
DROP TABLE [dbo].[BondPro_Reconciliation]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Reconciliation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BondPro_Reconciliation](
	[Bond_ID] [char](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BP_Bond_Number] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APPS_Bond_Number] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BP_Bond_Ren_Num] [int] NULL,
	[APPS_Bond_Ren_Num] [int] NULL,
	[BP_Effective_Date] [datetime] NULL,
	[APPS_Effective_Date] [datetime] NULL,
	[BP_Expiration_Date] [datetime] NULL,
	[APPS_Expiration_Date] [datetime] NULL,
	[BondFormDescription] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BP_SAA_Code] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APPS_SAA_Code] [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BP_Gross_Premium] [decimal](11, 2) NULL,
	[APPS_Gross_Premium] [decimal](15, 2) NULL,
	[BP_Bond_Amount] [decimal](11, 2) NULL,
	[APPS_Bond_Amount] [decimal](15, 2) NULL,
	[BP_Client_Code] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[APPS_Producer_Code] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BP_Agent_Commission] [decimal](9, 6) NULL,
	[APPS_Agent_Commission] [decimal](9, 6) NULL,
	[APPS_PolicyNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cancelled] [char](22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]
END
GO
