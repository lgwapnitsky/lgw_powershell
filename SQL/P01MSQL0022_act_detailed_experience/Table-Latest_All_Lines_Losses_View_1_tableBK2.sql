IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND type in (N'U'))
DROP TABLE [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Latest_All_Lines_Losses_View_1_tableBK2](
	[Claim_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Reporting_group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coverage_Form] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_Year] [int] NULL,
	[Fiscal_AY_Year] [float] NULL,
	[Type_of_Loss_Desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claim_Desc] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Case_Loss] [decimal](15, 2) NULL,
	[Case_ALAE] [decimal](15, 2) NULL,
	[Paid_Loss] [decimal](15, 2) NULL,
	[Paid_ALAE] [decimal](15, 2) NULL,
	[Sal_Subro] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_NonCat] [decimal](15, 2) NULL,
	[Incurred_Loss_ALAE_with_SS_CatOnly] [decimal](15, 2) NULL,
	[Reported_Claims] [decimal](15, 2) NULL,
	[Open_Claims] [decimal](15, 2) NULL,
	[Closed_With_Pay_Claims] [decimal](15, 2) NULL,
	[Closed_Without_Pay_Claims] [decimal](15, 2) NULL,
	[Incurred_Claims] [decimal](15, 2) NULL,
	[Coverage_Group] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[report_year] [int] NULL,
	[report_month] [int] NULL,
	[policy_year] [int] NULL,
	[policy_month] [int] NULL,
	[Type_of_Loss] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Accident_State_for_join] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exp_product] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Region_in_State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GL_Dom_Terr_Description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[reportmixname] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prodmixname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyCode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountnumber] [int] NULL,
	[productcode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[productdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source_Detail_Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessClassDesc] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[producttype] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Account_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducer] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PICProducer] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Written_Premium_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Renewals] [int] NULL,
	[regiondesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[underwriterName] [varchar](102) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewRenewalAuto] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product_group] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accountname] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_SubsequentRenewals] [int] NULL,
	[Policy_Number] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryProducerNumber] [int] NULL,
	[effectivedate] [datetime] NULL,
	[effectiveYear] [int] NULL,
	[effectiveMonth] [int] NULL,
	[effectiveYearMonth] [int] NULL,
	[expirationdate] [datetime] NULL,
	[expirationMonth] [int] NULL,
	[expirationYear] [int] NULL,
	[expirationYearMonth] [int] NULL,
	[Insd_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insd_Zip] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insured_Years] [int] NULL,
	[Insured_Years_Range] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SLD_BusinessType] [char](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PV_Cov_ALL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FF_Cov_ALL] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[programdesc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Premium_State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statecode] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Accident_State_for_join')
CREATE NONCLUSTERED INDEX [IX_Accident_State_for_join] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Accident_State_for_join] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Account_Premium_Range')
CREATE NONCLUSTERED INDEX [IX_Account_Premium_Range] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Account_Premium_Range] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_accountname')
CREATE NONCLUSTERED INDEX [IX_accountname] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[accountname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_accountnumber')
CREATE NONCLUSTERED INDEX [IX_accountnumber] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[accountnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_BusinessClassDesc')
CREATE NONCLUSTERED INDEX [IX_BusinessClassDesc] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[BusinessClassDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_CompanyCode')
CREATE NONCLUSTERED INDEX [IX_CompanyCode] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[CompanyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Coverage_Form')
CREATE NONCLUSTERED INDEX [IX_Coverage_Form] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Coverage_Form] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Coverage_Group')
CREATE NONCLUSTERED INDEX [IX_Coverage_Group] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Coverage_Group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Coverage_Reporting_group')
CREATE NONCLUSTERED INDEX [IX_Coverage_Reporting_group] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Coverage_Reporting_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_DivisionName')
CREATE NONCLUSTERED INDEX [IX_DivisionName] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[DivisionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Fiscal_AY_Year')
CREATE NONCLUSTERED INDEX [IX_Fiscal_AY_Year] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Fiscal_AY_Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_GL_Dom_Region_in_State')
CREATE NONCLUSTERED INDEX [IX_GL_Dom_Region_in_State] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[GL_Dom_Region_in_State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_GL_Dom_Terr_Description')
CREATE NONCLUSTERED INDEX [IX_GL_Dom_Terr_Description] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[GL_Dom_Terr_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_NewRenewalAuto')
CREATE NONCLUSTERED INDEX [IX_NewRenewalAuto] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[NewRenewalAuto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_PICProducer')
CREATE NONCLUSTERED INDEX [IX_PICProducer] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[PICProducer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_policynumber')
CREATE NONCLUSTERED INDEX [IX_policynumber] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_PrimaryProducer')
CREATE NONCLUSTERED INDEX [IX_PrimaryProducer] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[PrimaryProducer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_prodmixname')
CREATE NONCLUSTERED INDEX [IX_prodmixname] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[prodmixname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Product_group')
CREATE NONCLUSTERED INDEX [IX_Product_group] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Product_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_productcode')
CREATE NONCLUSTERED INDEX [IX_productcode] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[productcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_ProductTypeName')
CREATE NONCLUSTERED INDEX [IX_ProductTypeName] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[ProductTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_program')
CREATE NONCLUSTERED INDEX [IX_program] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[program] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_regiondesc')
CREATE NONCLUSTERED INDEX [IX_regiondesc] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[regiondesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_reportmixname')
CREATE NONCLUSTERED INDEX [IX_reportmixname] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[reportmixname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_SLD_BusinessType')
CREATE NONCLUSTERED INDEX [IX_SLD_BusinessType] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[SLD_BusinessType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Source_Detail_Name')
CREATE NONCLUSTERED INDEX [IX_Source_Detail_Name] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Source_Detail_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_underwriterName')
CREATE NONCLUSTERED INDEX [IX_underwriterName] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[underwriterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Latest_All_Lines_Losses_View_1_tableBK2]') AND name = N'IX_Written_Premium_Range')
CREATE NONCLUSTERED INDEX [IX_Written_Premium_Range] ON [dbo].[Latest_All_Lines_Losses_View_1_tableBK2]
(
	[Written_Premium_Range] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
