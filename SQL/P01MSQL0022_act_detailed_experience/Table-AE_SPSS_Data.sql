IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AE_SPSS_Data]') AND type in (N'U'))
DROP TABLE [dbo].[AE_SPSS_Data]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AE_SPSS_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AE_SPSS_Data](
	[currentearnedpremium] [decimal](38, 2) NOT NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](38, 2) NOT NULL,
	[Capped_Incurred_Loss_ALAE_with_SS_wo_cat] [decimal](38, 2) NOT NULL,
	[Incurred_Claims] [decimal](38, 2) NOT NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Group] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Clean_Warranty_Letter_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price_Monitor_Standard_Cov_Grp_Monitored_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Engagement_Letters_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Supp_Claim_Form_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Prior_Coverage_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Suits_For_Fees_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Qualified_Peer_Review_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Successful_Peer_Review_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Prior_Coverage_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Attestation_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Audit_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BookKeeping_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Compilation_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Corporate_Financial_Planning_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Corporate_Tax_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Data_Processing_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Individual_Tax_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MAS_Services_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Other_Assurance_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Personal_Financial_Planning_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Review_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SEC_Work_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Limit_Type_Trim] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Revenue_Per_Accountant_Range] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Limit_Trim] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Revenues_range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Program_Type] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Years_Prior_to_Retro] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Num_of_Accountants_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AE_Accountant_Type] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total_EarnedPrem] [float] NULL,
	[Earned_weight] [float] NULL,
	[Earned_weight_max] [float] NULL,
	[Earned_Weight_Norm] [float] NULL,
	[Loss_Ratio] [float] NULL
) ON [PRIMARY]
END
GO
