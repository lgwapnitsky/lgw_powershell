IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_NotInAPPS_Discrepancies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[rpt_BP_Recon_NotInAPPS_Discrepancies]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_Recon_NotInAPPS_Discrepancies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[rpt_BP_Recon_NotInAPPS_Discrepancies] 
AS  

/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the bonds that are in BondPro but not in APPS for the 
				BondPro reconciliation report.
				
        
 Called By:		BondPro Reconciliation Report    
        
 Syntax: Exec rpt_BP_Recon_NotInAPPS_Discrepancies  
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:		Date:		Author:				Issue:		Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
  
***************************************************************************************************/ 

BEGIN

		SELECT Bond_Number, Gross_Premium, Bond_Amount, SAA_Code
		FROM BondPro_NoGUID
		
END--Proc' 
END
GO
