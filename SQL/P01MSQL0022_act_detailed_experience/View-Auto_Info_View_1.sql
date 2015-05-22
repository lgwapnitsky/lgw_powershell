IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Info_View_1]'))
DROP VIEW [dbo].[Auto_Info_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Auto_Info_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Auto_Info_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_B.accountnumber, dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_All_count, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_Truck_count, dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_PPT_count, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_Buses_count, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_OtherPublic_count, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_VanPools_count, 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.Auto_Vehicle_Other_count, dbo.Policy_Information_ALL_POLICIES_AUTO_B.policynumber
FROM         dbo.Policy_Information_ALL_POLICIES_AUTO_B LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_B ON 
                      dbo.Policy_Information_ALL_POLICIES_AUTO_B.policynumber = dbo.Policy_Information_ALL_POLICIES_B.policynumber
' 
GO
