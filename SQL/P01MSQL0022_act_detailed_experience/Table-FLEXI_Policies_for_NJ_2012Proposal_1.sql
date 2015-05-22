IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FLEXI_Policies_for_NJ_2012Proposal_1]') AND type in (N'U'))
DROP TABLE [dbo].[FLEXI_Policies_for_NJ_2012Proposal_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FLEXI_Policies_for_NJ_2012Proposal_1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FLEXI_Policies_for_NJ_2012Proposal_1](
	[Policy] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExpDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountNumber] [float] NULL,
	[Coverage] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Territory] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zone] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subline] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Classcode] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employees] [float] NULL,
	[RatingClassImpl] [float] NULL,
	[RatingClassOnFile] [float] NULL,
	[RatingClassProposed(PV)] [float] NULL,
	[Business Type] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exposure] [float] NULL,
	[ImplBaseRate] [float] NULL,
	[OnFileBaseRate] [float] NULL,
	[Prop(Current)BaseRate] [float] NULL,
	[Prop(PV)BaseRate] [float] NULL,
	[FinalPremium] [float] NULL,
	[ImplPrem] [float] NULL,
	[OnFilePrem] [float] NULL,
	[PropPrem(Current)] [float] NULL,
	[PropPrem(PV)] [float] NULL,
	[Impl/AQS] [float] NULL,
	[OnFile/Impl] [float] NULL,
	[Prop(Current)/OnFile] [float] NULL,
	[Prop(PV)/OnFile] [float] NULL,
	[Proposal] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Changes] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[Loss_Ratio_EPL] [float] NULL,
	[Loss_Ratio_EPL_Range] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccntUltLossForCov] [float] NULL,
	[AccntEPForCov] [float] NULL,
	[Proposed(Curr) w/o JM] [float] NULL,
	[Proposed(PV) w/o JM] [float] NULL,
	[JM Dollars] [float] NULL,
	[JM Dollars (PV)] [float] NULL,
	[SchedMod] [float] NULL,
	[MiscMod] [float] NULL,
	[AccountName] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EffectiveDate] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
