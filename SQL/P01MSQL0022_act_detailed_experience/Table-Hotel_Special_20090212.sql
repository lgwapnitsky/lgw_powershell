IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_Special_20090212]') AND type in (N'U'))
DROP TABLE [dbo].[Hotel_Special_20090212]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hotel_Special_20090212]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Hotel_Special_20090212](
	[accountnumber] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyeffectivedate] [datetime] NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[experienceproduct] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fiscal_AY_Month_Ending] [int] NULL,
	[Fiscal_AY_Year] [int] NULL,
	[acctngyear] [int] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[currentwrittenpremium] [decimal](15, 2) NULL,
	[currentearnedpremium] [decimal](15, 2) NULL,
	[Account_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Average_Room_Rate] [float] NULL,
	[GL_Class_HT_w_PB_LT4_Exposure] [float] NULL,
	[GL_Class_HT_w_PB_LT4_RatingPrem] [float] NULL,
	[GL_Class_HT_w_PB_LT4_Exposure_adj] [float] NULL,
	[GL_Class_HT_w_PB_GE4_Exposure] [float] NULL,
	[GL_Class_HT_w_PB_GE4_RatingPrem] [float] NULL,
	[GL_Class_HT_w_PB_GE4_Exposure_adj] [float] NULL,
	[GL_Class_HT_wo_PB_LT4_Exposure] [float] NULL,
	[GL_Class_HT_wo_PB_LT4_RatingPrem] [float] NULL,
	[GL_Class_HT_wo_PB_LT4_Exposure_adj] [float] NULL,
	[GL_Class_HT_wo_PB_GE4_Exposure] [float] NULL,
	[GL_Class_HT_wo_PB_GE4_RatingPrem] [float] NULL,
	[GL_Class_HT_wo_PB_GE4_Exposure_adj] [float] NULL,
	[GL_Class_HT_w_PB_LT4_AvgRate] [float] NULL,
	[GL_Class_HT_w_PB_GE4_AvgRate] [float] NULL,
	[GL_Class_HT_wo_PB_LT4_AvgRate] [float] NULL,
	[GL_Class_HT_wo_PB_GE4_AvgRate] [float] NULL,
	[Number_of_Rooms] [float] NULL,
	[Hotel_Brand] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyexpirationdate] [datetime] NULL,
	[Percentage_Occupancy] [float] NULL,
	[Gross_Sales_Hotel] [float] NULL,
	[IMPLIED_HOTEL_ROOM_RATE] [float] NULL,
	[canceldate] [datetime] NULL,
	[reinstatementdate] [datetime] NULL,
	[Program_Code] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriter] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterPID] [int] NULL,
	[program] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
