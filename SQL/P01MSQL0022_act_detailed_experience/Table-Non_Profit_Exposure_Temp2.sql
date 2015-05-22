IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Non_Profit_Exposure_Temp2]') AND type in (N'U'))
DROP TABLE [dbo].[Non_Profit_Exposure_Temp2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Non_Profit_Exposure_Temp2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Non_Profit_Exposure_Temp2](
	[FBI_Exposure] [float] NOT NULL,
	[location] [smallint] NOT NULL,
	[building] [smallint] NOT NULL,
	[policy_number] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[coverage] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
