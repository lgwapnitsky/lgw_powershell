IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_AddCVEndorsement_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_AddCVEndorsement_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_AddCVEndorsement_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  
CREATE PROCEDURE dbo.INT_AddCVEndorsement_BOR 
@policynumber		VARCHAR(15),
@transCode			VARCHAR(3)
AS  
/*****************************************************************************************************        
 Maintenance Header       
        
 Description:	This stored procedure is used to insert the endorsement information to the Grundy_Policy
				and Grundy_Policy_Errors table, and calls the appropriate procedures to add other data to
				other Grundy policy tables.
				Error codes: 1 - no other successful transaction has been processed through the Bordereau
							 on this policy
							 2: failed while inserting into the Grundy_Policy or Grundy_Policy_Errors tables
				
				Returns 0 if execution is successful.
        
 Called By:         
        
 Syntax: Exec INT_AddCVEndorsement_BOR ''GD20000000-00'', ''COV'', @errorNum OUTPUT      
          
****************************************************************************************************        
        
** Change History        
**  --------------        
**  Change:  Date:  Author:    Issue:  Description:        
**  ----------- ----------- ------------------- ----------- ------------------------------------        
******************************************************************************************************/

DECLARE @Date			VARCHAR(10),
		@PolicyID		INT,
		@newPolicyID	INT,
		@pendInd		INT --Used to tell if there already exists a pending endorsement in bordereau tables for this policy
		
DECLARE @errorNum			INT,
		@genPolicyID		INT
		
SET @Date = CONVERT (VARCHAR(10), GETDATE(), 101)
SET @errorNum = -1
SET @genPolicyID = -1

SELECT @pendInd = COUNT(*)
FROM bordereau.dbo.GRUNDY_Policy p
LEFT OUTER JOIN bordereau.dbo.GRUNDY_Policy_ERRORS e
ON p.GRUNDY_Policy_ID = e.GRUNDY_Policy_ID
WHERE GenPolicyNumber = @policynumber
AND REC_NUM = ''P''
AND UpdateDate > @Date
AND ERROR_ID = 326

EXEC bordereau.dbo.INT_PrevPolicyID_BOR @policynumber, @policyID OUTPUT

IF (@@ERROR <> 0 OR @policyID = -1)
	BEGIN
		SET @errornum = 1
		RETURN
	END
	
BEGIN TRANSACTION
 --Insert Into Grundy_Policy
IF (@transCode <> ''CAN'' AND @pendInd = 0)
	BEGIN 
		INSERT INTO bordereau.dbo.GRUNDY_Policy
		(
		REC_NUM,
		POLICY_NUM,
		SUB_AGENT,
		INCEPT_DATE, 
		EXP_DATE,
		NAME_INSURED,
		ADDRESS_N,
		CITY_NAME,
		STATE_CD,
		STATE_FORM_01,
		STATE_FORM_02,
		ZIP_CODE,
		BROKER,
		BADDRESS,
		BCITY_NAME,
		BSTATE_CD,
		BZIP_CODE,
		BOD_INS_EP,
		BOD_INS_EO,
		MED_PAY_EP,
		UNINS_MTR,
		ADDTL_COV,
		ACV_1,
		COMP_L_DED_1,
		COLL_L_DED_1,
		ACV_2,
		COMP_L_DED_2,
		COLL_L_DED_2,
		ACV_3,
		COMP_L_DED_3,
		COLL_L_DED_3,
		ACV_4,
		COMP_L_DED_4,
		COLL_L_DED_4,
		TOW_LABOR,
		VEH_YEAR_1, 
		MAKE1,
		TYPE1,
		VIN_SER_NUM1,
		VEH_YEAR_2,
		MAKE2,
		TYPE2,
		VIN_SER_NUM2,
		VEH_YEAR_3,
		MAKE3,
		TYPE3,
		VIN_SER_NUM3,
		VEH_YEAR4,
		MAKE4,
		TYPE4,
		VIN_SER_NUM4,
		GARAGE_LO1,
		GARAGE_LO2,
		GARAGE_LO3,
		GARAGE_LO4,
		LOSS_PAY_1,
		LOSS_PAY_1b,
		LOSS_PAY_2,
		LOSS_PAY_2B,
		LOSS_PAY_3,
		LOSS_PAY_3B,
		LOSS_PAY_4,
		LOSS_PAY_4b,
		ISSUE_DATE,
		ST_SUR_CHG,
		TOT_VEHCLS,
		ENDORSEMNT,
		PREM_TERM,
		TTL_COM_LD,
		TTL_COL_LD,
		TTL_P_ADJ,
		TERM_E_PRE,
		TTL_TERM_P,
		POL_ID_CDS,
		RENEW_IND,
		REINST_FEE,
		COMM_ACCT_NUM,
		PRINT_FLAG,
		EXEMPT_50,
		VEH_EFF_DT,
		DR_LIC_NUM,
		TOT_ACV,
		SPEC_R_COL,
		SPEC_R_CMP,
		TRANS_FLAG,
		TRANS_CODE,
		REMT_P_FLG,
		NO_CLC_ACV,
		PA_TORT,
		ST_TERIT_C,
		BROKER_COD,
		DIR_BILL,
		DRVS_BDAY,
		DRVS_ST_LC,
		RecordStatus,
		UpdateDate,
		GenPolicyNumber,
		PHLINS,
		DRVGENDER,
		TRANSDATE
		)
		SELECT
		''P'',
		POLICY_NUM,
		SUB_AGENT,
		INCEPT_DATE, 
		EXP_DATE,
		NAME_INSURED,
		ADDRESS_N,
		CITY_NAME,
		STATE_CD,
		STATE_FORM_01,
		STATE_FORM_02,
		ZIP_CODE,
		BROKER,
		BADDRESS,
		BCITY_NAME,
		BSTATE_CD,
		BZIP_CODE,
		BOD_INS_EP,
		BOD_INS_EO,
		MED_PAY_EP,
		UNINS_MTR,
		ADDTL_COV,
		ACV_1,
		COMP_L_DED_1,
		COLL_L_DED_1,
		ACV_2,
		COMP_L_DED_2,
		COLL_L_DED_2,
		ACV_3,
		COMP_L_DED_3,
		COLL_L_DED_3,
		ACV_4,
		COMP_L_DED_4,
		COLL_L_DED_4,
		TOW_LABOR,
		VEH_YEAR_1, 
		MAKE1,
		TYPE1,
		VIN_SER_NUM1,
		VEH_YEAR_2,
		MAKE2,
		TYPE2,
		VIN_SER_NUM2,
		VEH_YEAR_3,
		MAKE3,
		TYPE3,
		VIN_SER_NUM3,
		VEH_YEAR4,
		MAKE4,
		TYPE4,
		VIN_SER_NUM4,
		GARAGE_LO1,
		GARAGE_LO2,
		GARAGE_LO3,
		GARAGE_LO4,
		LOSS_PAY_1,
		LOSS_PAY_1b,
		LOSS_PAY_2,
		LOSS_PAY_2B,
		LOSS_PAY_3,
		LOSS_PAY_3B,
		LOSS_PAY_4,
		LOSS_PAY_4b,
		SUBSTRING(@Date, 1,2) + ''-'' + SUBSTRING(@Date, 4,2)+ ''-'' + SUBSTRING(@Date, 7,4),
		ST_SUR_CHG,
		TOT_VEHCLS,
		CONVERT(VARCHAR(3), (CONVERT(INT, ENDORSEMNT) + 1)),
		PREM_TERM,
		TTL_COM_LD,
		TTL_COL_LD,
		TTL_P_ADJ,
		TERM_E_PRE,
		TTL_TERM_P,
		POL_ID_CDS,
		RENEW_IND,
		REINST_FEE,
		COMM_ACCT_NUM,
		PRINT_FLAG,
		EXEMPT_50,
		VEH_EFF_DT,
		DR_LIC_NUM,
		TOT_ACV,
		SPEC_R_COL,
		SPEC_R_CMP,
		TRANS_FLAG,
		@transCode,
		REMT_P_FLG,
		NO_CLC_ACV,
		PA_TORT,
		ST_TERIT_C,
		BROKER_COD,
		DIR_BILL,
		DRVS_BDAY,
		DRVS_ST_LC,
		'''',
		GETDATE(),
		GenPolicyNumber,
		PHLINS,
		DRVGENDER,
		SUBSTRING(@Date, 7,4) + SUBSTRING(@Date, 1,2) + SUBSTRING(@Date, 4,2)
		FROM bordereau.dbo.GRUNDY_Policy
		WHERE GenPolicyNumber = @policynumber
		AND GRUNDY_Policy_ID = @PolicyID


		IF (@@ERROR <> 0)
		BEGIN
			PRINT ''Cannot insert into Grundy_policy''
			SET @errorNum = 2 
			ROLLBACK TRANSACTION
			RETURN
		END
		
		SELECT @newPolicyID = GRUNDY_Policy_ID
		FROM bordereau.dbo.GRUNDY_Policy WITH (NOLOCK)
		WHERE GenPolicyNumber = @policynumber
		AND REC_NUM = ''P''
		AND UpdateDate > @Date
		
		--Insert into the Grundy_Coverage Table
		
		INSERT INTO bordereau.dbo.GRUNDY_Policy_ERRORS
			(
			GRUNDY_Policy_ID,
			ERROR_ID
			)
			VALUES (@newPolicyID, 326)

			IF (@@ERROR <> 0)
				BEGIN
					PRINT ''Could not insert into Grundy_Policy_Errors''
					SET @errorNum = 2 
					ROLLBACK TRANSACTION
					RETURN
				END
				

	END --(@transCode <> ''CAN'' AND @pendInd = 0)
	
IF (@transCode = ''CAN'' AND @pendInd = 0)
	BEGIN
		PRINT ''Insert into to Grundy_Cancel table''
	END --
	

SET @errorNum = 0

IF (@pendInd = 0)
	BEGIN
		SET @genPolicyID = @newPolicyID
	END
ELSE
	BEGIN
		SELECT @genPolicyID = P.GRUNDY_Policy_ID
		FROM bordereau.dbo.GRUNDY_Policy p
		LEFT OUTER JOIN bordereau.dbo.GRUNDY_Policy_ERRORS e
		ON p.GRUNDY_Policy_ID = e.GRUNDY_Policy_ID
		WHERE GenPolicyNumber = @policynumber
		AND REC_NUM = ''P''
		AND UpdateDate > @Date
		AND ERROR_ID = 326
	END
	
SELECT @errorNum as errornum, @genPolicyID as genPolicyID

COMMIT TRANSACTION		
RETURN

' 
END
GO
