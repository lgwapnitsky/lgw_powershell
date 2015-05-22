IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BP_ReconciliationReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_BP_ReconciliationReport]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_BP_ReconciliationReport]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE [dbo].[INT_BP_ReconciliationReport] 
AS  

/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to populate the requisite tables for the BondPro 
				Reconciliation report: BondPro_NoGUID and BondPro_Reconciliation
				
        
 Called By:		INT_RunInterface_BOR     
        
 Syntax: Exec INT_BP_ReconciliationReport    
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:		Date:		Author:				Issue:		Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
  
***************************************************************************************************/  
BEGIN
			DECLARE @currentDate	VARCHAR(10)

			SET @currentDate = CONVERT(VARCHAR(10), GETDATE(), 101)

			--Only want the days current data in the reconciliation report.
			DELETE FROM BondPro_Reconciliation
			WHERE CreateDate <> @currentDate

			DELETE FROM BondPro_NoGUID
			WHERE CreateDate <> @currentDate

			--Populate BondPro_Reconciliation table if there is no data from the current day

			IF NOT EXISTS (SELECT ''a''
						   FROM BondPro_Reconciliation
						   WHERE CreateDate = @currentDate)
									BEGIN
											INSERT INTO BondPro_Reconciliation
											(
											Bond_ID,
											BP_Bond_Number,
											BP_Bond_Ren_Num,
											BP_Effective_Date,
											BP_Expiration_Date,
											BondFormDescription,
											BP_SAA_Code,
											BP_Gross_Premium,
											BP_Bond_Amount,
											BP_Client_Code,
											BP_Agent_Commission,
											Cancelled,
											CreateDate
											)
											--SELECT b.GUID AS Bond_Id,
											--	   b.Bond_Number,
											--	   b.Renewal_Number,
											--	   CONVERT(DATETIME, Effective_Date - 36163) AS Effective_Date,
											--	   CONVERT(DATETIME, Expiration_Date - 36163) AS Expiration_Date,
											--	   b.BondFormDescription,
											--	   b.SAA_Code,
											--	   b.Gross_Premium,
											--	   b.Bond_Amount,
											--	   a.Client_Code,
											--	   b.Agent_Rate,
											--	   Cancelled,
											--	   @currentDate
											--FROM [Bond].[BPPROD].[dbo].[Bond_Recs] b 
											--INNER JOIN [Bond].[BPPROD].[dbo].[Agent] a 
											--ON b.AgentID = a.GUID
											--WHERE b.Category <> ''Bid''
											SELECT Bond_Id,
												   Bond_Number,
												   Renewal_Number,
												   Effective_Date,
												   Expiration_Date,
												   BondFormDescription,
												   SAA_Code,
												   Gross_Premium,
												   Bond_Amount,
												   Client_Code,
												   Agent_Rate,
												   Cancelled,
												   @currentDate
											FROM tmp_BondPro_Reconciliation
											
											
											
									END
						


			--The data in the table should be the current days data
			--Insert the BondIDs that do not exist in Bordereau tables
			IF NOT EXISTS (SELECT ''a''
						   FROM BondPro_NoGUID
						   WHERE CreateDate = @currentDate)
									BEGIN
											INSERT INTO BondPro_NoGUID
											SELECT Bond_ID,
												   BP_Bond_Number,
												   BP_Bond_Ren_Num,
												   BP_SAA_Code,
												   BP_Gross_Premium,
												   BP_Bond_Amount,
												   Cancelled,
												   @currentDate
											FROM BondPro_Reconciliation t
											WHERE NOT EXISTS (
																	SELECT ''b''
																	FROM BondPro_Policy p
																	WHERE p.Bond_Id = t.Bond_Id
															 )
									END

							 

			--Update the APPS_Bond_Number in BondPro_Reconciliation from last successful entry
			UPDATE t
			SET t.APPS_Bond_Number = (
											SELECT TOP 1 Bond_Number
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											WHERE p.Bond_Id = t.Bond_ID
											AND e.Error_Code IN (2, 926, 927)
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE t.APPS_Bond_Number IS NULL
			
			--Update the APPS_Bond_Number in BondPro_Reconciliation from last unsuccessful entry
			UPDATE t
			SET t.APPS_Bond_Number = (
											SELECT TOP 1 Bond_Number
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											WHERE p.Bond_Id = t.Bond_ID
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE t.APPS_Bond_Number IS NULL


			--Update the APPS_Renewals_Number from last successful entry
			UPDATE t
			SET t.APPS_Bond_Ren_Num = (
											SELECT TOP 1 Bond_Ren_Num
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											WHERE p.Bond_Id = t.Bond_ID
											AND e.Error_Code IN (2, 926, 927)
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE t.APPS_Bond_Ren_Num IS NULL
			
			--Update the APPS_Renewals_Number from last unsuccessful entry
			UPDATE t
			SET t.APPS_Bond_Ren_Num = (
											SELECT TOP 1 Bond_Ren_Num
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											WHERE p.Bond_Id = t.Bond_ID
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE t.APPS_Bond_Ren_Num IS NULL


			--Update the APPS_Policy_Number (cases where it is successfully in APPS)
			UPDATE t
			SET t.APPS_PolicyNumber = (
											SELECT TOP 1 GeneratedPolicyNumber
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											WHERE p.Bond_Id = t.Bond_ID
											AND e.Error_Code IN (2, 326, 926, 927)
											AND GeneratedPolicyNumber NOT IN (''Policy Existing'', ''Multiple'', ''No Policy Num'')
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_PolicyNumber IS NULL

			--Update the APPS_Policy_Number (cases where it is not successfully in APPS)
			UPDATE t
			SET t.APPS_PolicyNumber = (
											SELECT TOP 1 GeneratedPolicyNumber
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											WHERE p.Bond_Id = t.Bond_ID
											AND GeneratedPolicyNumber NOT IN (''Policy Existing'', ''Multiple'', ''No Policy Num'')
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_PolicyNumber IS NULL


			--Update SAA_Code  (cases where it is successfully in APPS)
			UPDATE t
			SET t.APPS_SAA_Code = (
											SELECT TOP 1 c.SAA_Code
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											INNER JOIN BondPro_Coverage c
											ON p.RowId = c.RowId
											WHERE p.Bond_Id = t.Bond_ID
											AND e.Error_Code IN (2, 326, 926, 927)
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_SAA_Code IS NULL

			--Update SAA_Code  (cases where it is not successfully in APPS)
			UPDATE t
			SET t.APPS_SAA_Code = (
											SELECT TOP 1 c.SAA_Code
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											INNER JOIN BondPro_Coverage c
											ON p.RowId = c.RowId
											WHERE p.Bond_Id = t.Bond_ID
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_SAA_Code IS NULL

			--Update Bond_Amount (cases where it is successfully in APPS)
			UPDATE t
			SET t.APPS_Bond_Amount = (
											SELECT TOP 1 pc.exposureunits
											FROM AccessPHLY.dbo.policycoverage pc
											WHERE pc.policynumber = t.APPS_PolicyNumber
											AND pc.effectivedate <> pc.expirationdate
											ORDER BY pc.policycoverageid DESC
											
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_Bond_Amount IS NULL
			AND APPS_PolicyNumber IS NOT NULL

			--Update Bond_Amount (cases where it is not successfully in APPS)
			UPDATE t
			SET t.APPS_Bond_Amount = (
											SELECT TOP 1 c.Bond_Amount
											FROM BondPro_Policy p
											INNER JOIN BondPro_PolicyErrors e
											ON p.RowId = e.RowId
											INNER JOIN BondPro_Coverage c
											ON p.RowId = c.PolicyRowId
											WHERE p.Bond_Id = t.Bond_ID
											ORDER BY TransDate DESC
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_Bond_Amount IS NULL
			
			--Update Producer Code in cases where it is successfully imported into APPS
			UPDATE t
			SET t.APPS_Producer_Code = (
											SELECT TOP 1 CONVERT(CHAR(25), pp.producercode)
											FROM AccessPHLY.dbo.policyproducer pp
											WHERE pp.policynumber = t.APPS_PolicyNumber
											AND pp.effectivedate <> pp.expirationdate
											AND pp.primaryind = ''Y''
											ORDER BY pp.createdate DESC
											
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_Producer_Code IS NULL
			AND APPS_PolicyNumber IS NOT NULL
			
			
			--Update Producer code in cases where it is not successfully imported into APPS
			UPDATE t
			SET t.APPS_Producer_Code = (
											SELECT TOP 1 p.Producer_Code
											FROM BondPro_Policy p
											WHERE p.Bond_Id = t.Bond_ID
											AND p.Bond_Number = t.BP_Bond_Number
											ORDER BY TransDate DESC
											
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_Producer_Code IS NULL
			AND APPS_PolicyNumber IS NOT NULL
			
			
			--Update the Producer commission rate in cases where it is successfully imported into APPS
			UPDATE t
			SET t.APPS_Agent_Commission = (
											SELECT TOP 1 (pp.commissionpct *100)
											FROM AccessPHLY.dbo.policyproducer pp
											WHERE pp.policynumber = t.APPS_PolicyNumber
											AND pp.effectivedate <> pp.expirationdate
											AND pp.primaryind = ''Y''
											ORDER BY pp.createdate DESC
											
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_Agent_Commission IS NULL
			AND APPS_PolicyNumber IS NOT NULL
			
			--Update Producer commission rate in cases where it is not successfully imported into APPS
			UPDATE t
			SET t.APPS_Agent_Commission = (
											SELECT TOP 1 p.Agent_Comm_Rate*100
											FROM BondPro_Policy p
											WHERE p.Bond_Id = t.Bond_ID
											AND p.Bond_Number = t.BP_Bond_Number
											ORDER BY TransDate DESC
											
									 )
			FROM BondPro_Reconciliation t
			WHERE APPS_Agent_Commission IS NULL
			AND APPS_PolicyNumber IS NULL


			--Update Effective, Expiration dates
			UPDATE t
			SET t.APPS_Effective_Date = p.effectivedate,
				t.APPS_Expiration_Date = p.expirationdate
			FROM BondPro_Reconciliation t, AccessPHLY.dbo.Policy p
			WHERE t.APPS_PolicyNumber = p.policynumber
			AND t.APPS_PolicyNumber IS NOT NULL

			--Update APPS_Gross_Premium from premiumstat
			UPDATE t
			SET t.APPS_Gross_premium = (SELECT SUM(writtenpremium)
										FROM AccessPHLY.dbo.premiumstat ps
										WHERE ps.policynumber = t.APPS_PolicyNumber)
			FROM BondPro_Reconciliation t
			WHERE t.APPS_PolicyNumber IS NOT NULL

			--Update APPS_Gross_Premium from premiumstathold
			UPDATE t
			SET t.APPS_Gross_premium = (SELECT SUM(writtenpremium)
										FROM AccessPHLY.dbo.premiumstathold ps
										WHERE ps.policynumber = t.APPS_PolicyNumber)
			FROM BondPro_Reconciliation t
			WHERE t.APPS_PolicyNumber IS NOT NULL
			AND t.APPS_Gross_Premium IS NULL
			
			
			----Update Producer code where APPS policy number exists
			--UPDATE  t
			--SET t.Producer_Code = (SELECT p.PrimaryProducerCode
			--					   FROM AccessPHLY.dbo.policy p
			--					   WHERE p.policynumber = t.APPS_PolicyNumber)
			--FROM BondPro_Reconciliation t
			--WHERE t.APPS_PolicyNumber IS NOT NULL
			--AND t.Producer_Code IS NULL
			
			
			----Update Prorducer Code where APPS Policy Number does not exist.
			--UPDATE  t
			--SET t.Producer_Code = (SELECT TOP 1 Producer_Code
			--					   FROM BondPro_Policy p
			--					   WHERE p.Bond_Number = t.BP_Bond_Number
			--					   AND p.Bond_Id = t.Bond_ID
			--					   ORDER BY TransDate Desc)
			--FROM BondPro_Reconciliation t
			--WHERE t.APPS_PolicyNumber IS NULL
			--AND t.Producer_Code IS NULL


			--Delete the rows where the Gross Premium = 0, Bond_Amount = 0, APPS_Policy_Number = NULL
			--because this has never been imported into APPS
			DELETE FROM BondPro_Reconciliation
			WHERE BP_Bond_Amount = 0.00
			AND BP_Gross_Premium = 0.00
			AND APPS_PolicyNumber IS NULL
			
			
			--Delete the rows where the Bond is not in the bordereau tables, as this will be reported elsewhere
			DELETE FROM BondPro_Reconciliation
			WHERE BP_Bond_Number IN
				(
						SELECT Bond_Number
						FROM BondPro_NoGUID
				)
			AND Bond_ID IN
				(
						SELECT Bond_ID
						FROM BondPro_NoGUID
				)
				
				
			--Delete anything that was flat cancelled in BondPro, and has never been put into APPS
			DELETE FROM BondPro_Reconciliation
			WHERE Cancelled = ''Flat Cancellation''
			AND APPS_Gross_premium IS NULL
			
END --Proc
' 
END
GO
