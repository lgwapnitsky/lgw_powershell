IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Policy_Information_temp1]') AND type in (N'U'))
DROP TABLE [dbo].[NPDO_Policy_Information_temp1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_Policy_Information_temp1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NPDO_Policy_Information_temp1](
	[accountnumber] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyeffectivedate] [datetime] NULL,
	[productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[acctngyear] [int] NULL
) ON [PRIMARY]
END
GO
