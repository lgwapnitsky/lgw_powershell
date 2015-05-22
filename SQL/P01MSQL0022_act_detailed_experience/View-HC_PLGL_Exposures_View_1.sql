IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_PLGL_Exposures_View_1]'))
DROP VIEW [dbo].[HC_PLGL_Exposures_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[HC_PLGL_Exposures_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.HC_PLGL_Exposures_View_1
AS
SELECT     dbo.Policy_Information_ALL_POLICIES_January.Account_Name, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.POLICY_NUMBER, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.EFFDATE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.EXPDATE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.STATE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TERRITORY, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.SUBLINE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.CLASS_CODE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.PREM, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.EXPOSURE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.EXP_MOD, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.IND_RATE_MOD, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.SCHED_MOD, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.PREM_SIZE_CREDIT, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.AGENCY_PREM, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.RESIDENTIAL_PREM, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.DOCTORATE_PREM, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.GRADUATE_PREM, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.OTHER_COUNSELOR_PREM, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TEACHER_NUTRITIONIST_PREM, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.AGENCY_RATE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.RESIDENTIAL_RATE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.DOCTORATE_RATE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.GRADUATE_RATE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.OTHER_COUNSELOR_RATE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TEACHER_NUTRITIONIST_RATE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.AGENCY_EXPOSURE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.RESIDENTIAL_EXPOSURE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.DOCTORATE_EXPOSURE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.GRADUATE_EXPOSURE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.OTHER_COUNSELOR_EXPOSURE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TEACHER_NUTRITIONIST_EXPOSURE, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.EXPOSURE_GRADE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.ILF, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.LIMIT, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.AGG_LIMIT, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.PMA_FACTOR, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.PMA_DESCRIPTION, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.BUSINESS_TYPE, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.LCM, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.IRM007, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.IRM008, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.ILF_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.PACK_MOD_IND, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.AGENCY_PREM_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.RESIDENTIAL_PREM_IND, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.DOCTORATE_PREM_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.GRADUATE_PREM_IND, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.OTHER_COUNSELOR_PREM_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TEACHER_NUTRITIONIST_PREM_IND, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TOTAL_PREM_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.AGENCY_RATE_IND, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.RESIDENTIAL_RATE_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.DOCTORATE_RATE_IND, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.GRADUATE_RATE_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.OTHER_COUNSELOR_RATE_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TEACHER_NUTRITIONIST_RATE_IND, PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.TOTAL_RATE_IND, 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.LCM_IND, dbo.Policy_Information_ALL_POLICIES_January.Productcode, 
                      dbo.Policy_Information_ALL_POLICIES_January.Renew_New_Auto, dbo.Policy_Information_ALL_POLICIES_January.underwriter, 
                      dbo.Policy_Information_ALL_POLICIES_January.Branch_Region, dbo.Policy_Information_ALL_POLICIES_January.program, 
                      dbo.Policy_Information_ALL_POLICIES_January.PIC_Producer, dbo.Policy_Information_ALL_POLICIES_January.Primary_Producer, 
                      dbo.Policy_Information_ALL_POLICIES_January.BusinessClassDesc, dbo.Policy_Information_ALL_POLICIES_January.Source_Detail_Name, 
                      dbo.Policy_Information_ALL_POLICIES_January.ProductType, dbo.Policy_Information_ALL_POLICIES_January.policy_effective_year, 
                      dbo.Policy_Information_ALL_POLICIES_January.policy_effective_month
FROM         PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC LEFT OUTER JOIN
                      dbo.Policy_Information_ALL_POLICIES_January ON 
                      PriceMonitor.dbo.AQS_DETAIL_PLGL_SPC.POLICY_NUMBER = dbo.Policy_Information_ALL_POLICIES_January.policynumber
WHERE     (dbo.Policy_Information_ALL_POLICIES_January.Productcode = ''HC'')
' 
GO
