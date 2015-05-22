IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_ReconciliationSummaries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[rpt_BP_ReconciliationSummaries]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rpt_BP_ReconciliationSummaries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[rpt_BP_ReconciliationSummaries] 
AS  

/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to obtain the summary information that is used for the 
				BondPro reconciliation report.
				
        
 Called By:		BondPro Reconciliation Report    
        
 Syntax: Exec rpt_BP_ReconciliationSummaries  
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:		Date:		Author:				Issue:		Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
  
***************************************************************************************************/  
BEGIN
		DECLARE @reportDate				DATETIME,
				@BP_Gross_Prem_SUM		DECIMAL(11,2),
				@APPS_Gross_Prem_SUM	DECIMAL(15,2),
				@BP_Bond_Amt_SUM		DECIMAL(11,2),
				@APPS_Bond_Amt_SUM		DECIMAL(15,2),
				@Gross_Premium_Diff		DECIMAL(15,2),
				@Bond_Amount_Diff		DECIMAL(15,2)
				
		SET @reportDate = ''01/01/1900''
		SET @BP_Gross_Prem_SUM = 0.00
		SET @APPS_Gross_Prem_SUM = 0.00
		SET @BP_Bond_Amt_SUM = 0.00
		SET @APPS_Bond_Amt_SUM = 0.00
		
		DECLARE @NoGUID_Count			INT,
				@BondNumber_Count		INT,
				@GrossPrem_Count		INT,
				@BondAmt_Count			INT,
				@PolicyDate_Count		INT,
				@SAACode_Count			INT,
				@Producer_Count			INT
		
		SET @NoGUID_Count = 0
		SET @BondNumber_Count = 0
		SET @GrossPrem_Count = 0
		SET @BondAmt_Count = 0
		SET @PolicyDate_Count = 0
		SET @SAACode_Count = 0
		SET @Producer_Count = 0
		
		
		SELECT TOP 1 @reportDate = CreateDate
		FROM BondPro_Reconciliation
		
		SELECT @BP_Gross_Prem_SUM = ISNULL(SUM(BP_Gross_Premium), 0.00)
		FROM BondPro_Reconciliation
		
		SELECT @BP_Gross_Prem_SUM = @BP_Gross_Prem_SUM + ISNULL(SUM(Gross_Premium), 0.00)
		FROM BondPro_NoGUID
		
		SELECT @APPS_Gross_Prem_SUM = SUM(ISNULL(APPS_Gross_Premium, 0.00))
		FROM BondPro_Reconciliation
		
		SELECT @Gross_Premium_Diff = ABS(@BP_Gross_Prem_SUM - @APPS_Gross_Prem_SUM)
		
		SELECT @BP_Bond_Amt_SUM = ISNULL(SUM(BP_Bond_Amount), 0.00)
		FROM BondPro_Reconciliation
		WHERE Cancelled <> ''Flat Cancellation''
		
		SELECT @BP_Bond_Amt_SUM = @BP_Bond_Amt_SUM + ISNULL(SUM(Bond_Amount), 0.00)
		FROM BondPro_NoGUID
		
		
		SELECT @APPS_Bond_Amt_SUM = SUM(ISNULL(APPS_Bond_Amount, 0.00))
		FROM BondPro_Reconciliation
		WHERE Cancelled <> ''Flat Cancellation''
		
		
		SELECT @Bond_Amount_Diff = ABS(@BP_Bond_Amt_SUM - @APPS_Bond_Amt_SUM)
		
		SELECT @NoGUID_Count =  COUNT(*)
		FROM BondPro_NoGUID
		
		SELECT @BondNumber_Count = COUNT(*)
		FROM BondPro_Reconciliation 
		WHERE BP_Bond_Number <> APPS_Bond_Number
		
		SELECT @GrossPrem_Count = COUNT(*)
		FROM BondPro_Reconciliation
		WHERE ABS(BP_Gross_Premium - ISNULL(APPS_Gross_Premium, 0.00)) > 1
		
		SELECT @BondAmt_Count = COUNT(*)
		FROM BondPro_Reconciliation
		WHERE BP_Bond_Amount <> ISNULL(APPS_Bond_Amount, 0.00)
		AND Cancelled <> ''Flat Cancellation''
		
		SELECT @PolicyDate_Count = COUNT(*)
		FROM BondPro_Reconciliation
		WHERE BP_Effective_Date <> ISNULL(APPS_Effective_Date, ''01/01/1900'')
		AND APPS_Gross_Premium IS NOT NULL
		
		SELECT @PolicyDate_Count = @PolicyDate_Count + COUNT(*)
		FROM BondPro_Reconciliation
		WHERE BP_Expiration_Date <> ISNULL(APPS_Expiration_Date, ''01/01/1900'')
		--AND APPS_Gross_Premium IS NOT NULL
		
		SELECT @SAACode_Count = COUNT(*)
		FROM BondPro_Reconciliation
		WHERE BP_SAA_Code <> ISNULL(APPS_SAA_Code, '''')
		
		SELECT @Producer_Count = COUNT(*) 
		FROM BondPro_Reconciliation
		WHERE (
			   APPS_Producer_Code = 117015
				OR
			   BP_Client_Code <> ISNULL(APPS_Producer_Code, '''')
			   OR 
			   ROUND(BP_AGent_Commission, 1) <> ROUND(ISNULL(APPS_Agent_Commission, 0.00), 1)
			   )
		AND Cancelled <> ''Flat Cancellation''
		
		
		
		
		
		SELECT @BP_Gross_Prem_SUM AS BP_Gross_Prem_SUM, @APPS_Gross_Prem_SUM AS APPS_Gross_Prem_SUM, 
			   @Gross_Premium_Diff AS Gross_Premium_Diff,  @reportDate AS reportDate, @BP_Bond_Amt_SUM AS BP_Bond_Amt_SUM,
			   @APPS_Bond_Amt_SUM AS APPS_Bond_Amt_SUM, @Bond_Amount_Diff AS Bond_Amount_Diff, @NoGUID_Count AS NoGUID_Count,
			   @BondNumber_Count AS BondNumber_Count, @GrossPrem_Count AS GrossPrem_Count, @BondAmt_Count AS BondAmt_Count,
			   @PolicyDate_Count AS PolicyDate_Count, @SAACode_Count AS SAACode_Count, @Producer_Count AS Producer_Count
		
		
	
END --Proc

		
' 
END
GO
