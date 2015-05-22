IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_ACA_ROWS]') AND type in (N'U'))
DROP TABLE [dbo].[Arch_ACA_ROWS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Arch_ACA_ROWS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Arch_ACA_ROWS](
	[Arch_ACA_ROWS_ID] [int] IDENTITY(1,1) NOT NULL,
	[Arch_ACA_XLS_ID] [int] NOT NULL,
	[Policy#] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATUS] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LAST NAME] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDRESS] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CITY] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ST] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LICENSE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CHILD] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EFF DATE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EXP DATE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LIAB LIMIT] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OCC LIMIT] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AGG LIMIT] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FIRE LIMIT] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ABUSE OCC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ABUSE AGG] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MEMBER#] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TERM] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PAY] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ANN AUTO PREM] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ANN LIAB PREM] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOT PMT] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LESS E&S TAX] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATE TAXES/SURCHARGES] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HAYS COMM 17.5% LIAB] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NONAME] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HAYS COMM 17.5% AUTO] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NET DUE PHLY LIAB] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GROSS DUE PHLY LIAB] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NET DUE PHLY AUTO] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GROSS DUE PHLY AUTO] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CANCEL DATE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMEND DATE] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AMEND ENTRY] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[COMMENT] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Unexpired %] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto Annual Premium] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Liability Annual Premium] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amount to be refunded, Gross] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tax refund] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Commission refund] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amount to be refunded, Net] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ST1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NJFee] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WVFee] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KYMun] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KYCollection] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[KYIPS] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CancelReason] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Arch_ACA_ROWS] PRIMARY KEY CLUSTERED 
(
	[Arch_ACA_ROWS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Arch_ACA_ROWS_UpdateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Arch_ACA_ROWS] ADD  CONSTRAINT [DF_Arch_ACA_ROWS_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Arch_ACA_ROWS_Arch_ACA_XLS]') AND parent_object_id = OBJECT_ID(N'[dbo].[Arch_ACA_ROWS]'))
ALTER TABLE [dbo].[Arch_ACA_ROWS]  WITH CHECK ADD  CONSTRAINT [FK_Arch_ACA_ROWS_Arch_ACA_XLS] FOREIGN KEY([Arch_ACA_XLS_ID])
REFERENCES [dbo].[Arch_ACA_XLS] ([Arch_ACA_XLS_ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Arch_ACA_ROWS_Arch_ACA_XLS]') AND parent_object_id = OBJECT_ID(N'[dbo].[Arch_ACA_ROWS]'))
ALTER TABLE [dbo].[Arch_ACA_ROWS] CHECK CONSTRAINT [FK_Arch_ACA_ROWS_Arch_ACA_XLS]
GO
