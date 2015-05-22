IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automatic_CLD_Current_Rules]') AND type in (N'U'))
DROP TABLE [dbo].[Automatic_CLD_Current_Rules]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automatic_CLD_Current_Rules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Automatic_CLD_Current_Rules](
	[Automatic_Index] [float] NULL,
	[Productcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RegionCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProgramCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProducerCode] [float] NULL,
	[Automatic_Written_Premium_Threshold] [float] NULL,
	[Automatic_Account_Reported_Loss_Ratio] [float] NULL,
	[Automatic_Applies_First_Renewal] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Automatic_EandS] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
