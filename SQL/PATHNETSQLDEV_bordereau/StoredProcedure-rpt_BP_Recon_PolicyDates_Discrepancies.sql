IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_PolicyDates_Discrepancies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[rpt_BP_Recon_PolicyDates_Discrepancies]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_PolicyDates_Discrepancies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[rpt_BP_Recon_PolicyDates_Discrepancies] 
AS  

/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the bonds that have different effective or 
				expiration dates between APPS and BondPro for the BondPro reconciliation report.
				
        
 Called By:		BondPro Reconciliation Report    
        
 Syntax: Exec rpt_BP_Recon_PolicyDates_Discrepancies  
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:		Date:		Author:				Issue:		Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
  
***************************************************************************************************/

BEGIN

		SELECT BP_Bond_Number, APPS_PolicyNumber, BP_Effective_Date, APPS_Effective_Date, BP_Expiration_Date, APPS_Expiration_Date
		FROM BondPro_Reconciliation
		WHERE (
				BP_Effective_Date <> ISNULL(APPS_Effective_Date, ''01/01/1900'')
				OR
				BP_Expiration_Date <> ISNULL(APPS_Expiration_Date, ''01/01/1900'')
			  )

END--Proc' 
END
GO
