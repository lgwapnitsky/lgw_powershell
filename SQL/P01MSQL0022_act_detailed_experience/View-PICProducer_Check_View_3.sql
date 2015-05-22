IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PICProducer_Check_View_3]'))
DROP VIEW [dbo].[PICProducer_Check_View_3]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PICProducer_Check_View_3]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.PICProducer_Check_View_3
AS
SELECT     PathNet2.dbo.PathTransaction.PathID, LTRIM(RTRIM(PathNet2.dbo.Entity.LastName)) + CASE WHEN (LTRIM(RTRIM(Entity.FirstName)) <> '''' AND 
                      LTRIM(RTRIM(Entity.FirstName)) IS NOT NULL) THEN '', '' + LTRIM(RTRIM(Entity.FirstName)) ELSE '''' END AS PICProducer
FROM         PathNet2.dbo.LogEntry RIGHT OUTER JOIN
                      PathNet2.dbo.WorkflowStep RIGHT OUTER JOIN
                      PathNet2.dbo.TransactionState ON 
                      PathNet2.dbo.WorkflowStep.TransactionStateID = PathNet2.dbo.TransactionState.TransactionStateID RIGHT OUTER JOIN
                      PathNet2.dbo.Action ON PathNet2.dbo.WorkflowStep.ActionID = PathNet2.dbo.Action.ActionID ON 
                      PathNet2.dbo.LogEntry.WorkflowStepID = PathNet2.dbo.WorkflowStep.WorkflowStepID RIGHT OUTER JOIN
                      PathNet2.dbo.PathTransaction RIGHT OUTER JOIN
                      PathNet2.dbo.TransactionType ON 
                      PathNet2.dbo.PathTransaction.TransactionTypeID = PathNet2.dbo.TransactionType.TransactionTypeID LEFT OUTER JOIN
                      PathNet2.dbo.PolicySnapshot ON PathNet2.dbo.PathTransaction.TransactionID = PathNet2.dbo.PolicySnapshot.TransactionID RIGHT OUTER JOIN
                      PathNet2.dbo.Entity ON PathNet2.dbo.PolicySnapshot.PrimaryProducerEntityID = PathNet2.dbo.Entity.EntityID ON 
                      PathNet2.dbo.LogEntry.TransactionID = PathNet2.dbo.PathTransaction.TransactionID
WHERE     (PathNet2.dbo.TransactionState.TransactionStateName IN (''Bound'', ''Issued'')) OR
                      (PathNet2.dbo.Action.PathCode IN (''1'', ''2'', ''3'', ''4'', ''10'', ''11'', ''12'', ''13'', ''14'', ''17'', ''18'', ''34'', ''35'', ''88'', ''114'', ''117'', ''118'', ''143'', ''160'', ''164'', ''165''))
' 
GO
