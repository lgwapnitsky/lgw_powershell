IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[claim_transaction_data]') AND type in (N'U'))
DROP TABLE [dbo].[claim_transaction_data]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[claim_transaction_data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[claim_transaction_data](
	[claim_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[claim_trans_date] [int] NULL,
	[accident_state] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
