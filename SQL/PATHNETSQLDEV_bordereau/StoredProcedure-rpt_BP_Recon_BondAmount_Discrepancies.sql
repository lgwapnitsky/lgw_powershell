IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_BondAmount_Discrepancies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[rpt_BP_Recon_BondAmount_Discrepancies]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_BondAmount_Discrepancies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[rpt_BP_Recon_BondAmount_Discrepancies] 
AS  

/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the bonds that have different Bond Amounts 
				between APPS and BondPro for the BondPro reconciliation report.
				
        
 Called By:		BondPro Reconciliation Report    
        
 Syntax: Exec rpt_BP_Recon_BondAmount_Discrepancies  
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:		Date:		Author:				Issue:		Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
  
***************************************************************************************************/
BEGIN

		SELECT BP_Bond_Number, APPS_PolicyNumber, BP_Bond_Amount, ISNULL(APPS_Bond_Amount, 0.00) AS APPS_Bond_Amount,
		BP_Gross_Premium
		FROM BondPro_Reconciliation
		WHERE BP_Bond_Amount <> ISNULL(APPS_Bond_Amount, 0.00)
		AND Cancelled <> ''Flat Cancellation'' 

END--Proc' 
END
GO
