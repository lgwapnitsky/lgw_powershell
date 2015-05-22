IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_Producer_Discrepancies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[rpt_BP_Recon_Producer_Discrepancies]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_Producer_Discrepancies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[rpt_BP_Recon_Producer_Discrepancies] 
AS  

/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the bonds that have different producer codes 
				between APPS and BondPro for the BondPro reconciliation report.
				
        
 Called By:		BondPro Reconciliation Report    
        
 Syntax: Exec rpt_BP_Recon_Producer_Discrepancies  
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:		Date:		Author:				Issue:		Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
  
***************************************************************************************************/

BEGIN

		SELECT BP_Bond_Number, APPS_PolicyNumber, BP_Client_Code, APPS_Producer_Code, BP_Agent_Commission, APPS_AGent_Commission
		FROM BondPro_Reconciliation
		WHERE (
				APPS_Producer_Code = 117015
				OR
				BP_Client_Code <> ISNULL(APPS_Producer_Code, '''')
				OR 
				ROUND(BP_AGent_Commission, 1) <> ROUND(ISNULL(APPS_Agent_Commission, 0.00), 1)
			  )
		AND Cancelled <> ''Flat Cancellation''

END--Proc' 
END
GO
