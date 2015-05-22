IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_FormPendingActivation]') AND type in (N'U'))
DROP TABLE [dbo].[POLGEN_FormPendingActivation]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POLGEN_FormPendingActivation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[POLGEN_FormPendingActivation](
	[CurrentForm_Number] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CurrentForm_Edition] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReplacementForm_Number] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReplacementForm_Edition] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_CMPST_FormPendingActivation] PRIMARY KEY CLUSTERED 
(
	[CurrentForm_Number] ASC,
	[CurrentForm_Edition] ASC,
	[ReplacementForm_Number] ASC,
	[ReplacementForm_Edition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
