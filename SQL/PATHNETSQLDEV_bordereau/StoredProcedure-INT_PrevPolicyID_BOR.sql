IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_PrevPolicyID_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_PrevPolicyID_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_PrevPolicyID_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE dbo.INT_PrevPolicyID_BOR 
@policynumber		VARCHAR(15),
@prevPolicyID		INT OUTPUT
AS  
/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the last successful Grundy Policy ID for a particular
				policy number
        
 Called By:         
        
 Syntax: Exec INT_PrevPolicyID_BOR ''GD20000000-00'', @policyID OUTPUT        
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:  Date:  Author:    Issue:  Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
******************************************************************************************************/


SELECT top 1 @prevPolicyID =  gp.GRUNDY_Policy_ID
FROM bordereau.dbo.GRUNDY_Policy gp
INNER JOIN bordereau.dbo.GRUNDY_Policy_ERRORS e
ON gp.GRUNDY_Policy_ID = e.GRUNDY_Policy_ID
WHERE gp.GenPolicyNumber = @policynumber
AND e.ERROR_ID IN (2, 326, 926, 927)
AND EXISTS (SELECT ''X'' FROM AccessPHLY..INT_Policy WITH (NOLOCK)
			WHERE Policy_Number = @policynumber
			AND Quote_Number = gp.GRUNDY_Policy_ID)
ORDER BY TRANSDATE DESC


IF (@prevPolicyID IS NULL)
	BEGIN
		SET @prevPolicyID = -1
	END
	
RETURN @prevPolicyID' 
END
GO
