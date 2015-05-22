IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_VS_tempa]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_VS_tempa]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_VS_tempa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_VS_tempa](
	[accountnumber] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyeffectivedate] [datetime] NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[acctngyear] [int] NULL,
	[billplancode] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[billplanshortdesc] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product_Group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Package_Monoline] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policy_effective_year] [int] NULL,
	[policy_effective_month] [int] NULL,
	[Prior_Policy_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[New_Renew_Tail] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branchcode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Office] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Branch_Region] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[PATH_CreateDate] [datetime] NULL,
	[zipcode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NAICS] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
