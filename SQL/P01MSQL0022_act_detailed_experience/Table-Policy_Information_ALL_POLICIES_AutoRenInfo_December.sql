IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_AutoRenInfo_December]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_ALL_POLICIES_AutoRenInfo_December]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_ALL_POLICIES_AutoRenInfo_December]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_ALL_POLICIES_AutoRenInfo_December](
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AutoRen_Written_Premium_Range] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AutoRen_Consecutive_Prior_AutoRenewals] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AutoRen_Account_RepLoss_Ratio_NonCat_priorpolperiods_Range] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Loss_Ratio_CurrentPolicy_and_4PriorRenewals_100DaysPreExpDate] [float] NULL,
	[AutoRen_Loss_Ratio_5PriorRenewals_45DaysPreEffDate] [float] NULL,
	[Incurred_Claims_3YrsPrior_90DaysPreEffDate] [float] NULL,
	[Open_claims_3YrsPrior_90DaysPreEffDate] [float] NULL
) ON [PRIMARY]
END
GO
