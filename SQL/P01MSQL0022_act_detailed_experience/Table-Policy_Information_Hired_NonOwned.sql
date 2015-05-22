IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Hired_NonOwned]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_Hired_NonOwned]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Hired_NonOwned]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_Hired_NonOwned](
	[maxeffdate] [datetime] NULL,
	[accountnumber] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Productcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyEffectivedate] [datetime] NULL,
	[policyid] [int] NOT NULL,
	[Account_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Property_Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Umbrella] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterPID] [int] NULL,
	[Companycode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billplancode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[product_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_monoline] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_effective_year] [int] NULL,
	[policy_effective_month] [int] NULL,
	[policyexpirationdate] [datetime] NULL,
	[canceldate] [datetime] NULL,
	[reinstatementdate] [datetime] NULL,
	[Prior_Policy_number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branchcode] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renew_New_Auto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FAY_For_Review] [int] NULL,
	[First_Policy_Year_Temp] [datetime] NULL,
	[Last_Reporting_Year] [int] NULL,
	[Last_Reporting_Month] [int] NULL,
	[Term_factor] [float] NULL,
	[Latest_PY] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Policy_Year] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[written_premium_policy] [float] NULL,
	[underwriter] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillplanshortDesc] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Office] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zipcode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAICS] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Program_Code] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Business_Desc] [char](72) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[East_MidWest_West_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County] [nvarchar](511) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density] [float] NULL,
	[program] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range_for_Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County_Pop_Density_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[prior_policynumber_2] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_3] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_4] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_5] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_6] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_7] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_8] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Renewals_Range] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_Producer_code] [int] NULL,
	[PIC_Commission_pct] [float] NULL,
	[Primary_Producer_code] [int] NULL,
	[Primary_Commission_pct] [float] NULL,
	[PIC_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIC_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Producer_type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Commission_pct] [float] NULL,
	[Count_of_Account_Numbers] [float] NULL,
	[Count_of_Account_Numbers_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Hired_NonOwned]') AND name = N'IX_accountnumber')
CREATE NONCLUSTERED INDEX [IX_accountnumber] ON [dbo].[Policy_Information_Hired_NonOwned]
(
	[accountnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Hired_NonOwned]') AND name = N'IX_policynumber')
CREATE NONCLUSTERED INDEX [IX_policynumber] ON [dbo].[Policy_Information_Hired_NonOwned]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
