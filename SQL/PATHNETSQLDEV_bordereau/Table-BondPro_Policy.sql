IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Policy]') AND type in (N'U'))
DROP TABLE [dbo].[BondPro_Policy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BondPro_Policy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BondPro_Policy](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[Bond_Id] [char](16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bond_Number] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bond_Ren_Num] [int] NULL,
	[Effective_Date] [datetime] NULL,
	[Expiration_Date] [datetime] NULL,
	[Trans_Code] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Category] [char](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Principal_Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Principal_Address_1] [char](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Principal_Address_2] [char](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Principal_City] [char](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Principal_State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Principal_Zip] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Principal_Office_Phn] [char](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Principal_Fax] [char](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agent_Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agent_Address_1] [char](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agent_Address_2] [char](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agent_City] [char](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agent_State] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agent_Zip] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Agent_Comm_Rate] [decimal](9, 6) NULL,
	[GeneratedPolicyNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransDate] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reported_Date] [datetime] NULL,
	[ContractTypeDesc] [int] NULL,
	[ContinuousInd] [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[Producer_Code] [char](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insert_Date] [datetime] NULL,
 CONSTRAINT [BPPolicyPK] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
