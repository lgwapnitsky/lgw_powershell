IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_APPS_Only_Policies_2]') AND type in (N'U'))
DROP TABLE [dbo].[sb_APPS_Only_Policies_2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sb_APPS_Only_Policies_2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sb_APPS_Only_Policies_2](
	[idnum] [int] NULL,
	[leadID] [int] NOT NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[expiringpolicynumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statusdesc3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Policynumber_or_PATHID] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[accountnumber] [int] NOT NULL,
	[accountname] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regioncode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regiondesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PICProducer] [varchar](42) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerNumber] [int] NULL,
	[program] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[programdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClassDesc] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Detail_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyid] [uniqueidentifier] NULL,
	[ratingsourcecode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RatingSystemID] [bigint] NULL,
	[CompanyCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterName] [varchar](42) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AsstUnderwriterName] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountExecRepName] [varchar](42) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[Insd_Address1] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[contactDate] [int] NULL,
	[contactpremium] [int] NULL,
	[createddatetime] [int] NULL,
	[submissionDate_min] [int] NULL,
	[submissionDate_max] [int] NULL,
	[submissionPremium] [int] NULL,
	[declinedSubmissionDate_min] [int] NULL,
	[declinedSubmissionDate_max] [int] NULL,
	[declinedSubmissionPremium] [int] NULL,
	[quoteIssuedDate_min] [int] NULL,
	[quoteIssuedDate_max] [int] NULL,
	[quotedpremium] [int] NULL,
	[declinedQuoteDate_min] [int] NULL,
	[declinedQuoteDate_max] [int] NULL,
	[declinedQuotePremium] [int] NULL,
	[boundDate_min] [int] NULL,
	[boundDate_max] [int] NULL,
	[boundPremium] [int] NULL,
	[FinalAccountingPremium] [int] NULL,
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
