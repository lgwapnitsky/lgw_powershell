IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_AUTO_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_ALL_POLICIES_AUTO_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_AUTO_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1
AS
SELECT     policynumber, PolicyID, Auto_Vehicle_All_count, Auto_Vehicle_Truck_count, Auto_Vehicle_PPT_count, Auto_Vehicle_Buses_count, Auto_Vehicle_VanPools_count, 
                      Auto_Vehicle_OtherPublic_count, Auto_Vehicle_Other_count, Auto_Vehicle_Dual_Control_count, Auto_Vehicle_count_Total_Range, Auto_Vehicle_count_Truck_Range, 
                      Auto_Vehicle_count_PPT_Range, Auto_Vehicle_count_Buses_Range, Auto_Vehicle_count_VanPools_Range, Auto_Vehicle_count_OtherPublic_Range, 
                      Auto_Vehicle_count_Other_Range, Auto_Vehicle_count_Dual_Control_Range, Auto_Vehicle_count_Dual_Control_Percent_Range, Driving_School, Coll_No_Ded, 
                      Coll_U1000_Ded, Coll_1000_Ded, Coll_O1000_Ded, OTC_No_Ded, OTC_U1000_Ded, OTC_1000_Ded, OTC_O1000_Ded, Auto_Vehicle_count_Coll_No_Ded_Range, 
                      Auto_Vehicle_count_Coll_U1000_Ded_Range, Auto_Vehicle_count_Coll_1000_Ded_Range, Auto_Vehicle_count_Coll_O1000_Ded_Range, 
                      Auto_Vehicle_count_OTC_No_Ded_Range, Auto_Vehicle_count_OTC_U1000_Ded_Range, Auto_Vehicle_count_OTC_1000_Ded_Range, 
                      Auto_Vehicle_count_OTC_O1000_Ded_Range, Hired_Auto, Non_Owned_Auto
FROM         dbo.Policy_Information_ALL_POLICIES_AUTO_June
' 
GO
