IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPH_Payment]') AND type in (N'U'))
DROP TABLE [dbo].[CPH_Payment]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CPH_Payment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CPH_Payment](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNumber] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentType] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentNumber] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GrossPremium] [decimal](18, 0) NULL,
	[CommissionAmount] [decimal](18, 0) NULL,
	[NetPremium] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CPH_Payment] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Payment_PolicyNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Payment] ADD  CONSTRAINT [DF_CPH_Payment_PolicyNumber]  DEFAULT ('') FOR [PolicyNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Payment_PaymentType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Payment] ADD  CONSTRAINT [DF_CPH_Payment_PaymentType]  DEFAULT ('') FOR [PaymentType]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Payment_PaymentNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Payment] ADD  CONSTRAINT [DF_CPH_Payment_PaymentNumber]  DEFAULT ('') FOR [PaymentNumber]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Payment_GrossPremium]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Payment] ADD  CONSTRAINT [DF_CPH_Payment_GrossPremium]  DEFAULT (0) FOR [GrossPremium]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Payment_CommissionAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Payment] ADD  CONSTRAINT [DF_CPH_Payment_CommissionAmount]  DEFAULT (0) FOR [CommissionAmount]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CPH_Payment_NetPremium]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CPH_Payment] ADD  CONSTRAINT [DF_CPH_Payment_NetPremium]  DEFAULT (0) FOR [NetPremium]
END

GO
