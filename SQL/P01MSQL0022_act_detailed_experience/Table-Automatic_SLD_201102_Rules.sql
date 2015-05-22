IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automatic_SLD_201102_Rules]') AND type in (N'U'))
DROP TABLE [dbo].[Automatic_SLD_201102_Rules]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automatic_SLD_201102_Rules]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Automatic_SLD_201102_Rules](
	[Automatic_Index] [float] NULL,
	[Productcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RegionCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Statecode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProgramCode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Max_Years_for_Auto_Renewal] [float] NULL,
	[Incurred_Claims_Number] [float] NULL,
	[Incurred_Claims_for_Years] [float] NULL,
	[Automatic_Written_Premium_Threshold] [float] NULL,
	[Highest_Occurrence_Limit ] [float] NULL,
	[Automatic_Max_Employees] [float] NULL
) ON [PRIMARY]
END
GO
