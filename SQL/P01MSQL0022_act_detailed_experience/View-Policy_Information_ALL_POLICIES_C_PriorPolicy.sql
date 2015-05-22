IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_C_PriorPolicy]'))
DROP VIEW [dbo].[Policy_Information_ALL_POLICIES_C_PriorPolicy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_C_PriorPolicy]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.Policy_Information_ALL_POLICIES_C_PriorPolicy
AS
SELECT     Policy_Information_ALL_POLICIES_C_1.*
FROM         dbo.Policy_Information_ALL_POLICIES_C AS Policy_Information_ALL_POLICIES_C_1
' 
GO
