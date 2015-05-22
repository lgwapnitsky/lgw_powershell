IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_PATHID_Information_Daily_Prior3]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_PATHID_Information_Daily_Prior3](
	[idnum] [int] NULL,
	[leadID] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[expiringpolicynumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policynumber_or_PATHID] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountnumber] [int] NULL,
	[accountname] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regioncode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regiondesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PICProducer] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerNumber] [int] NULL,
	[program] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[programdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClassDesc] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Detail_Name] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Name] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PolicyID] [uniqueidentifier] NULL,
	[ratingsourcecode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RatingSystemID] [bigint] NULL,
	[CompanyCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterName] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AsstUnderwriterName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountExecRepName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productline] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productshortdesc] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[producttype] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prodmixname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reportmixname] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewRenewalAuto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[effectivedate] [datetime] NULL,
	[effectiveMonth] [int] NULL,
	[effectiveYear] [int] NULL,
	[effectiveYearMonth] [int] NULL,
	[expirationdate] [datetime] NULL,
	[expirationMonth] [int] NULL,
	[expirationYear] [int] NULL,
	[expirationYearMonth] [int] NULL,
	[Insd_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_County] [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_Zip] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_Address1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[contactDate] [datetime] NULL,
	[contactpremium] [decimal](18, 2) NULL,
	[createddatetime] [datetime] NULL,
	[submissionDate_min] [datetime] NULL,
	[submissionDate_max] [datetime] NULL,
	[submissionPremium] [decimal](18, 2) NULL,
	[declinedSubmissionDate_min] [datetime] NULL,
	[declinedSubmissionDate_max] [datetime] NULL,
	[declinedSubmissionPremium] [decimal](18, 2) NULL,
	[quoteIssuedDate_min] [datetime] NULL,
	[quoteIssuedDate_max] [datetime] NULL,
	[quotedpremium] [decimal](18, 2) NULL,
	[declinedQuoteDate_min] [datetime] NULL,
	[declinedQuoteDate_max] [datetime] NULL,
	[declinedQuotePremium] [decimal](18, 2) NULL,
	[boundDate_min] [datetime] NULL,
	[boundDate_max] [datetime] NULL,
	[boundPremium] [decimal](15, 2) NULL,
	[FinalAccountingPremium] [decimal](38, 2) NULL,
	[APPS_PS_Currentwrittenpremium] [decimal](15, 2) NULL,
	[prevpolicynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_2] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_3] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_4] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_5] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_6] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_7] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prior_policynumber_8] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[Consecutive_Auto_Renewals] [int] NULL,
	[Number_of_SubsequentRenewals] [int] NULL,
	[QuoteExcludedUser] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SicCode] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SicDesc] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SICDivisionDesc] [nvarchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SICMajorGroupDesc] [nvarchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SICIndustryDesc] [nvarchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnderwriterGroup] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewRenewalAutoV2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewRenewalAutoV2ExpressAppInd] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PropertyCoverageForm] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insured_Years] [int] NULL,
	[Policy_Premium_Level_Marketing] [float] NULL,
	[Account_PY_Premium_Level_Marketing] [float] NULL,
	[Policy_Premium_Level] [float] NULL,
	[Account_PY_Premium_Level] [float] NULL,
	[Insured_Years_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range_for_Product] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SLD_BusinessType] [char](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SLD_Occurrence_Limit] [int] NULL,
	[SLD_NumOfEmployees] [int] NULL,
	[Account_ProductType_P] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_S] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_U] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_O] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_A] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_L] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_ALL] [varchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_ProductType_ALL_Desc] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_DO] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_EPL] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_Fid] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_WPV] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_FF_Cov_Internet] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_Cov_ALL] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_PV_Cov_DO] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_PV_Cov_EPL] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_PV_Cov_Fid] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policy_PV_Cov_Other] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PV_Cov_ALL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PriorityAccountLevelcurrent] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NationalParentAgencyYN] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupParentAgencyYN] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupParentAgencyNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupParentAgencyName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NationalParentAgencyNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NationalParentAgencyName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_ZipCode_3] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_ZipCode_5] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[lastinsert] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_Account_Premium_Range')
CREATE NONCLUSTERED INDEX [IX_Account_Premium_Range] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[Account_Premium_Range] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_AccountExecRepName')
CREATE NONCLUSTERED INDEX [IX_AccountExecRepName] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[AccountExecRepName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_accountname')
CREATE NONCLUSTERED INDEX [IX_accountname] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[accountname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_accountnumber')
CREATE NONCLUSTERED INDEX [IX_accountnumber] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[accountnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_AsstUnderwriterName')
CREATE NONCLUSTERED INDEX [IX_AsstUnderwriterName] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[AsstUnderwriterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_BusinessClassDesc')
CREATE NONCLUSTERED INDEX [IX_BusinessClassDesc] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[BusinessClassDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_CompanyCode')
CREATE NONCLUSTERED INDEX [IX_CompanyCode] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[CompanyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_DivisionName')
CREATE NONCLUSTERED INDEX [IX_DivisionName] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[DivisionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_idnum')
CREATE NONCLUSTERED INDEX [IX_idnum] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[idnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_NewRenewalAuto')
CREATE NONCLUSTERED INDEX [IX_NewRenewalAuto] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[NewRenewalAuto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_PICProducer')
CREATE NONCLUSTERED INDEX [IX_PICProducer] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[PICProducer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_Policynumber')
CREATE NONCLUSTERED INDEX [IX_Policynumber] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_Policynumber_or_PATHID')
CREATE NONCLUSTERED INDEX [IX_Policynumber_or_PATHID] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[Policynumber_or_PATHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_PrimaryProducer')
CREATE NONCLUSTERED INDEX [IX_PrimaryProducer] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[PrimaryProducer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_prodmixname')
CREATE NONCLUSTERED INDEX [IX_prodmixname] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[prodmixname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_Product_group')
CREATE NONCLUSTERED INDEX [IX_Product_group] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[Product_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_productcode')
CREATE NONCLUSTERED INDEX [IX_productcode] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[productcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_ProductTypeName')
CREATE NONCLUSTERED INDEX [IX_ProductTypeName] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[ProductTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_program')
CREATE NONCLUSTERED INDEX [IX_program] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[program] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_regiondesc')
CREATE NONCLUSTERED INDEX [IX_regiondesc] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[regiondesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_reportmixname')
CREATE NONCLUSTERED INDEX [IX_reportmixname] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[reportmixname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_Source_Detail_Name')
CREATE NONCLUSTERED INDEX [IX_Source_Detail_Name] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[Source_Detail_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_SourceName')
CREATE NONCLUSTERED INDEX [IX_SourceName] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[Source_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_underwriterName')
CREATE NONCLUSTERED INDEX [IX_underwriterName] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[underwriterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_PATHID_Information_Daily_Prior3]') AND name = N'IX_Written_Premium_Range')
CREATE NONCLUSTERED INDEX [IX_Written_Premium_Range] ON [dbo].[Policy_PATHID_Information_Daily_Prior3]
(
	[Written_Premium_Range] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
