IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetPendCovEnd_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetPendCovEnd_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetPendCovEnd_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE dbo.INT_GetPendCovEnd_BOR 
@policynumber		VARCHAR(15)

AS  
/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the pending Grundy Policy coverage end. information.
				
				
				
        
 Called By:         
        
 Syntax: Exec INT_GetPendCovEnd_BOR ''GD20000000-00''   
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:  Date:  Author:    Issue:  Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
******************************************************************************************************/
DECLARE @errornum			INT 
SET @errornum = 0

SELECT c.GRUNDY_Coverage_ID,
	   c.EFFECT_DATE,
	   CASE WHEN c.CHANGE_ADD IN (''I'', ''B'') THEN ''C''
						  WHEN c.CHANGE_ADD = ''D'' THEN ''D''
						  ELSE '''' END AS Endorsement_Type,
	   CASE WHEN C.CHANGE_ADD = ''I'' THEN ''I''
					   WHEN C.CHANGE_ADD IN (''B'', ''D'') THEN ''B''
					   ELSE '''' END AS Address_Type,
	   ISNULL(c.CHANGE_LIA, '''') AS Change_In_Liability
FROM bordereau.dbo.GRUNDY_Coverage c
INNER JOIN bordereau.dbo.GRUNDY_Policy p
ON c.POLICY_NUM = p.POLICY_NUM
AND c.TransDate = p.TRANSDATE
INNER JOIN bordereau.dbo.GRUNDY_Policy_ERRORS e
on p.GRUNDY_Policy_ID = e.GRUNDY_Policy_ID
WHERE c.POLICY_NUM = SUBSTRING(@policynumber, 3,8)
AND c.REC_NUM = ''P''	
AND e.ERROR_ID = 326	

IF (@@ERROR <> 0)
	BEGIN
		SET @errornum = 1
		RETURN
	END
	
ELSE
	BEGIN
		SET @errornum = 0
		RETURN
	END

' 
END
GO
