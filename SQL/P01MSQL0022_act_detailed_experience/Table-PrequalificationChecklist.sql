IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrequalificationChecklist]') AND type in (N'U'))
DROP TABLE [dbo].[PrequalificationChecklist]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrequalificationChecklist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PrequalificationChecklist](
	[PathID] [int] NOT NULL,
	[ParentQuestionID] [int] NULL,
	[SurveyQuestionID] [bigint] NOT NULL,
	[ParentQuestionText] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QuestionText] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[QuestionAnswerText] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QuestionAnswerNumber] [int] NULL,
	[QuestionAnswerAmount] [decimal](18, 9) NULL,
	[QuestionAnswerDate] [datetime] NULL,
	[ResponseText] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
