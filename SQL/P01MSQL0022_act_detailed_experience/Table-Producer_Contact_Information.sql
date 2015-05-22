IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producer_Contact_Information]') AND type in (N'U'))
DROP TABLE [dbo].[Producer_Contact_Information]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producer_Contact_Information]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producer_Contact_Information](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[producercode] [int] NOT NULL,
	[busname] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer_Contact] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[address1] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[address2] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer_Phone] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer_Email] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
