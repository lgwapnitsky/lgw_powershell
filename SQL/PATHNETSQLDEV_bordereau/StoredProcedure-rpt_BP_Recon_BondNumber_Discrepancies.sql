IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_BondNumber_Discrepancies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[rpt_BP_Recon_BondNumber_Discrepancies]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_BondNumber_Discrepancies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[rpt_BP_Recon_BondNumber_Discrepancies] 
AS  

/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the bonds that have different Bond numbers 
				between APPS and BondPro for the BondPro reconciliation report.
				
        
 Called By:		BondPro Reconciliation Report    
        
 Syntax: Exec rpt_BP_Recon_BondNumber_Discrepancies  
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:		Date:		Author:				Issue:		Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
  
***************************************************************************************************/ 

BEGIN

		SELECT BP_Bond_Number, APPS_Bond_Number, BP_Gross_Premium, BP_Bond_Amount
		FROM BondPro_Reconciliation 
		WHERE BP_Bond_Number <> ISNULL(APPS_Bond_Number, '''')
	
END--Proc' 
END
GO
