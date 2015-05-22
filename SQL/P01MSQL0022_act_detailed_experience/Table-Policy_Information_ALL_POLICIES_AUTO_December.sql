IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_AUTO_December]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_ALL_POLICIES_AUTO_December]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_AUTO_December]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_ALL_POLICIES_AUTO_December](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PolicyID] [int] NULL,
	[Auto_Vehicle_All_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_Truck_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_PPT_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_Buses_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_VanPools_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_OtherPublic_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_Other_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_Dual_Control_count] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Total_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Truck_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_PPT_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Buses_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_VanPools_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OtherPublic_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Other_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Dual_Control_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Dual_Control_Percent_Range] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Driving_School] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coll_No_Ded] [int] NULL,
	[Coll_U1000_Ded] [int] NULL,
	[Coll_1000_Ded] [int] NULL,
	[Coll_O1000_Ded] [int] NULL,
	[OTC_No_Ded] [int] NULL,
	[OTC_U1000_Ded] [int] NULL,
	[OTC_1000_Ded] [int] NULL,
	[OTC_O1000_Ded] [int] NULL,
	[Auto_Vehicle_count_Coll_No_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Coll_U1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Coll_1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_Coll_O1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_No_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_U1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Vehicle_count_OTC_O1000_Ded_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Hired_Auto] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Non_Owned_Auto] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
