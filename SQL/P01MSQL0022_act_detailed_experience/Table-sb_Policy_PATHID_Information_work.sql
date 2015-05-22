IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_PATHID_Information_work]') AND type in (N'U'))
DROP TABLE [dbo].[sb_Policy_PATHID_Information_work]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_PATHID_Information_work]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_Policy_PATHID_Information_work](
	[idnum] [int] NULL,
	[leadID] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[expiringpolicynumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statusdesc3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policynumber_or_PATHID] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountnumber] [int] NULL,
	[accountname] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regioncode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regiondesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PICProducer] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerNumber] [int] NULL,
	[program] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[programdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClassDesc] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Detail_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PolicyID] [uniqueidentifier] NULL,
	[ratingsourcecode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RatingSystemID] [bigint] NULL,
	[CompanyCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterName] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AsstUnderwriterName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountExecRepName] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[APPS_PS_Currentwrittenpremium] [decimal](38, 2) NULL,
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
	[SICCode] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SICDesc] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SICDivisionDesc] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SICMajorGroupDesc] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SICIndustryDesc] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnderwriterGroup] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NewRenewalAutoV2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewRenewalAutoV2ExpressAppInd] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PropertyCoverageForm] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_PATHID_Information_work]') AND name = N'idx_src_Expdte')
CREATE NONCLUSTERED INDEX [idx_src_Expdte] ON [dbo].[sb_Policy_PATHID_Information_work]
(
	[expirationdate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_PATHID_Information_work]') AND name = N'idx_src_pol')
CREATE NONCLUSTERED INDEX [idx_src_pol] ON [dbo].[sb_Policy_PATHID_Information_work]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[sb_Policy_PATHID_Information_work]') AND name = N'idx_src_polpath')
CREATE NONCLUSTERED INDEX [idx_src_polpath] ON [dbo].[sb_Policy_PATHID_Information_work]
(
	[Policynumber_or_PATHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
