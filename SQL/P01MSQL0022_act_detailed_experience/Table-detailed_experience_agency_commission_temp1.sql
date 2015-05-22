IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detailed_experience_agency_commission_temp1]') AND type in (N'U'))
DROP TABLE [dbo].[detailed_experience_agency_commission_temp1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detailed_experience_agency_commission_temp1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detailed_experience_agency_commission_temp1](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[createdate] [datetime] NOT NULL,
	[PIC_Producer] [int] NULL,
	[PIC_Producer_Type] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_commission_pct] [float] NULL,
	[Primary_Producer] [int] NULL,
	[Primary_Producer_Type] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_commission_pct] [float] NULL
) ON [PRIMARY]
END
GO
