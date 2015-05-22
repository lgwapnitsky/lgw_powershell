IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PrequalificationChecklist_View_1]'))
DROP VIEW [dbo].[PrequalificationChecklist_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PrequalificationChecklist_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PrequalificationChecklist_View_1
AS
SELECT     PathID, ParentQuestionID, SurveyQuestionID, QuestionText, QuestionAnswerText, QuestionAnswerNumber, QuestionAnswerAmount, QuestionAnswerDate, 
                      ResponseText, ParentQuestionText
FROM         dbo.PrequalificationChecklist
' 
GO
