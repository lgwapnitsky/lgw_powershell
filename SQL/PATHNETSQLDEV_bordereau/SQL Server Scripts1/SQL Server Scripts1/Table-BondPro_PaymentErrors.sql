IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_PaymentErrors]') AND type in (N'U'))
DROP TABLE [dbo].[BondPro_PaymentErrors]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_PaymentErrors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BondPro_PaymentErrors](
	[RowId] [int] NULL,
	[Error_Code] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPPaymentErrorsFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_PaymentErrors]'))
ALTER TABLE [dbo].[BondPro_PaymentErrors]  WITH CHECK ADD  CONSTRAINT [BPPaymentErrorsFK] FOREIGN KEY([RowId])
REFERENCES [dbo].[BondPro_Payment] ([PolicyRowId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[BPPaymentErrorsFK]') AND parent_object_id = OBJECT_ID(N'[dbo].[BondPro_PaymentErrors]'))
ALTER TABLE [dbo].[BondPro_PaymentErrors] CHECK CONSTRAINT [BPPaymentErrorsFK]
GO
