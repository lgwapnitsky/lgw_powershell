IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detailed_experience_agency_commission_VS]') AND type in (N'U'))
DROP TABLE [dbo].[detailed_experience_agency_commission_VS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detailed_experience_agency_commission_VS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detailed_experience_agency_commission_VS](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Secondary_Producer] [int] NULL,
	[Secondary_Producer_Type] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Secondary_commission_pct] [float] NULL,
	[Primary_Producer] [int] NULL,
	[Primary_Producer_Type] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer_Addrid] [int] NULL,
	[Primary_commission_pct] [float] NULL,
	[Primary_Producer_TypeDesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Secondary_Producer_TypeDesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
