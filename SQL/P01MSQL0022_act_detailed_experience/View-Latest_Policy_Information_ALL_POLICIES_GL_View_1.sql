IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_GL_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_ALL_POLICIES_GL_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_ALL_POLICIES_GL_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1
AS
SELECT     policynumber, policyid, GL_Occurrence_Limit, GL_Aggregate_Limit, GL_Deductible, GLDX_Indicator, SAM_Exclusion_from_CG_21_46, SAM_Form_PI_SS_2, 
                      SAM_Form_PI_SO_008, SAM_Form_PI_SO_007, SAM_Form_PI_HF_11, SAM_Form_PI_CAM_003, SAM_PI_SS_2_OCC_Limit, SAM_PI_SS_2_Agg_Limit, 
                      SAM_PI_SO_008_OCC_Limit, SAM_PI_SO_008_Agg_Limit, SAM_PI_SO_007_OCC_Limit, SAM_PI_SO_007_Agg_Limit, SAM_PI_HF_11_OCC_Limit, 
                      SAM_PI_HF_11_Agg_Limit, SAM_PI_CAM_003_OCC_Limit, SAM_PI_CAM_003_Agg_Limit, SAM_Form, SAM_OCC_Limit, SAM_Agg_Limit, SAM_Form_Group
FROM         dbo.Policy_Information_ALL_POLICIES_GL_June
' 
GO
