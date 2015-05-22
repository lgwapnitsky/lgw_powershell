IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_ImportINTOAPPS_E_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_ImportINTOAPPS_E_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_ImportINTOAPPS_E_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/******************************************************************************
**		File: INT_ImportIntoAPPS_E_BOR.sql
**		Name: INT_ImportIntoAPPS_E_BOR
**		Desc: Load MTC Bordereau Business into APPS - MTC only
**
**		Return values:
** 
**		Called by: IT personnel
**              
**		Parameters: None
**
**		Auth: INTERFACE
**		Date: 
*******************************************************************************
**		Change History
*******************************************************************************
------------------------------------------------------------------------------------------
-- 9/29/08 		SMZ 	FP 11191 Change Territory and Rate Departure for CPH inland Merine
-------------------------------------------------------------------------------------------
-- FPT 7700			Automobile Auto Iso Deductible Code
-- Developer	:	Sandip Mazumdar
--		Date	:	10-21-2008
--		Notes	:	Changing ISO_Deductible_Code from smallInt to varchar(2)
-------------------------------------------------------------------------------------------
-- FPT 12959	:	Block FL FIGA tax line from interfacing
-- Developer	:	Matt Miller
--		Date	:	01-13-2009
--		Notes	:	prevent it by marking it successful before processing it
-------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- FPT 12073	:	RPG being marked fully earned on some policies
-- Developer	:	Sandip Mazumdar
--		Date	:	02-23-2009
--		Notes	:	Taxcode RPG shouldn''t be fully earned 
-----------------------------------------------------------------------------------
-- FPT 14051	:	Grundy Production Issue - Unable to submit two records thru infopath
-- Developer	:	Sandip Mazumdar
--		Date	:	04-27-2009
--		Notes	:	Endorsement on expired policy should be allowed 
-----------------------------------------------------------------------------------
-- FPT 153002   :   SQL Job Error - Server:PHLYSQL09 - Job:int_runMTC - Step:BOR MTC - no previous Error - Time:2009-07-08 17:26:43
--	Developer	:	Sandip Mazumdar
--		Date	:	07-09-2009
--		Notes	:	If it interrupts interface process it will set policy a temporary errorcode so that it can reprocess.
-------------------------------------------------------------------------------------------
-- FPT 15270	:	Grundy policy endorsements did not make it to ImageRight and are not in the Error File
-- Developer	:	Sandip Mazumdar
--		Date	:	07-31-2009
--		Notes	:	Add preapproval code while generating policy for Endorsement
-------------------------------------------------------------------------------------------
-- FPT 15748	:	Grundy is now missing Endorsement documents 
-- Developer	:	Sandip Mazumdar
--		Date	:	08-07-2009
--		Notes	:	Error Code 2 is not set from 295, bug in code, will fix through this ticket
-------------------------------------------------------------------------------------------
-- FPT 15933	:	Grundy delete records are deleting the coverage but not the vehicle 
-- Developer	:	Prasanna Govindarajan
-- Date			:	08-24-2009
-- Notes		:	The AccountVehicle table holds the vehicles endorsements done to the 
--					future policy. This proc when choosing the vehicle from the 
--					AccountVehicle table based on VIN, it actually fetches the latest entry
--					which is actually part of future policy and searches in the policyvehicle 
--					table which have no such entry. Changed the logic to fetch the vehicle
--					which has the corresponding entry in the AccountVehicle table.
--					Also, done code clean-up like,
--						1. Removing the use of @@IDENTITY.
--						2. Formatted the proc.
-------------------------------------------------------------------------------------------
-- FPT 16284	:	Bordereau - Discontinue Charging Florida 2007 FIGA Surcharge
-- Developer	:	Sandip Mazumdar
--		Date	:	10-19-2009
--		Notes	:	prevent it by marking it successful before processing it
-------------------------------------------------------------------------------------------
-- FPT 16912	:	Grundy future dated endorsement are not processing
-- Developer	:	Prasanna Govindarajan
--		Date	:	11-06-2009
--	   Notes	:	Until now the endorsement on future policies are restricted and held in
--					the holding tank with error code set as 19 or 118. This restriction is 
--					removed.
-------------------------------------------------------------------------------------------
--	FPT 16408		Interface Data Issue affecting DMV Production - Investigate Root Cause
--	Developer	:	Prasanna Govindarajan
--	Date		:	02-24-2009
--	Notes		:	Restricted null values getting into GarageStateCode column, which casues
--					the empty state records through the DMV process.
-------------------------------------------------------------------------------------------
******************************************************************************************/
Create PROC [dbo].[INT_ImportINTOAPPS_E_BOR] 
AS

SET NOCOUNT ON 
DECLARE @policycoverage_id              INT,   
		@taxfullyearnedind 				VARCHAR(1), 
		@countvalue                     INT,
        @AgencyNumber 					VARCHAR(7),
        @busname						VARCHAR(100),
		@dbaname 						VARCHAR(100),
		@PCpremopsoccrlimit   			DECIMAL(15,2),
        @PCpremopsaggrlimit   			DECIMAL(15,2),
        @PCprodoccrlimit      			DECIMAL(15,2), 
        @PCprodaggrlimit      			DECIMAL(15,2),
        @PCmedpaylimit        			DECIMAL(15,2),    
		@plc1							INT,    
		@plc2							INT,    
		@BOPLiabilitylimit              MONEY,           
		@KSTOKEY						INT,			
		@Tmp_Err_Trap					INT,			
		@ratingsourcecode				VARCHAR(10),          	
		@policylevelind					VARCHAR(1),
		@Error_Number 					INT,
		@Rowcount 						INT,
		@TranCount 						INT,
		@RowId 							INT,
		@StartTime 						DATETIME,
		@user_id 						VARCHAR(8),
		@account_number 				INT,
       	@policy_number 					VARCHAR(15),
		@product 						VARCHAR(2),
		@policy_type 					VARCHAR(2),
		@prev_policy 					VARCHAR(15),
		@full_prior_ind 				VARCHAR(1),
		@retro_date 					DATETIME,
		@Quote_Number 					INT,
		@USERID 						CHAR(8),
		@Error_Flag 					INT,
		@ERROR_CODE 					INT,
		@noofdays 						INT,
       	@errormsg         				VARCHAR(255),
		@NAME_KEY						INT,
       	@siccode                       	VARCHAR(7),
       	@erpind							VARCHAR(1), 
		@AQSKEY							VARCHAR(100),
		@lded							VARCHAR(4)    

DECLARE	@cov_prior_date					DATETIME,	
		@cov_retro_date					DATETIME,	
		@cov_anti_theft_device			VARCHAR(1), 
		@cov_loss_cost_date				DATETIME, 
		@cov_rate_departure_lcm			VARCHAR(3),   
		@cov_rating_mod					VARCHAR(3),   
		@Cov_vin						VARCHAR(17),
		@Cov_Quote_Number 				CHAR(11),
		@Cov_CoverageId 				INT,
		@Cov_Policy_Number 				CHAR(15),
		@Cov_Trans_Code 				CHAR(2),
		@Cov_Trans_Date 				DATETIME,
		@Cov_UPDATE_Date 				DATETIME,
		@Cov_Rate_Block_Num 			CHAR(3),
		@Cov_Location_Number 			INT,
		@Cov_Building_Number 			INT,
		@Cov_Coverage_Code 				CHAR(6),
		@Cov_State 						CHAR(2),
		@Cov_Territory 					VARCHAR(3),
		@Cov_Subline 					SMALLINT,
		@Cov_Class_Code 				CHAR(6),
		@Cov_Oth_Code 					CHAR(2),
		@Cov_Town_Code 					INT,
		@Cov_Effective_Date 			DATETIME,
		@Cov_Expiration_Date 			DATETIME,
		@Cov_ASLOB 						SMALLINT,
		@Cov_ISO_Coverage_Code 			VARCHAR(3),
		@Cov_Rating_ID_Code 			SMALLINT,
		@Cov_Construction_Code 			SMALLINT,
		@Cov_Protection_Code 			SMALLINT,
		@Cov_ISO_Deductible_Code 		VARCHAR(2),  
		@Cov_Deductible 				FLOAT,
		@Cov_Limit 						FLOAT,
		@Cov_Exposure 					DECIMAL(15,2),
		@Cov_Exposure1 					DECIMAL(15,2),            
		@Cov_PIC_Rating_Basis 			CHAR(2),
		@Cov_Manual_Premium 			DECIMAL(12, 2),
		@Cov_Manual_Rate 				DECIMAL(5, 4),
		@Cov_Actual_Premium 			DECIMAL(12, 2),
		@Cov_Actual_Rate 				DECIMAL(5, 4),
		@Cov_Package_ModIFier 			DECIMAL(7, 4),
		@Cov_Experience_ModIFier 		DECIMAL(7, 4),
		@Cov_Schedule_ModIFier 			DECIMAL(7, 4),
		@Cov_Individual_ModIFier 		DECIMAL(7, 4),
		@Cov_Expense_ModIFier 			DECIMAL(7, 4),
		@miscmodIFier1					DECIMAL(7, 4),
		@miscmodIFier2					DECIMAL(7, 4),
		@Cov_MLRP_Dispension_ModIFier 	FLOAT,
		@Cov_ALL_Risk_Ind	 			CHAR(1),
		@Cov_CoinsurancePct 			VARCHAR(15),
		@Cov_Class_Limit_Indv 			SMALLINT,
		@Cov_Coverage_XRef 				INT, 
		@Cov_Rate_Group 				SMALLINT,
		@Cov_ISO_Limit_ID 				SMALLINT,
		@Cov_Policy_Limits_Code 		SMALLINT,
		@Cov_Limit_Indv 				FLOAT,
		@Cov_Limit_Occurance 			FLOAT,
		@Cov_Limit_Aggregate 			FLOAT,
		@Cov_Deductible_Indv 			INT,
		@Cov_Deductible_Occurance 		INT,
		@Cov_Deductible_Aggregate 		INT,
		@Cov_ISO_Risk_ID_Code 			CHAR(1),
		@Cov_Risk_ID_Code 				SMALLINT,
		@Cov_Exposure_Indicator 		CHAR(1),
		@Cov_RC_Exposure_Base 			SMALLINT,
		@Cov_RC_Report_Base 			SMALLINT,
		@Cov_Liability_Code 			SMALLINT,
		@Cov_Med_Pay_Ind 				SMALLINT,
		@Cov_FORm 						CHAR (3),   
		@Cov_Number_Employees 			INT,
		@Cov_Limit_Per_Thousand 		INT,
		@Cov_State_Exception 			CHAR (1),
		@Cov_Aggregate_Limit_Code 		SMALLINT,
		@Cov_Zone_Rating_Code 			SMALLINT,
		@Cov_Age_Garage_Code 			SMALLINT,
		@Cov_Value_Per_Rating_Unit 		SMALLINT,
		@Cov_Original_Cost_New 			INT,
		@Cov_ISO_OCN_Code 				SMALLINT,
		@Cov_Comp_Deductible 			INT,
		@Cov_Theft_Deductible 			INT,
		@Cov_ISO_PIP_Limit_ID 			SMALLINT,
		@Cov_PIP_Limit_Code 			CHAR(2),
		@Cov_PIP_Deductible_Code 		CHAR(1),
		@Cov_Type_Of_Equipt 			SMALLINT,
		@Cov_Zip_Code 					VARCHAR(9), 
		@Cov_Construction_Type 			CHAR(2),
		@Cov_Equip_Type_Coverage 		SMALLINT,
		@Cov_Att_Ind 					SMALLINT,
		@Cov_Rate_Grade 				SMALLINT,
		@Cov_Flat_Deduct 				SMALLINT,
		@Cov_Exp_Base_Ind 				SMALLINT,
		@Cov_Risk_Id 					SMALLINT,
		@Cov_BCEG_CODE 					CHAR(2),
		@Cov_LastMod 					DATETIME,
		@Cov_Misc_Code					VARCHAR(3), 
		@Cov_SIC_Code 					VARCHAR(4),
		@Cov_ISO_Rating_Basis 			VARCHAR(1),
		@Cov_TERR_CODE					CHAR(1),    
		@Cov_KSTOKEY 					INT, 
		@Cov_NSTANUM					SMALLINT, 
		@Cov_NLOCNUM 					SMALLINT, 
		@Cov_NBLDNUM					SMALLINT,
		@Cov_NCOVNUM 					SMALLINT,
		@Cov_NSUBCOVNUM 				SMALLINT,
		@Cov_NOCCNUM					SMALLINT, 
		@Cov_LLOB 						VARCHAR(5),
		@Cov_LCOVTYPCDE 				VARCHAR(3),
		@Cov_LSUBCOVCDE		 			VARCHAR(3),
		@Cov_NVEHNUM 					SMALLINT,
		@Cov_NPRLNUM		 			SMALLINT,
		@Cov_LOB						VARCHAR(3),
		@sharedlimitind					VARCHAR(1),
       	@COV_ERR_CODE 					INT,
		@COV_ERR_DESC					VARCHAR(200),
		@COV_Error_Flag 				INT,
		@Cov_UPDATE_Code 				CHAR(1)

DECLARE @INTpolicylocationid			INT,
		@loc_policynumber				VARCHAR(15),
       	@loc_locationnumber				VARCHAR(4), 
		@loc_buildingnumber				VARCHAR(3),
		@loc_effectivedate				DATETIME,
		@loc_expirationdate				DATETIME,
       	@loc_address1					VARCHAR(50),
		@loc_address2					VARCHAR(50),
		@loc_city						VARCHAR(50),
		@loc_towncode					CHAR(5),
		@loc_statecode					VARCHAR(2),
		@loc_zip						VARCHAR(10),
		@loc_constructiontypecode		VARCHAR(2),
       	@loc_protectiontypecode			VARCHAR(2),
		@loc_communitygradedind			VARCHAR(1), 
		@loc_communitygradecode			VARCHAR(2),
		@loc_Policyrowid				INT,
		@loc_nexpnum					INT,
		@loctranscode                   CHAR(2),
		@LOC_Error_Flag			 		INT,                    
		@LOC_ERR_CODE 					INT,
		@policylocationid  				INT          
 
DECLARE @vehtranscode                   CHAR(2),            
		@INTaccountvehicleid			INT,
		@accountvehicleid				INT,
       	@policyvehicleid				INT,
		@veh_account_number				INT,
		@veh_policy_number				VARCHAR(15),
		@veh_vin						VARCHAR(17),
		@veh_year						INT,
		@veh_make						VARCHAR(20),
		@veh_model						VARCHAR(20),
		@veh_effective_date				DATETIME,
       	@veh_orig_cost					DECIMAL(15,2),
		@veh_lastmod					DATETIME,
		@veh_expiration_date			DATETIME,
		@veh_policyrowid				INT,
       	@veh_classcode					VARCHAR(6),
		@veh_unitnumber					VARCHAR(10), 
		@VEH_Error_Flag					INT,                    
       	@VEH_ERR_CODE 					INT,
		@garageterritory				VARCHAR(3),
		@garagetowncode					INT,
		@garageaddress1					VARCHAR(50),
		@garageaddress2					VARCHAR(50),
		@garagecity						VARCHAR(50),
		@garagecounty					VARCHAR(50),
		@garagestatecode				VARCHAR(2),
		@garagezip						VARCHAR(10)

DECLARE @POL_SUCCESS_IND 				INT, 
		@newexpirationdate		 		DATETIME,
        @ENDrNum			 			INT, 
		@ENDrDate 						DATETIME,    
        @params							VARCHAR(500),   
        @CoverageGroupcode 				VARCHAR(2) 

DECLARE @premopsoccrlimit   			DECIMAL(15,2),
        @premopsaggrlimit   			DECIMAL(15,2),
        @prodoccrlimit      			DECIMAL(15,2), 
        @prodaggrlimit      			DECIMAL(15,2),
        @medpaylimit        			DECIMAL(15,2)   

DECLARE @termpremium        			DECIMAL(15,2),
        @fullyearnedind     			VARCHAR(1), 
		@claimsmadeind					VARCHAR(1),
        @blanketind				 		VARCHAR(1),
		@blanketnumber 					VARCHAR(3),
		@whexclusionind			 		SMALLINT,       
		@policydate						DATETIME,       
        @roundingdate					DATETIME        

DECLARE @PARTIAL_SUCCESS_FLAG 			INT,
        @PARTIAL_SUCCESS_FLAG_VEH       INT,             
        @PARTIAL_SUCCESS_FLAG_LOC       INT,             
        @PARTIAL_SUCCESS_FLAG_TAX       INT,             
		@AccountEntry_Flag				INT,
		@TOTAL_ACTUAL_PREMIUM 			DECIMAL(14,2)

DECLARE @transtypecode		 			VARCHAR(2),
		@UPDATEpersonid			 		INT, 
		@DelegatedId 					INT,
		@ENDorsementseq			 		INT,
        @premium 						DECIMAL(15,2), 
		@ENDorsementstatus 				VARCHAR(2)
	
DECLARE @taxid							INT, 
		@taxpolicynumber				VARCHAR(15),
		@taxstatecode					VARCHAR(2),
		@taxcode						VARCHAR(8),
		@taxamt							DECIMAL(15,2),
		@termtax						DECIMAL(15,2),   
		@taxeffectivedate				DATETIME,
		@taxexpirationdate				DATETIME

DECLARE	@Insured_Name		 			CHAR(35), 
		@Insured_Addr_1			 		CHAR(30), 
		@Insured_Addr_2					CHAR(30), 
		@Insured_City 					CHAR(30), 
		@Insured_State 					CHAR(2), 
		@Insured_Postal_Code 			CHAR(9), 
		@Insured_Phone					VARCHAR(10), 
		@Insured_Phone_Ext 				VARCHAR(4)           

DECLARE @ERROR_DESC			 			VARCHAR(255)    
DECLARE @bor_name                       VARCHAR(10),  
		@Bor_id							INT 
DECLARE @Effective_Date					DATETIME, 
		@Expiration_Date		 		DATETIME 

DECLARE @comment 						VARCHAR(64) 

DECLARE @Identity						TABLE ( NewValue INT )

SET @error_code=0 

SELECT @StartTime = GETDATE()	

	DECLARE Curs_Imp_MIPS CURSOR FORWARD_ONLY READ_ONLY LOCAL FOR
	SELECT  DISTINCT P.RowId, P.Quote_Number, P.Account_Number, P.Policy_Number, P.USERID,P.Product, P.Policy_Type,
            P.Full_Prior_Ind, P.Retro_Date,E.Trans_ENDr_Num, E.Trans_Effective,p.ratingsourcecode,p.KSTOKEY,
            p.Insured_Name, p.Insured_Addr_1, p.Insured_Addr_2, p.Insured_City, p.Insured_State,p.Insured_Postal_Code, 
            p.Insured_Phone, p.Insured_Phone_Ext,P.siccode,E.LCHGDES ,p.bor_name,p.Bor_id,p.dba_name
	FROM	INT_Policy P, 
			INT_ENDorsement E, 
			POLICY POL
	WHERE	P.rowid=E.Policyrowid 
			and P.ERROR_CODE IS NULL 
			and E.Trans_Effective is not null 
			and P.import_status IS NULL  
			and P.Trans_Code=''55''
			and POL.PolicyNumber = P.Policy_Number
			--and POL.policystatus =''02''                              -- FPT 14051
			and isnull(p.ratingsourcecode,'''')in (''Bor'', ''CAM'')
	ORDER BY p.Policy_Number, RowId

	OPEN Curs_Imp_MIPS
	FETCH	Curs_Imp_MIPS 
	INTO	@RowId, @Quote_Number, @Account_Number, @Policy_Number, @USERID,@Product, @Policy_Type, 
			@Full_Prior_Ind, @Retro_Date, @ENDrNum, @ENDrDate, @ratingsourcecode,@KSTOKEY,@Insured_Name, 
			@Insured_Addr_1, @Insured_Addr_2, @Insured_City, @Insured_State, @Insured_Postal_Code, 
			@Insured_Phone, @Insured_Phone_Ext,@siccode , @comment,@bor_name ,@Bor_id ,@dbaname

	SET @prev_policy=''''   

	WHILE ( @@Fetch_Status = 0 ) BEGIN --Policy loop START 
  
		SELECT	@Effective_Date = EffectiveDate, 
				@Expiration_Date = ExpirationDate, 
				@Account_Number = accountnumber,
				@Product = productcode 
		FROM	policy 
		WHERE	policynumber = @policy_number; 
		
		-- FPT 16912 - Begin
		/*IF ( @Policy_Number in (	SELECT	policynumber 
									FROM	policy 
									WHERE	policystatus in (''16'',''17'')-- FPT 15270  (''00'',''01'')
								)
		) BEGIN 
			
			SELECT @Error_Flag = 1;
			SELECT @ERROR_CODE = 19;
			GOTO ERROR_HANDLER;
		END */
		-- FPT 16912 - End
		
		IF ( @Policy_Number in (	SELECT	policynumber 
									FROM	policy 
									WHERE	policystatus in (''15'')	) ) BEGIN 
			SELECT @Error_Flag = 1;
			SELECT @ERROR_CODE = 405;
			GOTO ERROR_HANDLER;
		END 

		SET @POL_SUCCESS_IND = 0;
-- BEGIN TRANSACTION POLTRANS
		SELECT @Error_Flag = 0;
		SELECT @PARTIAL_SUCCESS_FLAG = 0;
		SELECT @PARTIAL_SUCCESS_FLAG_LOC = 0;   
		SELECT @PARTIAL_SUCCESS_FLAG_VEH = 0;    
		SELECT @PARTIAL_SUCCESS_FLAG_TAX = 0;    
		SELECT @AccountEntry_Flag = 1;

		IF ( NOT EXISTS(	SELECT	POLICYNUMBER 
							FROM	policy 
							WHERE	POLICYNUMBER = @Policy_Number ) ) BEGIN  
			SELECT @Error_Flag = 1;
			SELECT @ERROR_CODE = 19;
			GOTO ERROR_HANDLER;
		END

		-- FPT 16912 - Begin
		/*IF ( EXISTS(	SELECT	POLICYNUMBER 
						FROM	policy 
						WHERE	POLICYNUMBER = @Policy_Number and 
								policystatus in (''16'',''17'')	) ) BEGIN		-- FPT 15270  (''00'',''01'')   
			SELECT @Error_Flag = 1;
			SELECT @ERROR_CODE = 118;
			GOTO ERROR_HANDLER;
		END*/
		-- FPT 16912 - End

		SET @NAME_KEY = null;

		SELECT	@NAME_KEY = addrid		-- FPT 15933
		FROM	nameaddress 
		WHERE	busname = @busname and 
				dbaname = @dbaname and 
				statecode = @insured_state and 
				zip = @Insured_Postal_Code;
-- FPT 15933
		IF ( @NAME_KEY IS NULL )  BEGIN -- N1

			INSERT INTO		NAMEADDRESS (
							prevaddrid, 
							nametype, 
							salutation, 
							firstname, 
							busname, 
							dbaname, 
							title, 
							address1, 
							address2, 
							city, 
							statecode, 
							zip, 
							busphone, 
							busphoneextn, 
							email, 
							CREATEdate, 
							CREATEpid, 
							CREATEdelegatepid
							)
			OUTPUT			INSERTED.addrid
			INTO			@Identity(NewValue)
			VALUES			(0,
							2,
							'''',
							'''',
							@Insured_Name, 
							@dbaname, 
							'''',
							@Insured_Addr_1,
							@Insured_Addr_2,
							@insured_city,
							@insured_state,
							@Insured_Postal_Code,
							'''', 
							''0000'',
							'''',
							getdate(),
							1,
							1); 
-- FPT 15933      
			IF ( @@ERROR <> 0 ) BEGIN -- N2
 				
				SELECT @Error_Flag = 1;
 				SELECT @ERROR_CODE = -1;
 				GOTO ERROR_HANDLER;
			 
			END -- N2

-- FPT 15933 
			SELECT		@NAME_KEY = NewValue
			FROM		@Identity;

			DELETE FROM @Identity;
-- FPT 15933 

		END -- N1

	IF ( not exists(	SELECT	1 
						FROM	policy 
						WHERE	policynumber = @policy_number and 
								insuredaddrid=@NAME_KEY		) )			 -- FPT 15933
		UPDATE	policy 
		SET		insuredaddrid = @NAME_KEY 
		WHERE	policynumber = @policy_number;

	IF ( @Account_Number = 9  ) BEGIN
		
		DECLARE @p VARCHAR(15)
       
		SELECT @p = left(@Policy_Number, CHARindex(''-'', @Policy_Number)-1) + ''%'';
		SELECT @Account_Number = null;
		
		SELECT	@Account_Number = accountnumber 
		FROM	policy 
		WHERE	policynumber like @p
-- FPT 15933       
		IF ( @Account_Number is null ) BEGIN 

			INSERT INTO		accountlead (
							accounttype,
							accountaddrid,
							billaccountaddrid,
							accountfein,
							anniversarydate,
							producercode,
							vENDor,
							source,
							sourcedetail,
							hotbutton,
							direct,
							billholdind,
							latepaycnt,
							returncheckcnt, 
							cancelationcnt,
							writeoffcnt,
							collectiontype,
							accountstatus,
							statusdate,
							CREATEdate,
							CREATEpid,	
							CREATEdelegatepid,
							iscustomer
							)
			OUTPUT			INSERTED.accountnumber
			INTO			@Identity(NewValue)
			VALUES			(3,
							@NAME_KEY, 
							@NAME_KEY,
							''9999999999'',
							@Effective_Date,
							@agencynumber,
							''EPIC'',
							1,
							1,
							'' '',
							0,
							''N'',
							0,
							0,
							0,
							0,
							''N'',
							''AC'',
							getdate(),
							getdate(),
							1,
							1,
							1 );

			SET @ERROR_CODE = @@ERROR

			IF @ERROR_CODE<> 0 BEGIN
				SET @Account_Number = -1
				GOTO ERROR_HANDLER
			END
       		ELSE BEGIN 
       			SELECT		@Account_Number = NewValue
				FROM		@Identity;

				DELETE FROM	@Identity;
			END

		END
		
		UPDATE	INT_policy 
		SET		account_number = @Account_Number 
		WHERE	policy_number = @Policy_Number;

	END
-- FPT 15933

COMMIT_TRANS:
--FPT 153002 tech starts
--  UPDATE INT_POLICY	SET ERROR_CODE = CONVERT(INT, ''2''),	LASTMOD = GETDATE() 
--  WHERE [RowID] = @RowID
--  EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, 2,''A''
	UPDATE	INT_policy   
	SET		error_code = 295, 
			lastmod = GETDATE()  
	WHERE	RowId = @RowId;

--FPT 153002 tech ends 
	SELECT @POL_SUCCESS_IND = 1;

-- COMMIT TRANSACTION POLTRANS
	SELECT @Error_Flag = 0;

Error_Handler:
	IF ( @Error_Flag = 1 ) BEGIN 
 
-- ROLLBACK TRANSACTION POLTRANS
		UPDATE	INT_POLICY 
		SET		ERROR_CODE = CONVERT(INT, @ERROR_CODE), 
				LASTMOD = GETDATE() 
		WHERE	[RowID] = @RowID;

		EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @ERROR_CODE,''A'';

		IF ( @ERROR_CODE <> 101 )
			UPDATE	INT_POLICIESTOIMPORT 
			SET		ERROR_CODE = CONVERT(INT, @ERROR_CODE), 
					LASTMOD = GETDATE(),
					ERROR_DESC =  ''MTC'',
					attempted = attempted + 1 
			WHERE QUOTENUMBER = @Quote_Number;

		SELECT @POL_SUCCESS_IND = 0;
	END 

	IF ( @POL_SUCCESS_IND = 1 ) BEGIN  --ENDorsement loop START

		SELECT	@TOTAL_ACTUAL_PREMIUM = 0;			
		SELECT	@transtypecode =''40'';

		SELECT	@UPDATEpersonid = personid 
		FROM	dbo.person 
		WHERE	userid = @userid ;

		SELECT	@DelegatedId = @UPDATEpersonid;
	                                    
		IF ( (	SELECT	count(policynumber) 
				FROM	policyENDorsement 
				WHERE	policynumber = @policy_number and 
						ENDorsementstatus = ''01'' and 
						aqsENDorsementnumber is  null	) > 0 )  BEGIN			--04/05/2005
	   
			SELECT @Error_Flag = 1;
			SELECT @ERROR_CODE = 155;
		
			EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @ERROR_CODE,''A'';
		
			GOTO ENDR_END;
	END

	SELECT	@ENDorsementseq = max(ENDorsementseq) + 1 
	FROM	policyENDorsement 
	WHERE	policynumber = @policy_number;

	IF ( @ENDorsementseq is null ) SET @ENDorsementseq = 1;

	SELECT	@premium = sum(writtenpremium) 
	FROM	premiumstat 
	WHERE	policynumber = @policy_number;

	IF ( @premium is null ) SET @premium = 0;

	SET @ENDorsementstatus = ''01'';
 
	INSERT INTO	policyENDorsement (
				policynumber,
				ENDorsementseq,
				transtypecode,
				aqsENDorsementnumber,
				effectivedate,
				startdate,
				premium,
				revisedpremium,
				ENDorsementstatus,
				CREATEdate,
				CREATEpid,
				CREATEdelegatepid, 
				comment 
				)
	VALUES		(
				@policy_number,
				@ENDorsementseq,
				@transtypecode,
				@ENDrNum,
				@ENDrDate,
				getdate(),
				@premium,
				0,
				@ENDorsementstatus,
				getdate(),
				isnull(@UPDATEpersonid, 1),
				isnull(@UPDATEpersonid, 1),
				@comment
				);

-------------ReprINT ENDorsement Grundy 
	IF ( @comment = ''GRUNDY REPRINT'' ) BEGIN
		
		EXEC dbo.INT_reprINTENDorsement @policy_number,@ENDrDate,@ENDorsementseq,1,1,@ERROR_CODE OUTPUT
		
		IF ( @ERROR_CODE <> 0 ) BEGIN
			SELECT @Error_Flag = 1;

			EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @ERROR_CODE,''A'';

			GOTO ENDr_END;
		END
	END 
-------------ReprINT ENDorsement Grundy
--LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
	DECLARE Curs_Imp_Location CURSOR FORWARD_ONLY READ_ONLY LOCAL FOR
		SELECT DISTINCT policylocationid,policynumber,locationnumber,buildingnumber,effectivedate,expirationdate,address1,address2,
			city,towncode,statecode,zip,constructiontypecode,protectiontypecode,communitygradedind,communitygradecode,
			Policyrowid,nexpnum,transcode
		FROM INT_policylocation 
		WHERE policyrowid=@RowId and policynumber = @policy_number and error_code is null and
			policynumber  not in (SELECT policynumber FROM dbo.policy WHERE convertedind=''Y'' )                                                                                  --04/06/2005

	OPEN Curs_Imp_Location

	FETCH Curs_Imp_Location INTO  @INTpolicylocationid,@loc_policynumber,@loc_locationnumber,@loc_buildingnumber,
		@loc_effectivedate,@loc_expirationdate,@loc_address1,@loc_address2,@loc_city,@loc_towncode,@loc_statecode,
		@loc_zip,@loc_constructiontypecode,@loc_protectiontypecode,@loc_communitygradedind, @loc_communitygradecode,
		@loc_Policyrowid,@loc_nexpnum,@loctranscode

	WHILE ( @@fetch_status = 0 ) BEGIN  --location loop
		
		SELECT @LOC_Error_Flag = 0;
		SELECT @LOC_ERR_CODE = 0;
		
		SELECT	@loc_communitygradecode = communitygradecode 
		FROM	communitygrade 
		WHERE	communitygradecode = @loc_communitygradecode;

		IF ( @@rowcount = 0 ) SET @loc_communitygradecode = null;

		SELECT	@loc_protectiontypecode = protectiontypecode 
		FROM	protectiontype 
		WHERE	protectiontypecode = @loc_protectiontypecode;

		IF ( @@rowcount = 0 ) SET @loc_protectiontypecode = null;
		
		SELECT	@loc_constructiontypecode = constructiontypecode 
		FROM	constructiontype 
		WHERE	constructiontypecode = @loc_constructiontypecode;

	    IF ( @@rowcount = 0 ) SET @loc_constructiontypecode = null;

		IF ( @loctranscode = ''07'' ) BEGIN 
			IF exists(	SELECT	policynumber 
						FROM	policylocation 
						WHERE	policynumber = @loc_policynumber and
								locationnumber = @loc_locationnumber and 
								buildingnumber = @loc_buildingnumber and 
								statecode = @loc_statecode
					 ) 
			BEGIN
				SELECT @LOC_Error_Flag = 1;
				SELECT @LOC_ERR_CODE = 15;
				GOTO LOC_ERROR_HANDLER;    
			END   
-- FPT 15933      
			INSERT INTO		Policylocation (
							policynumber, 
							locationnumber, 
							buildingnumber, 
							effectivedate, 
							expirationdate,
							address1, 
							address2,
							city, 
							towncode, 
							statecode, 
							zip, 
							constructiontypecode, 
							protectiontypecode,
							communitygradedind, 
							communitygradecode, 
							CREATEdate, 
							CREATEpid, 
							CREATEdelegatepid 
							)
			OUTPUT			INSERTED.policylocationid
			INTO			@Identity( NewValue )
			VALUES			( @loc_PolicyNumber, 
							@loc_locationnumber, 
							@loc_buildingnumber,
							@loc_effectivedate, 
							@loc_expirationdate,
							@loc_address1,
							@loc_address2,
							@loc_city,
							@loc_towncode, 
							@loc_Statecode, 
							@loc_Zip,
							@loc_ConstructionTypecode,
							@loc_protectiontypecode,
							@loc_communitygradedind,
							@loc_communitygradecode, 
							getdate(),
							1,
							1 );

			IF @@error <> 0 BEGIN
				SELECT @LOC_Error_Flag = 1
				SELECT @LOC_ERR_CODE = 151
				GOTO LOC_ERROR_HANDLER    
			END
			ELSE BEGIN
				UPDATE		INT_policylocation 
				SET			error_code = 3,
							policylocationmipsid = (SELECT NewValue FROM @Identity) 
				WHERE		policylocationid = @INTpolicylocationid
				
				DELETE FROM @Identity;
			END	
-- FPT 15933 
		END	
		ELSE IF @loctranscode = ''08'' BEGIN
			SELECT	@policylocationid = policylocationid 
			FROM	policylocation 
			WHERE	policynumber = @loc_PolicyNumber and  
					locationnumber = @loc_locationnumber and  
					buildingnumber = @loc_buildingnumber and 
					statecode = @loc_statecode and
					effectivedate <> expirationdate;		-- FPT 15933

			IF @policylocationid is not null and @policylocationid <> 0 BEGIN
				
				UPDATE	policylocation 
				SET		address1 = @loc_address1, 
						address2 = @loc_address2, 
						city = @loc_city, 
						towncode = @loc_towncode, 
						zip = @loc_Zip, 
						constructiontypecode = @loc_ConstructionTypecode, 
						protectiontypecode = @loc_protectiontypecode, 
						communitygradedind = @loc_communitygradedind, 
						communitygradecode = @loc_communitygradecode,
						UPDATEdate = getdate(), 
						UPDATEpid = 1, 
						UPDATEdelegatepid = 1 
				WHERE	policylocationid = @policylocationid;

				IF @@error <> 0 BEGIN
					SELECT @LOC_Error_Flag = 1;
					SELECT @LOC_ERR_CODE = 151;
					GOTO LOC_ERROR_HANDLER;    
				END
			ELSE
				UPDATE	INT_policylocation 
				SET		error_code = 3,
						policylocationmipsid = @policylocationid 
				WHERE	policylocationid = @INTpolicylocationid;                    
			END
		END
		ELSE BEGIN
			SET @policylocationid = null;
	 
			SELECT	@policylocationid = policylocationid
			FROM	policylocation 
			WHERE	policynumber = @loc_PolicyNumber and 
					locationnumber = @loc_locationnumber and  
					buildingnumber = @loc_buildingnumber and 
					statecode = @loc_statecode and
					effectivedate <> expirationdate;

			IF @@error = 0 and @policylocationid is not null and @policylocationid <> 0 BEGIN
				
				UPDATE	policylocation 
				SET		expirationdate = @loc_expirationdate, 
						address1 = @loc_address1, 
						address2 = @loc_address2, 
						city = @loc_city,
						towncode = @loc_towncode, 
						zip = @loc_Zip, 
						constructiontypecode = @loc_ConstructionTypecode, 
						protectiontypecode = @loc_protectiontypecode, 
						communitygradedind = @loc_communitygradedind, 
						communitygradecode = @loc_communitygradecode,
						UPDATEdate = getdate(), 
						UPDATEpid = 1, 
						UPDATEdelegatepid = 1 
				WHERE	policylocationid = @policylocationid;

				IF @@error <> 0 BEGIN
					SELECT @LOC_Error_Flag = 1;
					SELECT @LOC_ERR_CODE = 151;
					GOTO LOC_ERROR_HANDLER;    
				END
				ELSE
					UPDATE	INT_policylocation 
					SET		error_code = 3,
							policylocationmipsid = @policylocationid 
					WHERE	policylocationid = @INTpolicylocationid;                     
			END
			ELSE BEGIN
				SELECT @LOC_Error_Flag = 1;
				SELECT @LOC_ERR_CODE = 167;
				GOTO LOC_ERROR_HANDLER;    
			END
		END

LOC_COMMIT_TRANS:
	BEGIN 
		UPDATE	INT_POLICYLOCATION 
		SET		ERROR_CODE = 3, 
				LASTMOD = GETDATE() 
		WHERE	policylocationid = @INTpolicylocationid;
	END 

LOC_Error_Handler:
	IF @LOC_Error_Flag = 1 BEGIN  
		
		UPDATE	INT_POLICYLOCATION 
		SET		ERROR_CODE = @LOC_ERR_CODE, 
				LASTMOD = GETDATE() 
		WHERE	policylocationid = @INTpolicylocationid;

	    EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @LOC_ERR_CODE, ''A'';	

		SELECT @PARTIAL_SUCCESS_FLAG_LOC = 1;
		SELECT @LOC_Error_Flag = 0;
	END
									
	FETCH Curs_Imp_Location INTO  @INTpolicylocationid,@loc_policynumber,@loc_locationnumber,@loc_buildingnumber,
		 @loc_effectivedate,@loc_expirationdate,@loc_address1,@loc_address2,@loc_city,@loc_towncode,@loc_statecode,@loc_zip,
		 @loc_constructiontypecode,@loc_protectiontypecode,@loc_communitygradedind, @loc_communitygradecode,
		 @loc_Policyrowid,@loc_nexpnum,@loctranscode
	END
	
	CLOSE		Curs_Imp_Location;
	DEALLOCATE	Curs_Imp_Location;
--LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL

--VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV  
	DECLARE Curs_Imp_vehicle CURSOR FORWARD_ONLY READ_ONLY LOCAL FOR 
		SELECT accountvehicleid, account_number, policy_number, vin, [year], make, model, effective_date, orig_cost, lastmod, 
			expiration_date, policyrowid, classcode, unitnumber, territory, towncode, garageaddress1, garageaddress2, garagecity, 
			garagecounty, garagestatecode, garagezip, transcode
		FROM INT_vehicleinfo 
		WHERE policyrowid=@RowId and error_code is null and policy_number = @policy_number and 
			policy_number not in (SELECT policynumber FROM dbo.policy WHERE convertedind=''Y'')
		ORDER BY unitnumber, transcode DESC    

	OPEN Curs_Imp_vehicle

	FETCH Curs_Imp_vehicle INTO  @INTaccountvehicleid, @veh_account_number, @veh_policy_number, @veh_vin, @veh_year, @veh_make, 
		@veh_model, @veh_effective_date, @veh_orig_cost, @veh_lastmod, @veh_expiration_date, @veh_policyrowid, @veh_classcode, 
		@veh_unitnumber, @garageterritory, @garagetowncode, @garageaddress1, @garageaddress2, @garagecity, @garagecounty, 
		@garagestatecode, @garagezip, @vehtranscode

	WHILE ( @@fetch_status = 0 ) BEGIN    -- Vehicle Loop
		
		SELECT @VEH_Error_Flag = 0;
		SELECT @VEH_ERR_CODE = 0;
    

		IF ( @veh_vin is null OR ltrim(@veh_vin) = '''' ) BEGIN
			
			SELECT @VEH_Error_Flag = 1;
			SELECT @VEH_ERR_CODE = 169; -- ''Invalid VIN''
			
			GOTO VEH_ERROR_HANDLER;

		END

-- FPT 16408 - Start

		-- If the garage statecode is empty then substitute it with insured''s state.
		IF (LTRIM(@garagestatecode) = '''' AND @bor_name = ''GRUNDY'')
			SET @garagestatecode = @Insured_State
		
		-- If the supplied garage state code is not a valid state, then set the error as ''Invalid State''.	
		IF  ( NOT EXISTS ( SELECT StateCode FROM [STATE] WHERE StateCode = @garagestatecode ) AND 
			@vehtranscode <> ''09'' AND @bor_name = ''GRUNDY'') 
		BEGIN

			SELECT @VEH_Error_Flag = 1;
			SELECT @VEH_ERR_CODE = 315; -- ''Invalid State''
			
			GOTO VEH_ERROR_HANDLER;

		END
-- FPT 16408 - End

		SET 	@accountvehicleid = null;                
   		SET 	@policyvehicleid  = null;
   	
-- FPT 15933 - Begins
		SELECT	@accountvehicleid = av.accountvehicleid 
		FROM	dbo.AccountVehicle av INNER JOIN policyvehicle pv ON av.accountvehicleid = pv.accountvehicleid
		WHERE	av.accountnumber = @account_number AND 
				av.vin = @veh_vin AND
				pv.policynumber = @policy_number AND
				pv.effectivedate <> pv.expirationdate;
-- FPT 15933 - Ends

		IF ( @vehtranscode = ''07'' ) BEGIN	--Veh Add Start (Bor)
-- FPT 15933
			IF ( @accountvehicleid IS NULL ) BEGIN

				INSERT INTO		accountvehicle(
								accountnumber, 
								vin, 
								vehicleyear, 
								vehiclemake, 
								vehiclemodel, 
								CREATEdate, 
								CREATEpid, 
								CREATEdelegatepid,
								costnew, 
								unitnumber, 
								classcode, 
								territory, 
								towncode,  
								garageaddress1, 
								garageaddress2, 
								garagecity, 
								garagecounty, 
								garagestatecode, 
								garagezip
								)
				OUTPUT			INSERTED.accountvehicleid
				INTO			@Identity( NewValue )
				VALUES			(
								@account_number, 
								@veh_vin, 
								@veh_year, 
								@veh_make, 
								@veh_model, 
								getdate(), 
								1, 
								1, 
								@veh_orig_cost, 
								@veh_unitnumber,
								@veh_classcode, 
								@garageterritory, 
								@garagetowncode, 
								@garageaddress1, 
								@garageaddress2, 
								@garagecity, 
								@garagecounty, 
								@garagestatecode, 
								@garagezip
								);

				IF ( @@error <> 0 ) BEGIN

					SELECT @VEH_Error_Flag = 1;
					SELECT @VEH_ERR_CODE = 152;
					
					GOTO VEH_ERROR_HANDLER;

				END

				SELECT		@accountvehicleid = NewValue 
				FROM		@Identity;

				DELETE FROM	@Identity;
			END

			IF ( EXISTS(	SELECT	1 
						FROM	policyvehicle 
						WHERE	accountvehicleid = @accountvehicleid and 
								policynumber = @veh_policy_number and 
								effectivedate <= @veh_effective_date and 
								expirationdate > @veh_expiration_date and 
								effectivedate <> expirationdate ) 
				and @comment!=''GRUNDY REPRINT'' ) BEGIN

				SELECT @VEH_Error_Flag = 1;
				SELECT @VEH_ERR_CODE = 27;
				
				GOTO VEH_ERROR_HANDLER;

			END
-- FPT 15933

			INSERT INTO	policyvehicle	
						(
						policynumber, 
						accountvehicleid, 
						effectivedate, 
						expirationdate,
						endorsementseq,
						endorsementstatus, 
						CREATEdate, 
						CREATEpid, 
						CREATEdelegatepid
						)
			VALUES		(
						@veh_policy_number, 
						@accountvehicleid, 
						@veh_effective_date, 
						@veh_expiration_date, 
						@endorsementseq,
						''03'',
						getdate(), 
						1, 
						1
						);

			IF ( @@error <> 0 ) BEGIN
				SELECT @VEH_Error_Flag = 1;
				SELECT @VEH_ERR_CODE = 154;

				GOTO VEH_ERROR_HANDLER;
			END
		
			GOTO VEH_COMMIT_TRANS;

		END		--Veh Add STOP (Bor)

    IF ( @vehtranscode = ''08'' ) BEGIN	--Veh Chg Start (Bor)
-- FPT 15933
		IF ( @accountvehicleid IS NOT NULL ) BEGIN

			INSERT INTO		accountvehicle(
							accountnumber, 
							vin, 
							vehicleyear, 
							vehiclemake, 
							vehiclemodel, 
							CREATEdate, 
							CREATEpid, 
							CREATEdelegatepid,
							costnew, 
							unitnumber, 
							classcode, 
							territory, 
							towncode,  
							garageaddress1, 
							garageaddress2, 
							garagecity, 
							garagecounty, 
							garagestatecode, 
							garagezip
							)
			OUTPUT			INSERTED.accountvehicleid
			INTO			@Identity( NewValue )
			VALUES			(
							@account_number, 
							@veh_vin, 
							@veh_year, 
							@veh_make, 
							@veh_model, 
							getdate(), 
							1, 
							1, 
							@veh_orig_cost, 
							@veh_unitnumber,
							@veh_classcode, 
							@garageterritory, 
							@garagetowncode, 
							@garageaddress1, 
							@garageaddress2, 
							@garagecity, 
							@garagecounty, 
							@garagestatecode, 
							@garagezip
							);
	          
			IF ( @@error <> 0 ) BEGIN
				SELECT @VEH_Error_Flag = 1;
				SELECT @VEH_ERR_CODE = 152;
				GOTO VEH_ERROR_HANDLER;
			END

			SELECT		@accountvehicleid = NewValue
			FROM		@Identity;

			DELETE FROM	@Identity;
		END
-- FPT 15933
		ELSE BEGIN
			SELECT @VEH_Error_Flag = 1;
			SELECT @VEH_ERR_CODE = 171;		  --Vehicle not Found
			GOTO VEH_ERROR_HANDLER;   
		END

		GOTO VEH_COMMIT_TRANS;

	END     --Veh Chg STOP  (Bor)

    IF ( @vehtranscode = ''09'' ) BEGIN	--Veh Del Start (Bor)
-- FPT 15933
		DECLARE		covdel CURSOR FOR
					SELECT	pc.policycoverageid 
					FROM	accountvehicle ac INNER JOIN Vehiclecoverage vc ON vc.accountvehicleid = ac.accountvehicleid 
							INNER JOIN policycoverage pc ON pc.policycoverageid = vc.policycoverageid
					WHERE	vc.policynumber = @veh_policy_number AND
							ac.vin = @veh_vin AND 
							pc.expirationdate > @ENDrDate AND 
							vc.expirationdate > @ENDrDate AND
							vc.effectivedate <> vc.expirationdate
-- FPT 15933			 
		OPEN	covdel
		FETCH	covdel INTO @policycoverage_id
		
		WHILE ( @@fetch_status = 0 ) BEGIN
			
			EXEC INT_PA_CoverageDelSave @policy_number, @policycoverage_id, @veh_effective_date, 1, 1, @Error_Number OUTPUT, @errormsg OUTPUT      
			
			IF ( @Error_Number <> 0 ) BEGIN
				SELECT @VEH_Error_Flag = 1;
				SELECT @VEH_ERR_CODE = 14;			
				GOTO VEH_ERROR_HANDLER;
			END
			
			FETCH covdel INTO @policycoverage_id
		END
		
		CLOSE		covdel;
		DEALLOCATE	covdel;

		SELECT	@policyvehicleid = policyvehicleid 
        FROM	policyvehicle 
        WHERE	isnull(accountvehicleid,0) = isnull(@accountvehicleid,0) and 
				policynumber = @veh_policy_number and 
				@ENDrDate >= effectivedate and 
				@ENDrDate < expirationdate and
				effectivedate <> expirationdate;

		IF ( @@error <> 0 ) or ( @policyvehicleid is null ) BEGIN
			SELECT @VEH_Error_Flag = 1;
			SELECT @VEH_ERR_CODE = 34; -- ''Vehicle Not Found''
			GOTO VEH_ERROR_HANDLER;    
		END

		UPDATE	policyvehicle 
		SET		newexpirationdate = @veh_effective_date, 
				ENDorsementstatus = ''05'', 
				ENDorsementseq = @ENDorsementseq, 
				UPDATEdate = getdate(), 
				UPDATEpid = 1, 
				UPDATEdelegatepid = 1 
		WHERE policyvehicleid = @policyvehicleid;

	END	--Veh Del STOP (Bor)

VEH_COMMIT_TRANS:
	UPDATE	INT_vehicleinfo 
	SET		ERROR_CODE = 3, 
			LASTMOD = GETDATE() 
	WHERE	accountvehicleid = @INTaccountvehicleid ;

VEH_Error_Handler:
     IF ( @VEH_Error_Flag = 1 ) BEGIN  
		
		UPDATE	INT_vehicleinfo 
		SET		ERROR_CODE = @VEH_ERR_CODE, 
				LASTMOD = GETDATE() 
        WHERE	accountvehicleid = @INTaccountvehicleid ;

		EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @VEH_ERR_CODE,''A'';

		SELECT @PARTIAL_SUCCESS_FLAG_VEH = 1;
		SET @VEH_Error_Flag = 0;

     END
	
NextVeh:
	FETCH Curs_Imp_vehicle INTO @INTaccountvehicleid,@veh_account_number,@veh_policy_number,@veh_vin,@veh_year,@veh_make,
		@veh_model,@veh_effective_date,@veh_orig_cost,@veh_lastmod,@veh_expiration_date,@veh_policyrowid,
		@veh_classcode,@veh_unitnumber,@garageterritory,@garagetowncode,@garageaddress1,@garageaddress2,@garagecity,
		@garagecounty,@garagestatecode,@garagezip,@vehtranscode
	END  --Vehicle loop 

	CLOSE		Curs_Imp_vehicle;
	DEALLOCATE	Curs_Imp_vehicle;
--VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
  
--TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
	DECLARE	Curs_Imp_policytax CURSOR FORWARD_ONLY READ_ONLY LOCAL
	FOR		SELECT	taxid,policynumber,statecode, taxcode,taxamt, effectivedate,expirationdate FROM INT_policytax 
			WHERE	policyrowid=@RowId and error_code is null      
					and policynumber = @policy_number            

	OPEN	Curs_Imp_policytax

	FETCH	Curs_Imp_policytax
	INTO	@taxid,@taxpolicynumber,@taxstatecode,  @taxcode, 
			@taxamt,@taxeffectivedate, @taxexpirationdate

	WHILE ( @@fetch_status = 0 ) BEGIN   --tax loop
		IF ( @taxcode = ''FLFIGA''  --FPT 12959
           or @taxcode=''FLFIGA07'')  --FPT 16284
           BEGIN		
			UPDATE	int_policytax 
			SET		error_code = 3 
			WHERE taxid = @taxid		--don''t process - just mark as successful
		END 
		ELSE IF ( @taxamt is null ) BEGIN		--FPT 12959 done
      
			UPDATE	INT_policytax 
			SET		error_code = 165 
			WHERE	taxid = @taxid;

			SET @PARTIAL_SUCCESS_FLAG_TAX = 1;                                                          
		END
		ELSE BEGIN
			
			EXEC PA_GetRoundingDates @policy_number, @policydate OUTPUT, @roundingdate OUTPUT;
    
			SET @taxeffectivedate = @ENDrDate;
			SET		@taxfullyearnedind   =	CASE 
												WHEN @taxcode in ( SELECT taxcode FROM dbo.pa_fullyearnedtaxcodes() ) THEN ''Y''
												WHEN dbo.days365(@Effective_Date, @Expiration_Date) < 365 THEN ''Y'' 
												when ( @taxcode = ''RPG'' ) then ''Y'' 
												WHEN exists (SELECT 1 FROM INT_coverage WHERE policyrowid = @RowId and erpind=''Y'') THEN ''Y'' -- FPT 15933
												ELSE ''N'' 
											END;
	-----12073
	--	If @taxcode=''RPG'' 
	--		SET @taxfullyearnedind = ''N''
	------12073
			SELECT	@termtax =	CASE 
									WHEN @taxfullyearnedind = ''Y'' THEN @taxamt
									ELSE dbo.PA_ProrateTax (@taxamt, @taxeffectivedate, @taxexpirationdate, @policydate, @roundingdate) 
								END;

		    INSERT INTO	policytax 
						(
						policynumber,
						statecode, 
						taxcode, 
						actualtaxamt,
						taxamt, 
						effectivedate,
						expirationdate , 
						fullyearnedind, 
						ENDorsementseq,
						ENDorsementstatus,
						ratingsourcecode,
						CREATEdate, 
						CREATEpid,
						CREATEdelegatepid
						)  
			VALUES		(
						@taxpolicynumber,
						@taxstatecode,
						@taxcode,
						@taxamt,
						@termtax, 
						@taxeffectivedate,
						@taxexpirationdate,
						@taxfullyearnedind, 
						@ENDorsementseq,
						''03'',
						upper( @ratingsourcecode ),
						getdate(), 
						1, 
						1 
						)  

			IF ( @@error <> 0 ) BEGIN
				UPDATE	INT_POLICY 
				SET		ERROR_CODE = 165, 
						LASTMOD = GETDATE() 
				WHERE	[RowID] = @RowID;

				EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, 165,''A''

				UPDATE INT_policytax SET error_code=165 WHERE taxid=@taxid
				SET @PARTIAL_SUCCESS_FLAG_TAX=1                                                                                                        --04/04/2005
			END
			ELSE BEGIN
				UPDATE	INT_policytax 
				SET		error_code = 3 
				WHERE   taxid=@taxid;
			END
		END
	
		FETCH	Curs_Imp_policytax 
		INTO	@taxid,@taxpolicynumber,@taxstatecode,  @taxcode, @taxamt,
				@taxeffectivedate, @taxexpirationdate

	END  --tax loop
	
	CLOSE Curs_Imp_policytax;
	DEALLOCATE Curs_Imp_policytax;
--TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

--CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
	DECLARE		Curs_Imp_Coverage CURSOR FORWARD_ONLY READ_ONLY LOCAL 
	FOR			SELECT		[Id], Quote_Number,Policy_Number,Trans_Code,Trans_Date,UPDATE_Date,Rate_Block_Num,Location_Number,
							Building_Number,Coverage_Code,State,Territory,Subline,Class_Code,Oth_Code,Town_Code,Effective_Date,
							Expiration_Date,ASLOB,ISO_Coverage_Code,Rating_ID_Code,Construction_Code,Protection_Code, ISO_Deductible_Code,
							Deductible,Limit,Exposure,Exposure1,  PIC_Rating_Basis,Manual_Rate,Actual_Premium,Actual_Rate,Package_ModIFier,
							Experience_ModIFier,Schedule_ModIFier,Individual_ModIFier,Expense_ModIFier,MLRP_Dispension_ModIFier,
							Rate_Departure_LCM,ALL_Risk_Ind,CoinsurancePct,Class_Limit_Indv,Rate_Group,ISO_Limit_ID,Policy_Limits_Code,
							Limit_Indv,Limit_Occurance,Limit_Aggregate,Deductible_Indv,Deductible_Occurance,Deductible_Aggregate,
							ISO_Risk_ID_Code,Risk_ID_Code,Exposure_Indicator,RC_Exposure_Base,RC_Report_Base,Liability_Code,Med_Pay_Ind,
							FORm,Number_Employees,Limit_Per_Thousand,State_Exception,Aggregate_Limit_Code,Zone_Rating_Code,
							Anti_Theft_Device,Age_Garage_Code,Value_Per_Rating_Unit,Original_Cost_New,ISO_OCN_Code,Comp_Deductible,
							Theft_Deductible,ISO_PIP_Limit_ID,PIP_Limit_Code,PIP_Deductible_Code,Type_Of_Equipt,Zip_Code,Construction_Type,
							Equip_Type_Coverage,Att_Ind,Rate_Grade, Flat_Deduct,Exp_Base_Ind,Risk_Id,BCEG_CODE,LastMod, KSTOKEY, NSTANUM, 
							NLOCNUM, NBLDNUM, NCOVNUM,NSUBCOVNUM, NOCCNUM, LLOB, LCOVTYPCDE, LSUBCOVCDE, NVEHNUM, NPRLNUM,Misc_Code, 
							SIC_Code, ISO_Rating_Basis, premopsoccrlimit, premopsaggrlimit,prodoccrlimit, prodaggrlimit, medpaylimit,
							Terr_Code,misc_modIFier1,misc_modIFier2,vin,fullyearnedind,blanketind,rate_group,blanketnumber,sharedlimitind,
							policylevelind,rating_mod,loss_cost_date, retro_date,prior_date,xwshind,lded,AQSKEY,BOPLiabilitylimit,erpind 
							,XRef  --sandip for fwa   
				FROM		INT_Coverage 
				WHERE		POLICYROWID = @RowId AND 
							ERROR_CODE IS NULL and 
							policy_number = @Policy_Number 
				ORDER BY	isnull(ncltchgnum,0), Trans_Code DESC 
 
	IF ( @@ERROR <> 0 ) BEGIN  
		SELECT @Error_Flag = 1;
		SELECT @ERROR_CODE = 23;

		EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @ERROR_CODE,''A'';

		DEALLOCATE Curs_Imp_Coverage;
	END 

	OPEN Curs_Imp_Coverage

	FETCH	Curs_Imp_Coverage 
	INTO	@Cov_CoverageId, @Cov_Quote_Number, @Cov_Policy_Number, @Cov_Trans_Code,@Cov_Trans_Date, 
			@Cov_UPDATE_Date, @Cov_Rate_Block_Num, @Cov_Location_Number, @Cov_Building_Number, @Cov_Coverage_Code, 
			@Cov_State,@Cov_Territory, @Cov_Subline, @Cov_Class_Code, @Cov_Oth_Code, @Cov_Town_Code,@Cov_Effective_Date, 
			@Cov_Expiration_Date, @Cov_ASLOB, @Cov_ISO_Coverage_Code,@Cov_Rating_ID_Code, @Cov_Construction_Code, 
			@Cov_Protection_Code, @Cov_ISO_Deductible_Code, @Cov_Deductible, @Cov_Limit, @Cov_Exposure,@Cov_Exposure1,
			@Cov_PIC_Rating_Basis, @Cov_Manual_Rate, @Cov_Actual_Premium, @Cov_Actual_Rate, @Cov_Package_ModIFier, 
			@Cov_Experience_ModIFier, @Cov_Schedule_ModIFier, @Cov_Individual_ModIFier, @Cov_Expense_ModIFier,
			@Cov_MLRP_Dispension_ModIFier, @Cov_Rate_Departure_LCM, @Cov_ALL_Risk_Ind,@Cov_CoinsurancePct, 
			@Cov_Class_Limit_Indv, @Cov_Rate_Group, @Cov_ISO_Limit_ID, @Cov_Policy_Limits_Code, @Cov_Limit_Indv,
			@Cov_Limit_Occurance, @Cov_Limit_Aggregate, @Cov_Deductible_Indv, @Cov_Deductible_Occurance, 
			@Cov_Deductible_Aggregate, @Cov_ISO_Risk_ID_Code, @Cov_Risk_ID_Code, @Cov_Exposure_Indicator, 
			@Cov_RC_Exposure_Base, @Cov_RC_Report_Base, @Cov_Liability_Code, @Cov_Med_Pay_Ind, @Cov_FORm, 
			@Cov_Number_Employees, @Cov_Limit_Per_Thousand, @Cov_State_Exception, @Cov_Aggregate_Limit_Code, 
			@Cov_Zone_Rating_Code, @Cov_Anti_Theft_Device, @Cov_Age_Garage_Code, @Cov_Value_Per_Rating_Unit, 
			@Cov_Original_Cost_New, @Cov_ISO_OCN_Code, @Cov_Comp_Deductible, @Cov_Theft_Deductible, @Cov_ISO_PIP_Limit_ID, 
			@Cov_PIP_Limit_Code, @Cov_PIP_Deductible_Code, @Cov_Type_Of_Equipt, @Cov_Zip_Code, @Cov_Construction_Type,
			@Cov_Equip_Type_Coverage,@Cov_Att_Ind,@Cov_Rate_Grade, @Cov_Flat_Deduct, @Cov_Exp_Base_Ind, @Cov_Risk_Id, 
			@Cov_BCEG_CODE, @Cov_LastMod, @Cov_KSTOKEY, @Cov_NSTANUM, @Cov_NLOCNUM, @Cov_NBLDNUM, @Cov_NCOVNUM, 
			@Cov_NSUBCOVNUM, @Cov_NOCCNUM, @Cov_LLOB, @Cov_LCOVTYPCDE, @Cov_LSUBCOVCDE, @Cov_NVEHNUM, @Cov_NPRLNUM,
			@Cov_Misc_Code, @Cov_SIC_Code, @Cov_ISO_Rating_Basis, @premopsoccrlimit, @premopsaggrlimit,@prodoccrlimit, 
			@prodaggrlimit, @medpaylimit,@Cov_TERR_CODE,@miscmodIFier1,@miscmodIFier2,@Cov_vin, @fullyearnedind,@blanketind,
			@cov_rate_group,@blanketnumber,@sharedlimitind,@policylevelind,@cov_rating_mod,@cov_loss_cost_date,@cov_retro_date,
			@cov_prior_date,@whexclusionind,@lded,@AQSKEY,@BOPLiabilitylimit,@erpind,@Cov_Coverage_XRef  --sandip for fwa 
  
	IF ( @@ERROR <> 0 ) BEGIN 
		SELECT @Error_Flag = 1;
		SELECT @ERROR_CODE = 23; 
		
		EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @ERROR_CODE,''A''

		CLOSE Curs_Imp_Coverage;
		DEALLOCATE Curs_Imp_Coverage;

	END							

	SELECT @COV_ERR_CODE = 0;
	
	WHILE ( @@Fetch_Status = 0 ) BEGIN  --Coverage loop  START
		
		BEGIN TRANSACTION COVTRANS
   
		SELECT @COV_Error_Flag = 0;

		IF ( @Cov_Trans_Code = ''07'' )  BEGIN  --Addcoverage loop START
			
			IF ( @Policy_Type = ''BL'' and @Cov_Coverage_Code <> ''GLBIL'' and @Cov_Coverage_Code <> ''BOPL'' ) BEGIN
				
				IF ( NOT EXISTS(	SELECT	PRODUCTCODE 
									FROM	PRODUCT 
									WHERE PRODUCTCODE = @Product ) ) BEGIN
					SELECT @COV_Error_Flag = 1;
					SELECT @COV_ERR_CODE = 81;

					GOTO COV_ERROR_HANDLER;
				END
			END
			ELSE IF ( @Policy_Type <> ''BL'' and @Cov_Coverage_Code <> ''GLBIL'' and @Cov_Coverage_Code <> ''BOPL'' ) BEGIN

				IF ( @Product not in (	''AR'', ''BB'', ''BC'', ''BH'', ''CB'', ''DB'',''FB'', ''FT'', ''GB'', 
										''HB'', ''LB'', ''MB'',  ''NB'', ''PB'', ''RB'', ''RU'', ''SP'', ''UB'', 
										''UP'', ''YB'') ) 

					IF ( @Product NOT IN (	SELECT	productcode 
											FROM	productmatrix 
											WHERE	coveragecode = @Cov_Coverage_Code and 
													sublinecode = @Cov_Subline	) ) BEGIN
						SELECT @COV_Error_Flag = 1;
						SELECT @COV_ERR_CODE = 81;

						GOTO COV_ERROR_HANDLER;
					END

				END

				SELECT @Cov_UPDATE_Code = ''A'';
    
				IF ( @Cov_Coverage_Code in (''CCE'',''CRCFIA'',''CRCLPR'',''CRCRB'', ''CRD'',''CRDA'', ''CRDCSC'',''CRDEIE'',''CRDELJ'',''CRDFPD'',''CRDMLL'',''CRDNFP'',
											''CRDNPS'',''CRDPE'',''CRDPEA'',''CRDPEC'',''CRDPEF'',''CRDPEJ'',''CRDPEL'',''CRDPET'',''CRDPIE'',''CRDTC'',''CRDURC'',''CRDWRC'',
											''CREDDC'',''CREXT'',''CRF'',''CRFCDC'',''CRFPAS'',''CRFTF'',''CRFWRF'',''CRGPSD'',''CRI'',''CRIA'',''CRIAGT'',''CRIFHS'',''CRIGP'', ''CRIMET'', 
											''CRIOS'' ,''CRIR'',''CRIRMS'',''CRIROP'',''CRIRSA'',''CRIRSB'',''CRISS'' ,''CRITOP'',''CRMOCP'',''CRO'',''CROA'',''CROLCR'',''CROTH'') )
					IF ( ISNUMERIC(replace(@Cov_FORm, ''.'', ''*'')) = 0 ) BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 67
						GOTO COV_ERROR_HANDLER
					END 

					IF ( @Cov_Manual_Rate > 9.9 ) BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 68
						GOTO COV_ERROR_HANDLER
					END 
    
					IF ( @Cov_Actual_Rate > 9.9 ) BEGIN 
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 68
						GOTO COV_ERROR_HANDLER
					END
										 
					IF ( @Cov_Deductible IS NULL ) SELECT @Cov_Deductible = 0;
					
					IF ( @Cov_Territory IS NULL or @Cov_Territory = '''' ) 
						SELECT @Cov_Territory = ''   ''; 
    
					IF ( @Cov_Limit IS NULL ) SELECT @Cov_Limit = 0;

					IF ( ( @Cov_Town_Code = 0 OR @Cov_Town_Code IS NULL ) and @Cov_State in                      
						(''AL'',''AR'',''DE'',''FL'',''GA'',''IL'',''KY'',''MA'',''MN'',''NC'',''ND'',''NJ'',''NY'',''SC'',''TX'') )          
						SELECT @Cov_Town_Code = 99000;

					IF ( @Cov_Location_Number IS NULL ) 
						SELECT @Cov_Location_Number = 0;

					IF ( @Cov_Rating_ID_Code IS NULL ) 
						SELECT @Cov_Rating_ID_Code = '' '';

					IF ( @Cov_Med_Pay_Ind IS NULL OR @Cov_Med_Pay_Ind = 0 )
						SELECT @Cov_Med_Pay_Ind = 1;

				    IF ( @Cov_Coverage_Code = ''NDO'' )
						SELECT @Cov_Med_Pay_Ind = @Cov_Risk_ID_Code;

				    IF ( @Cov_Original_Cost_New IS NULL )
						SELECT @Cov_Original_Cost_New = 0;

				    IF ( @Cov_ISO_PIP_Limit_ID IS NULL )
						SELECT @Cov_ISO_PIP_Limit_ID = 0;

				    IF ( @Cov_Deductible_Indv IS NULL OR @Cov_Deductible_Indv = 0 )
						SELECT @Cov_Deductible_Indv = CONVERT(INT, @Cov_Deductible);
					ELSE IF ( @Cov_Deductible > @Cov_Deductible_Indv )
						SELECT @Cov_Deductible_Indv = @Cov_Deductible
    
					IF  ( @Cov_Coverage_Code in (''BPIA'',''BPGLBI'',''ACBOP'',''BPAPP'',''BPIV'',''ACBOP'',''FBOP'',''BPBM'',''BPBR'',''BPIF'',''BPCLB'',
						''BPIBT'',''CBOP'',''BPIET'',''BPINT'',''BPISB'',''BPIC'',''SBOP'',''BPCRD'',''EQB'',''EQC'',''BPGS'',''BPFLL'',''BPCRF'',''BPBI'',''BPTLL'',
						''LABOP'',''BPCRO'',''BPCRI'',''BPIE'',''BPMINE'',''BPORL1'',''BPORL2'',''BPORL3'',''BPOREQ'',''BPIS'',''BPSPLG'',''BPSWP'',''BPTRE'',
						''BPUSB'',''BPUSC'',''BPUSI'') )
						SET  @Cov_Limit_Occurance= @Cov_Limit;	
				
					ELSE IF ( @Cov_Limit_Indv IS NULL OR @Cov_Limit_Indv = 0 )
						SELECT @Cov_Limit_Indv = @Cov_Limit;

				    ELSE IF ( @Cov_Limit > ISNULL(@Cov_Limit_Indv, 0) )
						SELECT @Cov_Limit_Indv = @Cov_Limit;

				    IF ( @Cov_ISO_Deductible_Code IS NULL )
						SELECT @Cov_ISO_Deductible_Code = space(2);   --7700
		
					IF ( @Cov_SIC_Code IS NULL )
						SELECT @Cov_SIC_Code = '' '';

				    IF ( @Cov_Misc_Code IS NULL )
						SELECT @Cov_Misc_Code = '' '';

				    IF ( @Cov_Coverage_Code IS NULL OR ltrim(rtrim(@Cov_Coverage_Code)) = '''' ) BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 40
						GOTO COV_ERROR_HANDLER
					END 

					IF ( (@Cov_Limit_Indv IS NULL) OR (@Cov_Limit_Indv = 0) ) 
						SELECT @Cov_Limit_Indv = 0
					ELSE IF ( isnull(@Cov_Limit_Indv, 0) > 999999999999.4 ) BEGIN  
						SELECT @COV_Error_Flag = 1 
						SELECT @COV_ERR_CODE = 68
						GOTO COV_ERROR_HANDLER
					END
    
					IF ( (@Cov_Limit_Occurance IS NULL) OR (@Cov_Limit_Occurance = 0) ) 
						SELECT @Cov_Limit_Occurance = 0
					ELSE IF (@Cov_Limit_Occurance > 999999999999.4 ) BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 68
						GOTO COV_ERROR_HANDLER
					END 
					
					IF ( @Cov_Exposure > 999999999999.93 ) BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 97
						GOTO COV_ERROR_HANDLER
					END 

					IF ((@Cov_Limit_Aggregate IS NULL) OR (@Cov_Limit_Aggregate = 0))
						SELECT @Cov_Limit_Aggregate = 0
					ELSE IF ( @Cov_Limit_Aggregate > 999999999999.4 ) BEGIN		--9.9  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 68
						GOTO COV_ERROR_HANDLER
					END

					IF ( (@Cov_Limit IS NULL) OR (@Cov_Limit = 0) ) 
						SELECT @Cov_Limit = 0
					ELSE IF ( @Cov_Limit > 999999999999.4 ) BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 68
						GOTO COV_ERROR_HANDLER
					END
				    ELSE IF ( @Cov_Limit_INDV IS NULL OR @Cov_Limit_INDV = 0 )
						SELECT @Cov_Limit_INDV = @Cov_Limit

					IF ( (@Cov_Package_ModIFier IS NULL) OR (@Cov_Package_ModIFier = 0) )
						SELECT @Cov_Package_ModIFier = 1
					
					IF ( (@Cov_Experience_ModIFier IS NULL) OR (@Cov_Experience_ModIFier = 0) )
						SELECT @Cov_Experience_ModIFier = 1
    
					IF ( (@Cov_Schedule_ModIFier IS NULL) OR (@Cov_Schedule_ModIFier = 0) )
						SELECT @Cov_Schedule_ModIFier = 1

				    IF ( (@Cov_Individual_ModIFier IS NULL) OR (@Cov_Individual_ModIFier = 0) )
						SELECT @Cov_Individual_ModIFier = 1
    
					IF ( (@Cov_Expense_ModIFier IS NULL) OR (@Cov_Expense_ModIFier = 0) )
						SELECT @Cov_Expense_ModIFier = 1
    
					IF ( (@Cov_Expense_ModIFier > 9.999) or (@Cov_Package_ModIFier > 9.999) or (@Cov_Experience_ModIFier > 9.999 )
						or (@Cov_Schedule_ModIFier > 9.999) or (@Cov_Individual_ModIFier > 9.999) )
					BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 87
						GOTO COV_ERROR_HANDLER
					END

					IF ( ( CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Package_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Experience_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Schedule_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Individual_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Expense_ModIFier, 1), 3)) ) <> 0 )
						
						SELECT @Cov_Manual_Premium = @Cov_Actual_Premium / (CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Package_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Experience_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Schedule_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Individual_ModIFier, 1), 3)) *
						CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Expense_ModIFier, 1), 3)))
					ELSE 
						SELECT @Cov_Manual_Premium = @Cov_Actual_Premium
    
					IF ( @Cov_Manual_Premium > 999999999999.94 ) BEGIN  
						SELECT @COV_Error_Flag = 1
						SELECT @COV_ERR_CODE = 68
						GOTO COV_ERROR_HANDLER
					END 

					SELECT	@CoverageGroupcode = coveragegroupcode 
					FROM	coveragegroupcoverage 
					WHERE	coveragecode = @Cov_Coverage_Code;

				    IF ( @Cov_Effective_Date > @Cov_Expiration_Date ) BEGIN  
						SELECT @COV_ERR_CODE = 124
						SELECT @COV_ERROR_FLAG = 1
						GOTO COV_ERROR_HANDLER
					END

					SET @termpremium = 0
					
					IF (@fullyearnedind=''Y'')	  
						SET @termpremium = @Cov_Actual_Premium;
					ELSE BEGIN	
						EXEC PA_GetRoundingDates @policy_number, @policydate OUTPUT, @roundingdate OUTPUT
						SET @termpremium = dbo.PA_ProratePremium (@Cov_Actual_Premium, @Cov_Effective_Date, @Cov_Expiration_Date, @policydate, @roundingdate)
					END
    
					SELECT @policylocationid=null

					SELECT TOP 1	@policylocationid = policylocationid, 
									@Cov_Town_Code = towncode
					FROM			policylocation 
					WHERE			policynumber = @Cov_Policy_Number and
									effectivedate <> expirationdate and		-- FPT 15933
									locationnumber = convert(VARCHAR(4),@Cov_NLOCNUM) and 
									buildingnumber = convert(VARCHAR(3),@Cov_NBLDNUM); --wo# 4662

					SELECT	@Cov_LOB =  CASE @Cov_LLOB 
											WHEN ''LIX'' THEN CASE @cov_coverage_code 
																WHEN ''PLGL'' THEN ''PL''  
																WHEN ''EBL''  THEN ''EB'' 
																WHEN ''STP''  THEN ''SG''  
																ELSE ''GL''   
															END
											WHEN ''AUN'' THEN ''AT''
											ELSE @Cov_LLOB
									   END;  

					IF ( ltrim(@Cov_LOB) = '''' ) BEGIN			--''LOB''       
						SELECT @COV_ERR_CODE = 168
						SELECT @COV_ERROR_FLAG = 1
						GOTO COV_ERROR_HANDLER
					END 
    
					IF ( @Cov_ISO_Coverage_Code in (''1'',''2'',''4'',''5'') )
						SET @claimsmadeind = ''Y''
					ELSE
						SET @claimsmadeind = ''N''
     
					IF ( isnull(@erpind,''N'') <> ''Y'' and ((@Cov_Effective_Date < @Effective_Date) 
						or (@Cov_Effective_Date > @Expiration_Date) or(@Cov_Expiration_Date > @Expiration_Date) 
						or (@Cov_Expiration_Date<@Effective_Date) ) ) BEGIN  
						
						SELECT @COV_ERR_CODE = 117
						SELECT @COV_ERROR_FLAG = 1
   						GOTO COV_ERROR_HANDLER
					 END

					 IF ( @Cov_Rate_Group > 9 ) BEGIN  
						SELECT @COV_ERR_CODE = 200
						SELECT @COV_ERROR_FLAG = 1
						GOTO COV_ERROR_HANDLER
					 END 
 
					DECLARE @mgacode VARCHAR(1), @umbattpoINT VARCHAR(2);

					IF ( @Cov_Subline in (618,638) )
						SET @mgacode = substring(@Cov_Misc_Code,3,1)
					ELSE
						SET @mgacode = substring(@Cov_Misc_Code,1,1)
 
					SET @umbattpoINT = substring(@Cov_Misc_Code,2,2)
					SET @plc1 = 0
	
					IF ( @Cov_Coverage_Code =''GLBIL'' ) BEGIN
						
						SELECT	@plc1 = policycoverageid 
						FROM	policycoverage 
						WHERE	policynumber = @policy_number and 
								coveragecode = ''GLBIL'' and 
								expirationdate > convert(DATETIME,convert(VARCHAR(10),getdate(),121)) and
								effectivedate <> expirationdate;		-- FPT 15933
		
						IF ( @plc1 > 0 )
							UPDATE	policycoverage 
							SET		newexpirationdate = @ENDrDate,
									UPDATEdate = getdate(),
									UPDATEpid = 1,
									UPDATEdelegatepid = 1, 
									ENDorsementseq = @ENDorsementseq, 
									ENDorsementstatus = ''05''
							WHERE	policycoverageid = @plc1;
     
					END

					SET @plc2 = 0;

					IF ( @Cov_Coverage_Code=''BOPL'' ) BEGIN
						
						SELECT	@plc2 = policycoverageid 
						FROM	policycoverage 
						WHERE	policynumber = @policy_number and 
								coveragecode = ''BOPL'' and  
								expirationdate > convert(DATETIME,convert(VARCHAR(10),getdate(),121)) and
								effectivedate <> expirationdate;			-- FPT 15933

						IF ( @plc2 > 0 )
							UPDATE	policycoverage 
							SET		newexpirationdate = @ENDrDate,
									UPDATEdate = getdate(),
									UPDATEpid = 1,
									UPDATEdelegatepid = 1, 
									ENDorsementseq = @ENDorsementseq, 
									ENDorsementstatus = ''05'' 
							WHERE	policycoverageid = @plc2;
 
					END
	
					IF ( @Cov_Coverage_Code in (''PLBI'',''PLUMBI'',''PLUNBI'',''PLUMPD'',''PLUNPD'') and @comment!=''GRUNDY REPRINT'' ) BEGIN 
		
						IF @Cov_Coverage_Code=''PLBI''
							SELECT	@Cov_Coverage_XRef = policycoverageid 
							FROM	policycoverage 
							WHERE	policynumber = @Cov_Policy_Number and 
									coveragecode = ''PLBI'' and 
									expirationdate > @Cov_Effective_Date and
									effectivedate <> expirationdate;			-- FPT 15933

						IF @Cov_Coverage_Code=''PLUMBI''
							SELECT  @Cov_Coverage_XRef = policycoverageid 
							FROM	policycoverage 
							WHERE	policynumber = @Cov_Policy_Number and 
									coveragecode = ''PLUMBI'' and 
									expirationdate > @Cov_Effective_Date and
									effectivedate <> expirationdate;			-- FPT 15933

						IF @Cov_Coverage_Code=''PLUNBI''
							SELECT  @Cov_Coverage_XRef = policycoverageid 
							FROM    policycoverage 
							WHERE	policynumber=@Cov_Policy_Number and 
									coveragecode = ''PLUNBI'' and 
									expirationdate > @Cov_Effective_Date and
									effectivedate <> expirationdate;			-- FPT 15933

						IF @Cov_Coverage_Code=''PLUMPD''
							SELECT  @Cov_Coverage_XRef = policycoverageid 
							FROM	policycoverage 
							WHERE	policynumber = @Cov_Policy_Number and 
									coveragecode = ''PLUMPD'' and 
									expirationdate > @Cov_Effective_Date and
									effectivedate <> expirationdate;			-- FPT 15933

						IF @Cov_Coverage_Code=''PLUNPD''
							SELECT  @Cov_Coverage_XRef = policycoverageid 
							FROM	policycoverage 
							WHERE	policynumber = @Cov_Policy_Number and 
									coveragecode = ''PLUNPD'' and 
									expirationdate > @Cov_Effective_Date and
									effectivedate <> expirationdate;			-- FPT 15933

						EXEC INT_PA_CoverageDelSave @policy_number ,@Cov_Coverage_XRef ,@Cov_Effective_Date,1 ,1 ,@Error_Number OUTPUT,@errormsg OUTPUT      
					    
						IF ( @Error_Number <> 0 ) BEGIN
							SELECT @COV_ERR_CODE = 14     
							SELECT @COV_ERROR_FLAG = 1
							GOTO COV_ERROR_HANDLER
						END 
					END
--FPT 11191
					If ( @Bor_Name = ''CPH'' and @Cov_Subline = 920 ) BEGIN		--Inlandmerine
						SET @Cov_Territory = ''999''
						SET @cov_rate_departure_lcm = ''100''
					END
--FPT 11191
-- FPT 15933
					INSERT INTO		policycoverage(
									policynumber,
									coveragecode,
									lobcode,
									coveragegroupcode,
									policylevelind,
									towncode,
									statecode,
									territory,
									effectivedate,
									expirationdate,
									aggrlimit,
									indvlimit,
									occrlimit,
									premopsoccrlimit,
									premopsaggrlimit,
									prodoccrlimit, 
									prodaggrlimit,
									medpaylimit,
									indvdeductible,
									occrdeductible,
									aggrdeductible,
									isocoveragecode,
									classcode,
									sublinecode, 
									stateexception,
									ratingbasiscode,
									manualpremium, 
									manualrate,
									actualpremium,
									actualrate,
									termpremium,
									fullyearnedind,
									packagemodIFier,
									experiencemodIFier,
									scheduleratemodfier,
									individualriskmodIFier,
									expensemodIFier,
									allriskind,
									coinsurancepct,
									exposureunits,
									exposure1, 
									blanketind,
									blanketnumber,
									whexclusionind,
									piplimitcode,
									pipdeductcode,
									pipratingcode, 
									priordate, 
									claimsmadeind,
									fullpriorind,
									retrodate,
									policylocationid,
									newexpirationdate,
									ENDorsementseq,
									ENDorsementstatus, 
									CREATEdate, 
									CREATEpid, 
									CREATEdelegatepid,
									terrorismcode,
									miscmodIFier1,
									miscmodIFier2,
									LiabilityCode,
									rategroupind,
									classlimitind,
									sharedlimitind,
									isodeductiblecode, 
									ratingmod,
									ratedeparture,
									losscostdate,
									FORm,
									zonerating,
									antitheftdevice,
									wshdeductible,
									AQSKEY,
									BCEGCODE,
									BOPLiabilitylimit,
									siccode,
									mgacode,
									umbattpoINT, 
									erpind 
									)
					OUTPUT			INSERTED.policycoverageid
					INTO			@Identity( NewValue )  
					VALUES			(CONVERT(VARCHAR(15), @Cov_Policy_Number),
									CONVERT(VARCHAR(6), @Cov_Coverage_Code),
									@Cov_LOB,
									@CoverageGroupcode,
									@policylevelind,
									CONVERT(INT, ISNULL(@Cov_Town_Code, 0)),
									CONVERT(VARCHAR(2), @Cov_State),
									CONVERT(VARCHAR(3), ISNULL(@Cov_Territory, ''   '')), 
									CONVERT(DATETIME, @Cov_Effective_Date),
									CONVERT(DATETIME, @Cov_Expiration_Date),
									CONVERT(DECIMAL(15,2), ROUND(ISNULL(@Cov_Limit_Aggregate, 0),2)),
									CONVERT(DECIMAL(15,2), round(ISNULL(@Cov_Limit_Indv,0),2)),
									CONVERT(DECIMAL(15,2), round(@Cov_Limit_Occurance, 2)),
									ISNULL(@premopsoccrlimit,0),
									ISNULL(@premopsaggrlimit,0),
									ISNULL(@prodoccrlimit,0),
									ISNULL(@prodaggrlimit,0),
									ISNULL(@medpaylimit,0),
									CONVERT(INT, @Cov_Deductible_Indv),
									CONVERT(INT, @Cov_Deductible_Occurance),
									CONVERT(INT, @Cov_Deductible_Aggregate),
									CONVERT(VARCHAR(3), isnull(@Cov_ISO_Coverage_Code, ''0'')), 
									CONVERT(VARCHAR(6), @Cov_Class_Code),
									CONVERT(INT, @Cov_Subline),
									CONVERT(VARCHAR(1), @Cov_State_Exception),
									CONVERT(VARCHAR(2), @Cov_PIC_Rating_Basis),
									CONVERT(DECIMAL(12,2), @Cov_Manual_Premium),
									CONVERT(DECIMAL(5,4), @Cov_Manual_Rate),
									CONVERT(DECIMAL(12,2), @Cov_Actual_Premium),
									CONVERT(DECIMAL(5,4), @Cov_Actual_Rate),
									@termpremium,
									@fullyearnedind,
									CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Package_ModIFier, 1), 3)),
									CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Experience_ModIFier, 1), 3)),
									CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Schedule_ModIFier, 1), 3)),
									CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Individual_ModIFier, 1), 3)),
									CONVERT(DECIMAL(7, 4), round(ISNULL(@Cov_Expense_ModIFier, 1), 3)),
									CONVERT(VARCHAR(1), @Cov_ALL_Risk_Ind),  
									@Cov_CoinsurancePct,
									CONVERT(DECIMAL (15,2), @Cov_Exposure),
									@Cov_Exposure1,
									ISNULL(@blanketind,''N''),
									@blanketnumber,
									CASE @whexclusionind 
										WHEN 0 THEN ''N'' 
										WHEN 1 THEN ''Y'' 
									END,
									CONVERT(INT, @Cov_PIP_Limit_Code),
									CONVERT(INT, @Cov_PIP_Deductible_Code),
									CASE 
										WHEN @Cov_Coverage_Code in (''PIP'',''EMBC'') THEN CONVERT(INT,@Cov_ISO_PIP_Limit_ID)ELSE 0 
									END,
									@cov_prior_date, 
									@claimsmadeind,
									@Full_Prior_Ind,
									@cov_retro_date,
									@policylocationid,
									@newexpirationdate,
									@ENDorsementseq,
									''03'',
									getdate(),
									1,
									1,
									ISNULL(@Cov_TERR_CODE, 0), 
									ISNULL(@miscmodIFier1,1),
									ISNULL(@miscmodIFier2,0),
									@Cov_ISO_Limit_ID,
									@cov_rate_group,
									@Cov_Class_Limit_Indv,
									@sharedlimitind,
									@Cov_ISO_Deductible_Code,
									@cov_rating_mod,
									@cov_rate_departure_lcm,
									@cov_loss_cost_date,
									@Cov_FORm,
									@Cov_Zone_Rating_Code,
									@cov_anti_theft_device,
									@lded,
									@AQSKEY,
									@Cov_BCEG_CODE,
									@BOPLiabilitylimit,
									@siccode,
									@mgacode,
									@umbattpoINT, 
									isnull(@erpind,''N'') 
									)  

					IF @@ROWCOUNT = 0 OR @@ERROR <> 0 BEGIN 
						SELECT @COV_ERR_CODE = 5
						SELECT @COV_ERROR_FLAG = 1
						GOTO COV_ERROR_HANDLER
					END
					ELSE BEGIN
						SELECT		@Cov_Coverage_XRef = NewValue 
						FROM		@Identity;

						DELETE FROM	@Identity;

						UPDATE		INT_coverage		
						SET			xref=@Cov_Coverage_XRef 
						WHERE		[id]= @Cov_CoverageId;
					END
-- FPT 15933
				END --AddCoverage loop STOP

				IF ( @Cov_Trans_Code = ''09'' ) Begin
-- FPT 15933
					If @bor_name=''Grundy'' Begin
						Set @Cov_Coverage_XRef = null

						SELECT  @Cov_Coverage_XRef = vc.policycoverageid 
						FROM	Vehiclecoverage vc INNER JOIN accountvehicle ac ON vc.accountvehicleid=ac.accountvehicleid
						WHERE	vc.policynumber= @Cov_Policy_Number AND 
								ac.vin = @cov_vin AND
								vc.coveragecode = @Cov_Coverage_Code AND 
								vc.expirationdate > @Cov_Effective_Date AND
								vc.effectivedate <> vc.expirationdate
					End
-- FPT 15933

					IF ( @Cov_Coverage_XRef is not null ) Begin
						EXEC int_PA_CoverageDelSave @policy_number ,@Cov_Coverage_XRef ,@Cov_Effective_Date,1 ,1 ,@Error_Number output,@errormsg output      
						
						IF ( @Error_Number <> 0 ) BEGIN
							SELECT @COV_ERR_CODE = 14     
							SELECT @COV_ERROR_FLAG = 1
							GOTO COV_ERROR_HANDLER
						END

					End 

				END

				IF ( @COV_ERROR_FLAG = 1 )
					GOTO COV_Error_Handler
				ELSE IF ( @cov_vin is not null ) BEGIN
					SET @accountvehicleid = null    
					SET @policyvehicleid = null     

					IF ( @Cov_Trans_Code = ''07'' )
						SELECT top 1	@accountvehicleid = pv.accountvehicleid,
										@policyvehicleid = pv.policyvehicleid
						FROM			policyvehicle pv, accountvehicle av
						WHERE			av.accountvehicleid = pv.accountvehicleid and 
										av.accountnumber = @account_number and
										pv.policynumber = @Cov_Policy_Number and 
										pv.effectivedate <> pv.expirationdate   and
										av.vin = @cov_vin
						 ORDER BY		pv.accountvehicleid DESC,
										pv.policyvehicleid DESC;
					ELSE
						SELECT top 1	@accountvehicleid = pv.accountvehicleid,
										@policyvehicleid = pv.policyvehicleid
						FROM			policyvehicle pv, accountvehicle av
						WHERE			av.accountvehicleid = pv.accountvehicleid and 
										av.accountnumber = @account_number and
										pv.policynumber = @Cov_Policy_Number and 
										pv.effectivedate <> pv.expirationdate and
										av.vin = @cov_vin
						ORDER BY		pv.accountvehicleid ASC,
										pv.policyvehicleid ASC;

    -------------ReprINT ENDorsement Grundy 
					IF ( @comment=''GRUNDY REPRINT'' )
						SELECT TOP 1	@accountvehicleid = pv.accountvehicleid,
										@policyvehicleid=pv.policyvehicleid
						FROM			policyvehicle pv,
										accountvehicle av
						WHERE			av.accountvehicleid = pv.accountvehicleid and 
										av.accountnumber = @account_number and
										pv.policynumber	= @Cov_Policy_Number and 
										av.vin = @cov_vin and 
										pv.effectivedate <> pv.expirationdate			-- FPT 15933
						ORDER BY		pv.accountvehicleid DESC,
										pv.policyvehicleid DESC;
    
					IF ( (@accountvehicleid is not null) and (@policyvehicleid is not null) ) BEGIN
						
						IF ( @Cov_Trans_Code=''07'' )
							INSERT INTO		vehiclecoverage
											(
											policynumber,
											accountvehicleid,
											policyvehicleid,
											policycoverageid,
											coveragecode,
											ratingbasiscode,
											effectivedate,
											expirationdate,
											premium,
											rate,
											CREATEdate,
											CREATEpid,
											CREATEdelegatepid,
											ENDorsementseq, 
											ENDorsementstatus 
											) 
							VALUES			(
											CONVERT(VARCHAR(15), @Cov_Policy_Number),
											@accountvehicleid,
											@policyvehicleid,
											@Cov_Coverage_XRef,
											CONVERT(VARCHAR(6), @Cov_Coverage_Code),
											CONVERT(VARCHAR(2), @Cov_PIC_Rating_Basis),
											@Cov_Effective_Date,
											@Cov_Expiration_Date,
											@Cov_Actual_Premium,
											CONVERT(DECIMAL(5,4), @Cov_Actual_Rate),
											getdate(),
											1,
											1,
											@ENDorsementseq,
											''03''
											);
     
						IF @Cov_Trans_Code=''09'' 
							UPDATE	vehiclecoverage 
							SET		newexpirationdate=@Cov_Expiration_Date,
									ENDorsementseq=@ENDorsementseq,	
									ENDorsementstatus=''05'',
									UPDATEpid=1,
									UPDATEdate=getdate(),
									UPDATEdelegatepid=1
							WHERE	accountvehicleid=@accountvehicleid and 
									policyvehicleid=@policyvehicleid and 
									policycoverageid=@Cov_Coverage_XRef and 
									coveragecode=@Cov_Coverage_Code and 
									premium=abs(@Cov_Actual_Premium) and
									effectivedate <> expirationdate
						END
					END  

--BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
-- FPT 15933
					IF ( @Cov_Trans_Code=''08'' ) BEGIN
						SELECT	@Cov_Coverage_XRef = pc.policycoverageid 
						FROM	policycoverage pc, 
								vehiclecoverage vc,
								accountvehicle ac 
						WHERE	pc.policycoverageid = vc.policycoverageid and 
								vc.accountvehicleid = ac.accountvehicleid and 
								ac.vin = @cov_vin and 
								vc.policynumber = @policy_number and 
								vc.coveragecode = @Cov_Coverage_Code and
								vc.effectivedate <> vc.expirationdate
-- FPT 15933 

						IF ( @Cov_Coverage_XRef is not null ) BEGIN 
							EXEC INT_PA_CoverageDelSave @policy_number ,@Cov_Coverage_XRef ,@Cov_Effective_Date,1 ,1 ,@Error_Number OUTPUT,@errormsg OUTPUT      
							
							IF ( @Error_Number <> 0 ) BEGIN
								SELECT @COV_ERR_CODE = 14     
								SELECT @COV_ERROR_FLAG = 1
								GOTO COV_ERROR_HANDLER
							END
						END

						SELECT	@Cov_UPDATE_Code = ''A'';

						IF ( @Cov_Coverage_Code in (''CCE'',''CRCFIA'',''CRCLPR'',''CRCRB'', ''CRD'',''CRDA'', ''CRDCSC'',''CRDEIE'',''CRDELJ'',''CRDFPD'',''CRDMLL'',''CRDNFP'',
								''CRDNPS'',''CRDPE'',''CRDPEA'',''CRDPEC'',''CRDPEF'',''CRDPEJ'',''CRDPEL'',''CRDPET'',''CRDPIE'',''CRDTC'',''CRDURC'',''CRDWRC'',
								''CREDDC'',''CREXT'',''CRF'',''CRFCDC'',''CRFPAS'',''CRFTF'',''CRFWRF'',''CRGPSD'',''CRI'',''CRIA'',''CRIAGT'',''CRIFHS'',''CRIGP'', ''CRIMET'', 
								''CRIOS'' ,''CRIR'',''CRIRMS'',''CRIROP'',''CRIRSA'',''CRIRSB'',''CRISS'' ,''CRITOP'',''CRMOCP'',''CRO'',''CROA'',''CROLCR'',''CROTH'') )

							IF ( ISNUMERIC(replace(@Cov_FORm,''.'',''*'')) = 0  ) BEGIN  
								SELECT @COV_Error_Flag = 1
								SELECT @COV_ERR_CODE = 67
								GOTO COV_ERROR_HANDLER
							END 
    
			IF ( @Cov_Manual_Rate > 9.9 ) BEGIN  
				SELECT @COV_Error_Flag = 1
				SELECT @COV_ERR_CODE = 68
				GOTO COV_ERROR_HANDLER
			END 
	    
			IF ( @Cov_Actual_Rate > 9.9 ) BEGIN 
				SELECT @COV_Error_Flag = 1
				SELECT @COV_ERR_CODE = 68
				GOTO COV_ERROR_HANDLER
			END 											 
	    
			IF ( @Cov_Deductible IS NULL )
				SELECT @Cov_Deductible = 0
	    
			IF ( @Cov_Territory IS NULL or @Cov_Territory = '''' )
				SELECT @Cov_Territory = ''   '' 
	    
			IF ( @Cov_Limit IS NULL )
				SELECT @Cov_Limit = 0
	    
			IF ( (@Cov_Town_Code = 0 OR @Cov_Town_Code IS NULL) and @Cov_State in                      
					(''AL'',''AR'',''DE'',''FL'',''GA'',''IL'',''KY'',''MA'',''MN'',''NC'',''ND'',''NJ'',''NY'',''SC'',''TX'') )
				SELECT @Cov_Town_Code = 99000
	    
			IF ( @Cov_Location_Number IS NULL )
				SELECT @Cov_Location_Number = 0
	    
			IF ( @Cov_Rating_ID_Code IS NULL )
				SELECT @Cov_Rating_ID_Code = '' ''
	    
			IF ( @Cov_Med_Pay_Ind IS NULL OR @Cov_Med_Pay_Ind = 0 )
				SELECT @Cov_Med_Pay_Ind = 1
	     
			IF ( @Cov_Coverage_Code = ''NDO'' )
				SELECT @Cov_Med_Pay_Ind = @Cov_Risk_ID_Code
	    
			IF ( @Cov_Original_Cost_New IS NULL  )
				SELECT @Cov_Original_Cost_New = 0
	    
			IF ( @Cov_ISO_PIP_Limit_ID IS NULL )
				SELECT @Cov_ISO_PIP_Limit_ID = 0
	    
			IF ( @Cov_Deductible_Indv IS NULL OR @Cov_Deductible_Indv = 0 )
				SELECT @Cov_Deductible_Indv = CONVERT(INT, @Cov_Deductible)
			ELSE IF ( @Cov_Deductible > @Cov_Deductible_Indv )
				SELECT @Cov_Deductible_Indv = @Cov_Deductible
	    
			IF  ( @Cov_Coverage_Code in (''BPIA'',''BPGLBI'',''ACBOP'',''BPAPP'',''BPIV'',''ACBOP'',''FBOP'',''BPBM'',''BPBR'',''BPIF'',''BPCLB'',
				   ''BPIBT'',''CBOP'',''BPIET'',''BPINT'',''BPISB'',''BPIC'',''SBOP'',''BPCRD'',''EQB'',''EQC'',''BPGS'',''BPFLL'',''BPCRF'',''BPBI'',''BPTLL'',
				   ''LABOP'',''BPCRO'',''BPCRI'',''BPIE'',''BPMINE'',''BPORL1'',''BPORL2'',''BPORL3'',''BPOREQ'',''BPIS'',''BPSPLG'',''BPSWP'',''BPTRE'',
				   ''BPUSB'',''BPUSC'',''BPUSI'') ) 
				SET  @Cov_Limit_Occurance= @Cov_Limit	
			ELSE IF ( @Cov_Limit_Indv IS NULL OR @Cov_Limit_Indv = 0 )
				SELECT @Cov_Limit_Indv = @Cov_Limit
			ELSE IF ( @Cov_Limit > ISNULL(@Cov_Limit_Indv, 0) )
				SELECT @Cov_Limit_Indv = @Cov_Limit

			IF ( @Cov_ISO_Deductible_Code IS NULL )
				SELECT @Cov_ISO_Deductible_Code = space(2)  --7700

			IF ( @Cov_SIC_Code IS NULL )
				SELECT @Cov_SIC_Code = '' '' 

			IF ( @Cov_Misc_Code IS NULL )
				SELECT @Cov_Misc_Code = '' ''

			IF ( @Cov_Coverage_Code IS NULL OR ltrim(rtrim(@Cov_Coverage_Code)) = '''' ) BEGIN  
				SELECT @COV_Error_Flag = 1
				SELECT @COV_ERR_CODE = 40
				GOTO COV_ERROR_HANDLER
			END

			IF ( (@Cov_Limit_Indv IS NULL) OR (@Cov_Limit_Indv = 0) ) 
				SELECT @Cov_Limit_Indv = 0
			ELSE IF ( isnull(@Cov_Limit_Indv, 0) > 999999999999.4 ) BEGIN  
				SELECT @COV_Error_Flag = 1 
				SELECT @COV_ERR_CODE = 68
				GOTO COV_ERROR_HANDLER
			END

			IF ( (@Cov_Limit_Occurance IS NULL) OR (@Cov_Limit_Occurance = 0) ) 
				SELECT @Cov_Limit_Occurance = 0
			ELSE IF ( @Cov_Limit_Occurance > 999999999999.4 ) BEGIN  
				SELECT @COV_Error_Flag = 1
				SELECT @COV_ERR_CODE = 68
				GOTO COV_ERROR_HANDLER
			END 
	    
			IF ( @Cov_Exposure > 999999999999.93 ) BEGIN  
				SELECT @COV_Error_Flag = 1
				SELECT @COV_ERR_CODE = 97
				GOTO COV_ERROR_HANDLER
			END 
	    
			IF ( (@Cov_Limit_Aggregate IS NULL) OR (@Cov_Limit_Aggregate = 0) )
				SELECT @Cov_Limit_Aggregate = 0
			ELSE IF ( @Cov_Limit_Aggregate > 999999999999.4 ) BEGIN  
				SELECT @COV_Error_Flag = 1
				SELECT @COV_ERR_CODE = 68
				GOTO COV_ERROR_HANDLER
			END 
	    
			IF ( (@Cov_Limit IS NULL) OR (@Cov_Limit = 0) ) 
				SELECT @Cov_Limit = 0
			ELSE IF ( @Cov_Limit > 999999999999.4 ) BEGIN  
				SELECT @COV_Error_Flag = 1
				SELECT @COV_ERR_CODE = 68
				GOTO COV_ERROR_HANDLER
			END 
		ELSE IF ( @Cov_Limit_INDV IS NULL OR @Cov_Limit_INDV = 0 )
			SELECT @Cov_Limit_INDV = @Cov_Limit

		IF ( (@Cov_Package_ModIFier IS NULL) OR (@Cov_Package_ModIFier = 0) )
			SELECT @Cov_Package_ModIFier = 1
    
		IF ( (@Cov_Experience_ModIFier IS NULL) OR (@Cov_Experience_ModIFier = 0) )
			SELECT @Cov_Experience_ModIFier = 1
    
		IF ( (@Cov_Schedule_ModIFier IS NULL) OR (@Cov_Schedule_ModIFier = 0) )
			SELECT @Cov_Schedule_ModIFier = 1
    
		IF ( (@Cov_Individual_ModIFier IS NULL) OR (@Cov_Individual_ModIFier = 0) )
			SELECT @Cov_Individual_ModIFier = 1

		IF ( (@Cov_Expense_ModIFier IS NULL) OR (@Cov_Expense_ModIFier = 0 ) )
			SELECT @Cov_Expense_ModIFier = 1
    
		IF ( (@Cov_Expense_ModIFier > 9.999) or (@Cov_Package_ModIFier > 9.999) 
			or (@Cov_Experience_ModIFier > 9.999) or (@Cov_Schedule_ModIFier > 9.999) 
			or (@Cov_Individual_ModIFier > 9.999) ) BEGIN  
			
			SELECT @COV_Error_Flag = 1
			SELECT @COV_ERR_CODE = 87
			GOTO COV_ERROR_HANDLER
		END

		IF ( (CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Package_ModIFier, 1), 3)) *
			CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Experience_ModIFier, 1), 3)) *
			CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Schedule_ModIFier, 1), 3)) *
			CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Individual_ModIFier, 1), 3)) *
			CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Expense_ModIFier, 1), 3))) <> 0 )
			
			SELECT	@Cov_Manual_Premium = @Cov_Actual_Premium / (CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Package_ModIFier, 1), 3)) *
				CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Experience_ModIFier, 1), 3)) *
				CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Schedule_ModIFier, 1), 3)) *
				CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Individual_ModIFier, 1), 3)) *
				CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Expense_ModIFier, 1), 3)))
		ELSE 
			SELECT @Cov_Manual_Premium = @Cov_Actual_Premium

		IF ( @Cov_Manual_Premium > 999999999999.94 ) BEGIN  
			SELECT @COV_Error_Flag = 1
			SELECT @COV_ERR_CODE = 68
			GOTO COV_ERROR_HANDLER
		END 

	    SELECT	@CoverageGroupcode = coveragegroupcode 
		FROM	coveragegroupcoverage 
		WHERE	coveragecode= @Cov_Coverage_Code;

		IF ( @Cov_Effective_Date > @Cov_Expiration_Date  ) BEGIN  
		    SELECT @COV_ERR_CODE = 124
			SELECT @COV_ERROR_FLAG = 1
			GOTO COV_ERROR_HANDLER
		END
    
		SET @termpremium = 0
		
		IF (@fullyearnedind=''Y'')	  
			SET @termpremium=@Cov_Actual_Premium
		ELSE BEGIN	
			EXEC PA_GetRoundingDates @policy_number, @policydate OUTPUT, @roundingdate OUTPUT
			SET @termpremium = dbo.PA_ProratePremium (@Cov_Actual_Premium, @Cov_Effective_Date, @Cov_Expiration_Date, @policydate, @roundingdate)
		END
	-----------------------------FPT 8391
		SELECT @policylocationid = null;

		SELECT TOP 1	@policylocationid = policylocationid, 
						@Cov_Town_Code = towncode
		FROM			policylocation 
		WHERE			policynumber = @Cov_Policy_Number and 
						locationnumber = convert(VARCHAR(4), @Cov_NLOCNUM) and 
						buildingnumber = convert(VARCHAR(3), @Cov_NBLDNUM) and --wo# 4662
						effectivedate <> expirationdate;
	-----------------------------
		SELECT @Cov_LOB = CASE @Cov_LLOB WHEN ''ACC'' THEN ''AC'' WHEN ''ACM'' THEN ''AC'' WHEN ''AUM'' THEN ''AT'' WHEN ''AUN'' THEN ''AT''
		 WHEN ''AUO'' THEN ''AT'' WHEN ''AUP'' THEN ''AT'' WHEN ''AUQ'' THEN ''AT'' WHEN ''AUT'' THEN ''AT'' WHEN ''AUU'' THEN ''AT'' 
		 WHEN ''AUV'' THEN ''AT'' 
		 WHEN ''BBR'' THEN ''UC'' 
		 WHEN ''BCR'' THEN ''UC'' 
		 WHEN ''BEQ'' THEN ''UC'' 
		 WHEN ''BFX'' THEN CASE  @cov_class_code WHEN ''0702'' THEN ''UC'' ELSE ''BOP'' END 
		 WHEN ''BIM'' THEN ''UC''   
		 WHEN ''BOP'' THEN ''BOP'' WHEN ''BPB'' THEN ''BOP'' WHEN ''BPO'' THEN ''BOP'' WHEN ''BRC'' THEN ''BOP''
		 WHEN ''CRM'' THEN ''CR'' WHEN ''CRX'' THEN ''CR'' WHEN ''GCC'' THEN ''CR'' WHEN ''GCM'' THEN ''CR'' WHEN ''GAM'' THEN ''GR''
		 WHEN ''GAN'' THEN ''GR'' WHEN ''GAQ'' THEN ''GR'' WHEN ''GAR'' THEN ''GR'' WHEN ''GAX'' THEN ''GR'' WHEN ''INM'' THEN ''IM''
		 WHEN ''LIA'' THEN ''GL'' WHEN ''LIX'' THEN CASE @cov_coverage_code WHEN ''PLGL'' THEN ''PL''  WHEN ''EBL''  THEN ''EB'' 
											   WHEN ''STP''  THEN ''SG''  ELSE ''GL''   END
		 WHEN ''BBM'' THEN ''UC'' WHEN ''PRP'' THEN ''PR'' WHEN ''PRX'' THEN ''PR'' WHEN ''PRG'' THEN ''PR'' WHEN ''BFA'' THEN ''UC''
		 WHEN ''BFL'' THEN ''UC'' WHEN ''SLD'' THEN ''SLD'' WHEN ''SAM'' THEN ''AM'' WHEN ''UM'' THEN ''UM''   --06/15/2004 
		 WHEN ''PA''  THEN ''PA''      
		 ELSE ''LOB'' END

		IF ( @Cov_LOB =''LOB'' ) BEGIN  
			SELECT @COV_ERR_CODE = 168
			SELECT @COV_ERROR_FLAG = 1
			GOTO COV_ERROR_HANDLER
		END 
	    
		IF ( ltrim(rtrim(@Cov_ISO_Coverage_Code)) in (''1'',''2'',''4'',''5'') )
			SET @claimsmadeind = ''Y''
		ELSE
			SET @claimsmadeind = ''N''
	     
		IF ( @erpind <>''Y'' 
			and ((@Cov_Effective_Date < @Effective_Date) 
			or (@Cov_Effective_Date > @Expiration_Date)
			or (@Cov_Expiration_Date > @Expiration_Date) 
			or (@Cov_Expiration_Date < @Effective_Date) 
			) ) BEGIN  
			
			SELECT @COV_ERR_CODE = 117
			SELECT @COV_ERROR_FLAG = 1
			GOTO COV_ERROR_HANDLER
		END

		IF ( @Cov_Rate_Group > 9  ) BEGIN  
			SELECT @COV_ERR_CODE = 200
			SELECT @COV_ERROR_FLAG = 1
			GOTO COV_ERROR_HANDLER
		END 

		IF ( @Cov_Subline in (618,638) )
			SET @mgacode = substring(@Cov_Misc_Code,3,1)
		ELSE
			SET @mgacode = substring(@Cov_Misc_Code,1,1)

		SET @umbattpoINT = substring(@Cov_Misc_Code,2,2)

--FPT 11191
		If ( @Bor_Name = ''CPH'' and @Cov_Subline = 920 ) BEGIN --Inlandmerine
			SET @Cov_Territory=''999''
			SET @cov_rate_departure_lcm=''100''
		End
--FPT 11191
-- FPT 15933
		INSERT INTO	policycoverage (
					policynumber,
					coveragecode,
					lobcode,
					coveragegroupcode,
					policylevelind,
					towncode,
					statecode,
					territory,
					effectivedate,
					expirationdate,
					aggrlimit,
					indvlimit,
					occrlimit,
					premopsoccrlimit,
					premopsaggrlimit,
					prodoccrlimit, 
					prodaggrlimit,
					medpaylimit,
					indvdeductible,
					occrdeductible,
					aggrdeductible,
					isocoveragecode,
					classcode,
					sublinecode, 
					stateexception,
					ratingbasiscode,
					manualpremium, 
					manualrate,
					actualpremium,
					actualrate,
					termpremium,
					fullyearnedind,
					packagemodIFier,
					experiencemodIFier,
					scheduleratemodfier,
					individualriskmodIFier,
					expensemodIFier,
					allriskind,
					coinsurancepct,
					exposureunits,
					exposure1, 
					blanketind,
					blanketnumber,
					whexclusionind,
					piplimitcode,
					pipdeductcode,
					pipratingcode, 
					priordate, 
					claimsmadeind,
					fullpriorind,
					retrodate,
					policylocationid,
					newexpirationdate,
					ENDorsementseq,
					ENDorsementstatus, 
					CREATEdate, 
					CREATEpid, 
					CREATEdelegatepid,
					terrorismcode,
					miscmodIFier1,
					miscmodIFier2,
					LiabilityCode,
					rategroupind,
					classlimitind,
					sharedlimitind,
					isodeductiblecode, 
					ratingmod,
					ratedeparture,
					losscostdate,
					FORm,
					zonerating,
					antitheftdevice,
					wshdeductible,
					AQSKEY,
					BCEGCODE,
					BOPLiabilitylimit,
					siccode,
					mgacode,
					umbattpoINT, 
					erpind 
					)
		OUTPUT		INSERTED.policycoverageid
		INTO		@Identity( NewValue )
		VALUES		(CONVERT(VARCHAR(15), @Cov_Policy_Number),
					CONVERT(VARCHAR(6), @Cov_Coverage_Code),
					@Cov_LOB,
					@CoverageGroupcode,
					@policylevelind,
					CONVERT(INT, ISNULL(@Cov_Town_Code, 0)),
					CONVERT(VARCHAR(2), @Cov_State),
					CONVERT(INT, ISNULL(@Cov_Territory, ''   '')), 
					CONVERT(DATETIME, @Cov_Effective_Date),
					CONVERT(DATETIME, @Cov_Expiration_Date),
					CONVERT(DECIMAL(15,2), ROUND(ISNULL(@Cov_Limit_Aggregate, 0),2)),
					CONVERT(DECIMAL(15,2), round(ISNULL(@Cov_Limit_Indv,0),2)),
					CONVERT(DECIMAL(15,2), round(@Cov_Limit_Occurance, 2)),
					ISNULL(@premopsoccrlimit,0),
					ISNULL(@premopsaggrlimit,0),
					ISNULL(@prodoccrlimit,0),
					ISNULL(@prodaggrlimit,0),
					ISNULL(@medpaylimit,0),
					CONVERT(INT, @Cov_Deductible_Indv),
					CONVERT(INT, @Cov_Deductible_Occurance),
					CONVERT(INT, @Cov_Deductible_Aggregate),
					@Cov_ISO_Coverage_Code,
					CONVERT(VARCHAR(6), @Cov_Class_Code),
					CONVERT(INT, @Cov_Subline),
					CONVERT(VARCHAR(1), @Cov_State_Exception),
					CONVERT(VARCHAR(2), @Cov_PIC_Rating_Basis),
					CONVERT(DECIMAL(12,2), @Cov_Manual_Premium),
					CONVERT(DECIMAL(5,4), @Cov_Manual_Rate),
					CONVERT(DECIMAL(12,2), @Cov_Actual_Premium),
					CONVERT(DECIMAL(5,4), @Cov_Actual_Rate),
					@termpremium,
					@fullyearnedind,
					CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Package_ModIFier, 1), 3)),
					CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Experience_ModIFier, 1), 3)),
					CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Schedule_ModIFier, 1), 3)),
					CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Individual_ModIFier, 1), 3)),
					CONVERT(DECIMAL(4, 3), round(ISNULL(@Cov_Expense_ModIFier, 1), 3)),
					CONVERT(VARCHAR(1), @Cov_ALL_Risk_Ind),  
					@Cov_CoinsurancePct,
					CONVERT(DECIMAL (15,2), @Cov_Exposure),
					@Cov_Exposure1,
					ISNULL(@blanketind,''N''),
					@blanketnumber,
					CASE @whexclusionind 
						WHEN 0 THEN ''N'' 
						WHEN 1 THEN ''Y'' 
					END,
					CONVERT(INT, @Cov_PIP_Limit_Code),
					CONVERT(INT, @Cov_PIP_Deductible_Code),
					CASE 
						WHEN @Cov_Coverage_Code in (''PIP'',''EMBC'') THEN CONVERT(INT,@Cov_ISO_PIP_Limit_ID) ELSE 0 
					END,
					@cov_prior_date, 
					@claimsmadeind,
					@Full_Prior_Ind,
					@cov_retro_date,
					@policylocationid,
					@newexpirationdate,
					@ENDorsementseq,
					''03'',
					getdate(),
					1,
					1,
					ISNULL(@Cov_TERR_CODE, 0),
					ISNULL(@miscmodIFier1,1),
					ISNULL(@miscmodIFier2,0),
					@Cov_ISO_Limit_ID,
					@cov_rate_group,
					@Cov_Class_Limit_Indv,
					@sharedlimitind,
					@Cov_ISO_Deductible_Code,
					@cov_rating_mod,
					@cov_rate_departure_lcm,
					@cov_loss_cost_date,
					@Cov_FORm,
					@Cov_Zone_Rating_Code,
					@cov_anti_theft_device,
					@lded,@AQSKEY,
					@Cov_BCEG_CODE,
					@BOPLiabilitylimit,
					@siccode,
					@mgacode,
					@umbattpoINT, 
					@erpind 
					);
					    
		IF @@ROWCOUNT = 0 OR @@ERROR <> 0 BEGIN 
			 SELECT @COV_ERR_CODE = 5;
			 SELECT @COV_ERROR_FLAG = 1;
			 GOTO COV_ERROR_HANDLER;
		END
		ELSE BEGIN
			SELECT		@Cov_Coverage_XRef = NewValue 
			FROM		@identity;

			DELETE FROM @identity;

			UPDATE		INT_coverage 
			SET			xref = @Cov_Coverage_XRef 
			WHERE		[id] = @Cov_CoverageId;
		END

		IF(@accountvehicleid is not null) and (@policyvehicleid is not null)
			INSERT INTO	vehiclecoverage (
						policynumber,
						accountvehicleid,
						policyvehicleid,
						policycoverageid,
						coveragecode,
						ratingbasiscode,
						effectivedate,
						expirationdate,
						premium,
						rate,
						CREATEdate,
						CREATEpid,
						CREATEdelegatepid,
						ENDorsementseq, 
						ENDorsementstatus 
						)   
			VALUES		( 
						CONVERT(VARCHAR(15), @Cov_Policy_Number),
						@accountvehicleid,
						@policyvehicleid,
						@Cov_Coverage_XRef,
						CONVERT(VARCHAR(6), @Cov_Coverage_Code),
						CONVERT(VARCHAR(2), @Cov_PIC_Rating_Basis),
						@Cov_Effective_Date,
						@Cov_Expiration_Date,
						@Cov_Actual_Premium,
						CONVERT(DECIMAL(5,4), @Cov_Actual_Rate),
						getdate(),
						1,
						1,
						@ENDorsementseq,
						''03''
						)
		END
-- FPT 15933
--*BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
  
COV_COMMIT_TRANS:
	IF ( (@@ERROR = 0) AND (@COV_Error_Flag <> 1) ) BEGIN 
		SELECT @TOTAL_ACTUAL_PREMIUM = @TOTAL_ACTUAL_PREMIUM + @Cov_Actual_Premium
		
		UPDATE	INT_COVERAGE 
		SET		ERROR_CODE = 3, 
				LASTMOD = GETDATE() 
		WHERE	[ID] = @Cov_CoverageId;

		COMMIT TRANSACTION COVTRANS
		
		SELECT @COV_Error_Flag = 0      
   END

COV_Error_Handler:
	IF ( @COV_Error_Flag = 1 ) BEGIN  
		ROLLBACK TRANSACTION COVTRANS
		
		UPDATE	INT_COVERAGE 
		SET		ERROR_CODE = @COV_ERR_CODE, 
				LASTMOD = GETDATE() 
		WHERE	[ID] = @Cov_CoverageId;

	    EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, @COV_ERR_CODE,''A''

	    SELECT @PARTIAL_SUCCESS_FLAG = 1
		SELECT @COV_Error_Flag = 0 
	END 		

	SET 	@accountvehicleid = null
	SET 	@policyvehicleid = null						

	FETCH	Curs_Imp_Coverage 
	INTO	@Cov_CoverageId, @Cov_Quote_Number, @Cov_Policy_Number, @Cov_Trans_Code,@Cov_Trans_Date, 
			@Cov_UPDATE_Date, @Cov_Rate_Block_Num,@Cov_Location_Number, @Cov_Building_Number, @Cov_Coverage_Code, 
			@Cov_State,@Cov_Territory, @Cov_Subline, @Cov_Class_Code, @Cov_Oth_Code, @Cov_Town_Code,@Cov_Effective_Date, 
			@Cov_Expiration_Date, @Cov_ASLOB, @Cov_ISO_Coverage_Code,@Cov_Rating_ID_Code, @Cov_Construction_Code, 
			@Cov_Protection_Code,@Cov_ISO_Deductible_Code, @Cov_Deductible, @Cov_Limit, @Cov_Exposure,@Cov_Exposure1, 
			@Cov_PIC_Rating_Basis, @Cov_Manual_Rate, @Cov_Actual_Premium, @Cov_Actual_Rate, @Cov_Package_ModIFier, 
			@Cov_Experience_ModIFier,@Cov_Schedule_ModIFier, @Cov_Individual_ModIFier, @Cov_Expense_ModIFier,
			@Cov_MLRP_Dispension_ModIFier, @Cov_Rate_Departure_LCM, @Cov_ALL_Risk_Ind,@Cov_CoinsurancePct, 
			@Cov_Class_Limit_Indv, @Cov_Rate_Group,@Cov_ISO_Limit_ID, @Cov_Policy_Limits_Code, @Cov_Limit_Indv,
			@Cov_Limit_Occurance,@Cov_Limit_Aggregate, @Cov_Deductible_Indv,@Cov_Deductible_Occurance, 
			@Cov_Deductible_Aggregate, @Cov_ISO_Risk_ID_Code,@Cov_Risk_ID_Code, @Cov_Exposure_Indicator, 
			@Cov_RC_Exposure_Base,@Cov_RC_Report_Base, @Cov_Liability_Code, @Cov_Med_Pay_Ind, @Cov_FORm,
			@Cov_Number_Employees, @Cov_Limit_Per_Thousand, @Cov_State_Exception,@Cov_Aggregate_Limit_Code, 
			@Cov_Zone_Rating_Code, @Cov_Anti_Theft_Device,@Cov_Age_Garage_Code, @Cov_Value_Per_Rating_Unit, 
			@Cov_Original_Cost_New,@Cov_ISO_OCN_Code, @Cov_Comp_Deductible, @Cov_Theft_Deductible, 
			@Cov_ISO_PIP_Limit_ID, @Cov_PIP_Limit_Code, @Cov_PIP_Deductible_Code, @Cov_Type_Of_Equipt, @Cov_Zip_Code, 
			@Cov_Construction_Type, @Cov_Equip_Type_Coverage,@Cov_Att_Ind,@Cov_Rate_Grade, @Cov_Flat_Deduct,
			@Cov_Exp_Base_Ind, @Cov_Risk_Id, @Cov_BCEG_CODE, @Cov_LastMod, @Cov_KSTOKEY, @Cov_NSTANUM, @Cov_NLOCNUM, 
			@Cov_NBLDNUM, @Cov_NCOVNUM, @Cov_NSUBCOVNUM,@Cov_NOCCNUM, @Cov_LLOB, @Cov_LCOVTYPCDE, @Cov_LSUBCOVCDE, 
			@Cov_NVEHNUM, @Cov_NPRLNUM,@Cov_Misc_Code, @Cov_SIC_Code, @Cov_ISO_Rating_Basis, @premopsoccrlimit, 
			@premopsaggrlimit,@prodoccrlimit, @prodaggrlimit, @medpaylimit,@Cov_TERR_CODE, @miscmodIFier1,@miscmodIFier2,
			@Cov_vin, @fullyearnedind,@blanketind,@cov_rate_group,@blanketnumber,@sharedlimitind,@policylevelind,
			@cov_rating_mod,@cov_loss_cost_date,@cov_retro_date,@cov_prior_date,@whexclusionind,@lded,@AQSKEY,
			@BOPLiabilitylimit,@erpind ,@Cov_Coverage_XRef  --sandip for fwa   
END --Coverage loop STOP

CLOSE Curs_Imp_Coverage
DEALLOCATE Curs_Imp_Coverage

--CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

	SET @params = ''''
  
	IF ( @PARTIAL_SUCCESS_FLAG = 1 )
		UPDATE	INT_policy 
		SET		error_code = 41 
		WHERE	RowId = @RowId;

	SELECT	@TOTAL_ACTUAL_PREMIUM = SUM(ACTUAL_PREMIUM) 
	FROM	INT_COVERAGE 
	WHERE	POLICYROWID = @RowId AND 
			ERROR_CODE = 3;

	UPDATE	INT_POLICY 
	SET		IMPORTED_PREMIUM = @TOTAL_ACTUAL_PREMIUM 
	WHERE	RowId = @RowId;

END		----ENDorsement loop STOP

ENDr_END:
	IF (SELECT count(*) FROM INT_coverage WHERE error_code=3 and policyrowid=@RowId)<>
		(SELECT count(*) FROM INT_coverage WHERE policyrowid=@RowId and error_code is not null and 
		not(error_code in(5,13) and coverage_code in (''GLBIL'',''BOPL''))) 
	      
  		UPDATE	INT_policy 
		SET		error_code = 41 
		WHERE	RowId = @RowId and 
				error_code = 2 ;
	ELSE                                                                                    
		UPDATE	INT_policy 
		SET		error_code = 2 
		WHERE	RowId = @RowId and 
				error_code = 41 ;

	IF ( @PARTIAL_SUCCESS_FLAG_VEH = 1 )
		UPDATE	INT_policy	
		SET		error_code = 41 
		WHERE RowId = @RowId;	

	IF ( @PARTIAL_SUCCESS_FLAG_LOC = 1 )
		UPDATE	INT_policy 
		SET		error_code = 41 
		WHERE	RowId = @RowId;

	IF ( @PARTIAL_SUCCESS_FLAG_TAX = 1 )
		UPDATE	INT_policy 
		SET		error_code = 41 
		WHERE	RowId = @RowId;
 
	IF ( @error_code = 155 )
		UPDATE	INT_policy 
		SET		error_code = 155,
				lastmod = getdate() 
		WHERE	RowId = @RowId;

--FPT 153002  if it''s still 295 by now - it''s successful
--FPT 15748
	UPDATE	int_policy 	
	set		error_code = 2			
	WHERE	error_code = 295 AND	
			trans_code = ''55'' AND	
			rowid = @rowID;

	IF ( @@rowcount = 1 )
		EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, 2,''A''

	BEGIN TRY
		IF ( @error_code not in (9,19,118,127,155,170, 405) ) BEGIN                                                                                                                                                        
			SET @UPDATEpersonid = isnull(@UPDATEpersonid,1)
			EXEC  dbo.frmPA_TransENDENDorsementSave @policynumber=@policy_number ,@ENDorsementseq=@ENDorsementseq ,@personid=@UPDATEpersonid, @delegateid=@UPDATEpersonid , @params =@params	 OUTPUT
		END                                                                                                                                                             
	END TRY
	BEGIN CATCH
		UPDATE	int_policy 	
		set		error_code = -1
		WHERE	trans_code = ''55'' AND	
				rowid = @rowID;

		EXEC dbo.INT_ErrorLog_Bor @Bor_Name, @Bor_id, -1,''A''

	END CATCH
	
fetchnext: 
	FETCH	Curs_Imp_MIPS 
	INTO	@RowId, @Quote_Number, @Account_Number, @Policy_Number,@USERID, @Product, @Policy_Type, 
			@Full_Prior_Ind, @Retro_Date, @ENDrNum, @ENDrDate,@ratingsourcecode,@KSTOKEY,@Insured_Name,@Insured_Addr_1, 
			@Insured_Addr_2, @Insured_City, @Insured_State, @Insured_Postal_Code,@Insured_Phone, @Insured_Phone_Ext,@siccode,
			@comment,@bor_name,@Bor_id ,@dbaname
    
	SET @error_code=0 

END --Policy loop STOP

CLOSE Curs_Imp_MIPS
DEALLOCATE Curs_Imp_MIPS

SET QUOTED_IDENTIFIER OFF
' 
END
GO
