IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_13_UW_Check_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_13_UW_Check_List]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_13_UW_Check_List]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[usp_Step_13_UW_Check_List]

as

-- Revision #1
-- FootPrints Ticket #65106
-- Revisor:	Erik Godfrey
-- Revision Date: 1/17/2013
-- Revision Description: Add the following fields - Auto_Facultative_Reinsurance_Bound_YN
--                                                  Composite_Rated_Auto_YN
--                                                  Skilled_Nursing_Percentage

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

--**************************************************************************************************
--**************************************************************************************************
--STEP 1 - Pull in policies from Policy Information Table

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_Underwriting_Check_List_work]'') AND type in (N''U''))
Drop table Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work

CREATE TABLE Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work (
	[accountnumber] [int] NULL,
	[policyid] [int] NULL,
	[policynumber] [varchar](15) NULL,
	[policyeffectivedate] [datetime] NULL,
	[4Years_Hard_Copy_Loss_Runs_YN] [varchar](7),
	[Abuse_Molestation_YN] [varchar](7),
	[Adoption_YN] [varchar](7),
	[Asbestos_Lead_YN] [varchar](7),
	[Athletic_Participants_YN] [varchar](7),
	[Board_Experience_YN] [varchar](7),
	[Brochures_YN] [varchar](7),
	[Builders_Risk_YN] [varchar] (7),
	[Bylaws_YN] [varchar] (7),
	[Cafeteria_Restaurant_YN] [varchar](7),
	[Camps_YN] [varchar](7),
	[CGL_Coverage_YN][varchar](7),
	[Church_Trips_YN] [varchar](7),
	[Class_Operations_YN] [varchar] (7),
	[Clean_Warranty_Letter_Received_YN] [varchar](7),
	[Coastal_Wind_Guides_YN] [varchar](7),
	[Completed_ACORD_YN] [varchar] (7),
	[Complete_Signed_Application_YN] [varchar](7),		
	[Completed_Supplemental_Apps_YN] [varchar] (7),
	[Crisis_Centers_YN] [varchar](7),
	[Day_Care_Ops_YN] [varchar](7),
	[Diving_Board_YN] [varchar](7),
	[Dorms_YN] [varchar](7),
	[Drivers_List_YN] [varchar](7),
	[Drivers_Under21_YN] [varchar](7),
	[Drivers_Under25_Transport_YN] [varchar](7),
	[Drug_Alcohol_Centers_YN] [varchar](7),
	[EEO1_Report_Received_YN] [varchar](7),
	[Employment_Handbook_YN] [varchar](7),
	[Employment_Policies_YN] [varchar](7),
	[Engagement_Letters_YN] [varchar](7),
	[Facultative_Reinsurance_Required_YN] [varchar](7),
	[Facultative_Spreadsheet_Filled_Out_YN] [varchar](7),
	[Financials_YN] [varchar](7),
	[Form_5500_YN] [varchar](7),
	[For_Profit_YN] [varchar](7),
	[Foster_Care_YN] [varchar](7),
	[Full_VIN_Num_YN] [varchar](7),
	[Group_Homes_YN] [varchar](7),
	[Hail_YN] [varchar](7),
	[Headstart_YN] [varchar](7),
	[Hired_Exposure_YN] [varchar](7),
	[Homeless_Shelters_YN] [varchar](7),
	[Independent_Contractors_YN] [varchar](7),
	[Involuntary_Treatment_Programs_YN] [varchar](7),
	[Lakes_and_Ponds_YN] [varchar](7),
	[Licensed_Professional_Designations_YN] [varchar](7),
	[Life_Safety_Requirements_YN] [varchar](7),
	[Limits_ITV_YN] [varchar](7),
	[Liquor_Liability_YN] [varchar](7),
	[Lockdown_facilities_YN] [varchar] (7),
	[Loss_Control_Requested_YN] [varchar] (7),
	[Management_Signoff_YN] [varchar] (7),
	[Martial_Arts_YN] [varchar] (7),
	[Meals_On_Wheels_YN] [varchar](7),
	[Mentally_Ill_Impaired_Clients_YN] [varchar](7),	
	[Mold_YN] [varchar](7),
	[More_Than_20Beds_In_One_facility_YN] [varchar](7),	
	[More_Than_50percent_GB_From_Single_Client_YN] [varchar](7),
	[MVR_Checks_YN] [varchar](7),
	[Narrative_from_field_YN] [varchar](7),
	[Narrative_WriteUp_of_Account_YN] [varchar](7),		
	[No_Loss_Letter_Received_YN] [varchar](7),
	[No_Prior_Coverage_YN] [varchar](7),
	[Non_Owned_YN] [varchar](7),
	[No_Qualified_Peer_Review_YN] [varchar](7),
	[Physicians_On_Staff_YN] [varchar](7),
	[PIIC_Boiler_YN] [varchar](7),
	[Playground_YN] [varchar](7),
	[Playground_Equip_YN] [varchar](7),
	[Pool_YN] [varchar](7),
	[Prior_Coverage_YN] [varchar](7),
	[Rated_Premium_Agrees_with_Binding_Premium_YN] [varchar](7),
	[Referred_to_Management_YN] [varchar] (7),
	[Rental_Prop_YN] [varchar](7),
	[Retro_Date_Applies_YN] [varchar](7),
	[Resumes_YN] [varchar](7),
	[Risk_Meter_Check_YN] [varchar](7),
	[Special_Events_YN] [varchar](7),
	[Sports_Activities_YN] [varchar](7),
	[Stadiums_YN] [varchar](7),
	[Stained_Glass_YN] [varchar](7),
	[Standard_Contract_YN] [varchar](7),
	[State_Hospital_Institution_YN] [varchar](7),
	[State_Inspection_YN] [varchar](7),
	[Subsidiaries_Affiliates_YN] [varchar](7),
	[Successful_Peer_Review_YN] [varchar](7),
	[Suicide_Hotlines_YN] [varchar](7),
	[Suits_For_Fees_YN] [varchar](7),
	[Supp_Claim_Form_Received_YN] [varchar](7),
	[Supplemental_Claim_Form_Loss_Run_YN] [varchar](7),
	[Tanning_YN] [varchar] (7),
	[Tennis_Bubble_YN] [varchar] (7),
	[Tennis_Courts_YN] [varchar] (7),
	[Umbrella_YN] [varchar](7),
	[UMUIM_State_Issues_YN] [varchar](7),
	[Vacant_Buildings_YN] [varchar](7),
	[Vacant_Land_YN] [varchar](7),
	[Vehicle_Seat_Capacity_YN] [varchar](7),
	[Volunteers_YN] [varchar](7),
	[Waiver_YN] [varchar] (7),
	[Weatherization_Programs_YN] [varchar](7),
	[Within_Underwriting_Authority_YN] [varchar] (7),
	[Women_Shelters_YN] [varchar](7),
	[Workshops_YN] [varchar](7),
	[Insurance_Programs_For_Members_YN] [varchar](7),
	[Disciplinary_Administrative_or_Criminal_Actions_YN] [varchar](7),  
	[Disciplinary_Action_from_Peer_Review_YN] [varchar](7),
	[Employment_Application_YN] [varchar](7),
	[Employment_Application_Handbook_YN] [varchar](7),
	[Information_Only_YN] [varchar](7),
	[List_of_D_and_Os_YN] [varchar](7),
	[Merger_Acquisition_or_Consolidation_YN] [varchar](7),
	[Peer_Review_or_Disciplinary_Action_YN] [varchar](7),
	[Positive_Fund_Balance_YN] [varchar](7),
	[Product_Research_or_Development_Testing_Certif_Services_YN] [varchar](7),
	[Proper_Employment_Procedures_YN] [varchar](7),
	[Magazines_Periodicals_or_Newsletters_YN] [varchar](7),
	[Security_Precautions_YN] [varchar](7),
	[Standard_Setting_or_Member_Certification_Services_YN] [varchar](7),
	[Tax_Exempt_YN] [varchar](7),
	[Transaction_E_Commerce_YN] [varchar](7),
	[Website_Information_Only_YN] [varchar](7),
	[Website_Transactional_E_Commerce_YN] [varchar](7),
	[Auto_Facultative_Reinsurance_Bound_YN] [varchar](7),  -- Added as part of Revision #1
	[Composite_Rated_Auto_YN] [varchar](7),  -- Added as part of Revision #1
	
	[Attestation_Percent] [decimal] (18,6),
	[Audit_Percent] [decimal] (18,6),
	[Bookkeeping_Percent] [decimal] (18,6),
	[Church_Members_Num] [decimal] (18,6),
	[Claims_Past_5Yrs] [decimal] (18,6),
	[Clergy_Num] [decimal] (18,6),
	[Compilation_Percent] [decimal] (18,6),
	[Corporate_Financial_Planning_Percent] [decimal] (18,6),
	[Corporate_Tax_Percent] [decimal] (18,6),
	[Data_Processing_Percent] [decimal] (18,6),
	[Elder_Care_Percent] [decimal] (18,6),
	[Employee_Salary_GT100k] [decimal] (18,6),
	[Fleet_Size] [decimal] (18,6),
	[Individual_Tax_Percent] [decimal] (18,6),
	[Insider_Shareholder_Percent] [decimal] (18,6),
	[Locations_Num] [decimal] (18,6),
	[MAS_Services_Percent] [decimal] (18,6),
	[Number_of_Buildings_Greater_than_3_Stories] [decimal] (18,6),
	[Number_of_Full_Time_Employees] [decimal] (18,6),
	[Number_of_Part_Time_Employees] [decimal] (18,6),
	[Number_of_Temporary_Employees] [decimal] (18,6),
	[Number_of_Total_Employees] [decimal] (18,6),
	[Number_of_Lease_Employees] [decimal] (18,6),
	[Number_of_Rooms] [decimal] (18,6),
	[Number_of_Years_in_Operation] [decimal] (18,6),
	[Other_Assurance_Percent] [decimal] (18,6),
	[Percentage_Occupancy] [decimal] (18,6),
	[Personal_Financial_Planning_Percent] [decimal] (18,6),
	[Plan_Assets] [decimal] (18,6),
	[Review_Percent] [decimal] (18,6),
	[SEC_Work_Percent] [decimal] (18,6),
	[Total_Claims] [decimal] (18,6),
	[Total_Participants] [decimal] (18,6),
	[Turnover_Rate] [decimal] (18,6),
	[Year_Condo_Built] [decimal] (18,6),
	[Year_Roof_Updated] [decimal] (18,6),
	[Skilled_Nursing_Percentage] [varchar](75),  -- Added as part of Revision #1
	--PV CD
	[Claims_Past_5yrs_Range][varchar] (255),
	[Employee_Salary_GT100k_Range][varchar] (255),
	[Insider_Shareholder_Percent_Range][varchar] (255),
	[Employees_SUM_Range][varchar] (255),
	[Number_of_Full_Time_Employees_Range][varchar] (255),
	[Number_of_Part_Time_Employees_Range][varchar] (255),
	[Number_of_Temporary_Employees_Range][varchar] (255),
	[Number_of_Total_Employees_Range][varchar] (255),
	[Percent_of_Part_Time_and_Temp_Employees_Range][varchar] (255),
	[Plan_Assets_Range][varchar] (255),
	[Salary_100K_to_Total_Employees_Range][varchar] (255),
	[Total_Participants_Range][varchar] (255),
	[Total_Claims_Range][varchar] (255),

	--CO
	[Number_of_Buildings_Greater_than_3_Stories_Range] [varchar](255),
	[Year_Built_Range] [varchar](255),
	[Year_Roof_Updated_Range] [varchar](255),
	--DY	
	[Locations_Range] [varchar](255), 
	--FP
	[Fleet_Size_Range] [varchar](255),
	--HF

	--HT
	[Number_of_Rooms_Range] [varchar](255),
	[Percentage_Occupancy_Range] [varchar](255),

	--NPDO
	[Number_of_Lease_Employees_Range][varchar] (255),
	[Number_of_years_in_Operation_Range][varchar] (255),
	[Revenue_Gross_Billing_Range][varchar] (255),
	[Turnover_Rate_Range][varchar] (255),

	-- RL
	[Clergy_Range] [varchar](255),
	[Church_Members_Range] [varchar](255),

	-- AE
	[Attestation_Range] [varchar] (255),
	[Audit_Range] [varchar] (255),
	[BookKeeping_Range] [varchar] (255),
	[Compilation_Range] [varchar] (255),
	[Corporate_Financial_Planning_Range] [varchar] (255),
	[Corporate_Tax_Range] [varchar] (255),
	[Data_Processing_Range] [varchar] (255),
	[Individual_Tax_Range] [varchar] (255),
	[MAS_Services_Range] [varchar] (255),
	[Other_Assurance_Range][varchar] (255),
	[Personal_Financial_Planning_Range] [varchar] (255),
	[Review_Range] [varchar] (255),
	[SEC_Work_Range][varchar] (255),
	--CL
	--no new fields for CL
	--HF
	[Number_of_Swimming_Pools] [float],
	[Number_of_Swimming_Pools_Range] [varchar](100)
	
	
	
	
)

--**************************************************************************************************
--**************************************************************************************************

--STEP 3
--UPDATES ALL UNDERWRITING "Yes or No" CHECKLIST INFORMATION - sum on status only

insert into Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work
select uw.accountnumber,
	uw.policyid,
	uw.policynumber,
	uw.policyeffectivedate,
            [4Years_Hard_Copy_Loss_Runs_YN] = [4 years of hard copy loss runs],
            [Abuse_Molestation_YN] = [Abuse/Molestation],
			[Adoption_YN] = [Adoption],
			[Asbestos_Lead_YN] = [Asbestos/Lead],
			[Athletic_Participants_YN] = [Athletic Participants],
			[Board_Experience_YN] = [Board Experience],
			[Brochures_YN] = [Brochures],
			[Builders_Risk_YN] = [Builders Risk],
			[Bylaws_YN] = [Bylaws],
			[Cafeteria_Restaurant_YN] = [Cafeteria/Restaurant],
			[Camps_YN] = [Camps],
			[CGL_Coverage_YN] = [Do they have CGL Coverage?],
			[Church_Trips_YN] = [Church Sponsored Trips],
			[Class_Operations_YN] = [Class/Operations],
			[Clean_Warranty_Letter_Received_YN] = [Clean Warranty Letter Received],
            [Coastal_Wind_Guides_YN] = [Coastal/Wind Guides],
			[Completed_ACORD_YN] =[Completed ACORD],
			[Complete_Signed_Application_YN] = [Completed/Signed Application],
			[Completed_Supplemental_Apps_YN] = [Completed Supplemental Apps.],
            [Crisis_Centers_YN] = [Crisis Centers (24 hr. care)],
            [Day_Care_Ops_YN] = [Day Care Operation],
            [Diving_Board_YN] = [Diving Board],
            [Dorms_YN] = [Dormitories],
            [Drivers_List_YN] = [3AF044A8-6A35-4718-B296-9F2B27F64A45],  
            [Drivers_Under21_YN] = [Drivers < 21 Years],
            [Drivers_Under25_Transport_YN] = [Is anyone under the age of 25 transporting people in vans or buses?],
            [Drug_Alcohol_Centers_YN ] = [Drug/Alcohol Centers],
            [EEO1_Report_Received_YN] = [EEO-1 Report Received],
			[Employment_Handbook_YN] = [Employment Handbook],
			[Employment_Policies_YN] = [Employment policies in place],
		    [Engagement_Letters_YN] = [Engagement Letters],
		    [Facultative_Reinsurance_Required_YN] = [Facultative Reinsurance Required],
			[Facultative_Spreadsheet_Filled_Out_YN] = [Facultative Spreadsheet Filled Out],
			[Financials_YN] = [Financials],
		    [Form_5500_YN] = [Form 5500],
		    [For_Profit_YN] = [For-Profit Operations],
		    [Foster_Care_YN] = [Foster Care Placement],
            [Full_VIN_Num_YN] = [Does each vehicle have a full VIN#],
			[Group_Homes_YN] = [Group Homes],
			[Hail_YN] = [Hail Exposure],
			[Headstart_YN] = [Headstart Operations],
			[Hired_Exposure_YN] = [Hired Exposure],
			[Homeless_shelters_YN] = [Homeless Shelters],
			[Independent_Contractors_YN] = [Independent Contractors],
			[Involuntary_Treatment_Programs_YN ] = [Involuntary Treatment Programs],
			[Lakes_and_Ponds_YN] = [Lakes and Ponds],
			[Licensed_Professional_Designations_YN] = [Licensed Professional/Designations],
			[Life_Safety_Requirements_YN] = [Life Safety Requirements],
			[Limits_ITV_YN] = [Limits ITV],
			[Liquor_Liability_YN] = [Liquor Liability],
			[Lockdown_Facilities_YN] = [Lock-down facilities],
			[Loss_Control_Requested_YN] = [Loss Control Requested],
			[Management_Signoff_YN] = [Management Signoff],
			[Martial_Arts_YN] = [Martial Arts] ,
			[Meals_On_Wheels_YN] = [Meals On Wheels],
            [Mentally_Ill_Impaired_Clients_YN] = [Mentally Ill / Impaired Clients],      
			[Mold_YN] = [Mold Exposure],
			[More_than_20beds_in_one_facility_YN] = [>20 beds in any one facility],   
			[More_than_50percent_GB_from_single_client_YN] = [More than 50% GB''s from a single client],
			[MVR_Checks_YN] = [B23A3DF8-7BE6-421C-99FF-609E6658793D],	
			[Narrative_from_field_YN] = [Narrative from field],
			[Narrative_WriteUp_of_Account_YN] = [Narrative Write-Up of Account],
			[No_Loss_Letter_Received_YN] = [No Loss Letter Received],
			[No_Prior_Coverage_YN] = [No Prior Coverage],
			[Non_Owned_YN] = [Non-Owned Exposure],
            [No_Qualified_Peer_Review_YN] = [No Qualified Peer Review],
			[Physicians_On_Staff_YN] = [Physicians on Staff],
		    [PIIC_Boiler_YN] = [PIIC Boiler],
			[Playground_YN] = [Playground],
			[Playground_Equip_YN] = [Playground Equipment],
			[Pool_YN] = [Do any of the insured locations have a pool?],
			[Prior_Coverage_YN] = [Prior Coverage],
			[Rated_Premium_Agrees_with_Binding_Premium_YN] =[Rated Premium agrees with binding premium],
			[Referred_to_Management_YN] = [Referred to Management],
			[Rental_Prop_YN] = [Rental Properties],
			[Retro_Date_Applies_YN] = [Retro Date Applies],
			[Resumes_YN] = [Resume],
			[Risk_Meter_Check_YN] = [Was Risk Meter Checked if needed],
			[Special_Events_YN] = [Special Events],
			[Sports_Activities_YN] = [Any sports activities provided?],
			[Stadiums_YN] = [Stadiums],
            [Stained_Glass_YN] = [Stained Glass],
			[Standard_Contract_YN] = [Standard Contract],
            [State_Hospital_Institution_YN] = [State Hospital/Institution],
			[State_Inspection_YN] = [State Inspection],
			[Subsidiaries_Affiliates_YN] = [Subsidiaries/Affiliates],
			[Successful_Peer_Review_YN] = [Successful Peer Review],
			[Suicide_Hotlines_YN] = [Suicide Hotlines],
			[Suits_For_Fees_YN] = [Suits For Fees],
			[Supp_Claim_Form_Received_YN] = [Supplemental Claim Form Received],
			[Supplemental_Claim_Form_Loss_Run_YN] = [Supplemental Claim Form/Loss Run],
			[Tanning_YN] = [Tanning],
			[Tennis_Bubble_YN] = [Tennis Bubble],
			[Tennis_Courts_YN] = [Tennis Courts],
			[Umbrella_YN] = [Umbrella],
            [UMUIM_State_Issues_YN] = [UM/UIM State Issues],
            [Vacant_Buildings_YN] = [Vacant Buildings],
            [Vacant_Land_YN] = [Vacant Land],
			[Vehicle_Seat_Capacity_YN] = [Does each vehicle show the seat capacity?],
			[Volunteers_YN] = [Volunteers],
			[Waiver_YN] = [Waiver],
			[Weatherization_Programs_YN] = [Weatherization Programs],
			[Within_Underwriting_Authority_YN] = [Within Underwriting Authority],
			[Women_Shelters_YN] = [Women Shelters],
			[Workshops_YN] = [Workshops],
			[Insurance_Programs_For_Members_YN] = [Administer or sponsor insurance programs for members],
			[Disciplinary_Administrative_or_Criminal_Actions_YN] = [Any disciplinary, administrative or criminal actions],  	
			[Disciplinary_Action_from_Peer_Review_YN] = [Disciplinary action as a results of peer review activities],	
			[Employment_Application_YN] = [Employment Application],	
			[Employment_Application_Handbook_YN] = [Employment Application/Handbook],	
			[Information_Only_YN] = [Information Only],	
			[List_of_D_and_Os_YN] = [List of D&O''s],	
			[Merger_Acquisition_or_Consolidation_YN] = [Merger, acquisition or consolidation with another entity],	
			[Peer_Review_or_Disciplinary_Action_YN] = [Peer Review Activities or Disciplinary Action],	
			[Positive_Fund_Balance_YN] = [Positive Fund Balance],	
			[Product_Research_or_Development_Testing_Certif_Services_YN] = [Product research or development, testing, certif services],	
			[Proper_Employment_Procedures_YN] = [Proper employment procedures in place],	
			[Magazines_Periodicals_or_Newsletters_YN] = [Publish Magazines, periodicals, or newsletters],	
			[Security_Precautions_YN] = [Security precautions taken],	
			[Standard_Setting_or_Member_Certification_Services_YN] = [Standard setting or Member Certification Services],	
			[Tax_Exempt_YN] = [Tax Exempt],	
			[Transaction_E_Commerce_YN] = [Transaction/e-Commerce],	
			[Website_Information_Only_YN] = [Website Information Only],	
			[Website_Transactional_E_Commerce_YN] = [Website Transactional/e-Commerce],
			[Auto_Facultative_Reinsurance_Bound_YN] = [Auto Facultative Reinsurance Bound],  -- Added as part of Revision #1
			[Composite_Rated_Auto_YN] = [Composite Rated Auto],  -- Added as part of Revision #1
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,  -- Added as part of Revision #1
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null
			
      FROM
            (Select 
	accountnumber,
	policyid,
	policynumber,
	policyeffectivedate
from Act_Detailed_Experience.dbo.Policy_Information_ALL_POLICIES_work
Group by 
	accountnumber,
	policyid,
	policynumber,
	policyeffectivedate) UW
      left outer JOIN
      (     
            SELECT
                        PolicyNumber as PolicyNumber,
                        [4 years of hard copy loss runs] = CASE [4 years of hard copy loss runs] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA'' 
												ELSE ''No Info'' END, 
                        [Abuse/Molestation] = CASE [Abuse/Molestation] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Adoption] = CASE [Adoption] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Asbestos/Lead] = CASE [Asbestos/Lead] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Athletic Participants] = CASE [Athletic Participants] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Board Experience] = CASE [Board Experience] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Brochures] = CASE [Brochures] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Builders Risk] = CASE [Builders Risk] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Bylaws] = CASE [Bylaws] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Cafeteria/Restaurant] = CASE [Cafeteria/Restaurant] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Camps] = CASE [Camps] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Do they have CGL Coverage?] = CASE [Do they have CGL Coverage?] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Church Sponsored Trips] = CASE [Church Sponsored Trips] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Class/Operations] = CASE [Class/Operations] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Clean Warranty Letter Received] = CASE [Clean Warranty Letter Received] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Coastal/Wind Guides] = CASE [Coastal/Wind Guides] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Completed Supplemental Apps.] = CASE [Completed Supplemental Apps.]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Completed ACORD] = CASE [Completed ACORD]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Completed/Signed Application] = CASE [Completed/Signed Application]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
		                [Crisis Centers (24 hr. care)] = CASE [Crisis Centers (24 hr. care)] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
		                [Day Care Operation] = CASE [Day Care Operation] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Diving Board] = CASE [Diving Board] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Dormitories] = CASE [Dormitories] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [3AF044A8-6A35-4718-B296-9F2B27F64A45] = CASE [3AF044A8-6A35-4718-B296-9F2B27F64A45] --DriversList_YN
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,  
                        [Drivers < 21 Years] = CASE [Drivers < 21 Years] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Is anyone under the age of 25 transporting people in vans or buses?] = CASE [Is anyone under the age of 25 transporting people in vans or buses?] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Drug/Alcohol Centers] = CASE [Drug/Alcohol Centers] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [EEO-1 Report Received]  = CASE [EEO-1 Report Received] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
		                [Employment Handbook] = CASE [Employment Handbook] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Employment policies in place] = CASE [Employment policies in place] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Engagement Letters] = CASE [Engagement Letters] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Facultative Reinsurance Required] = CASE [Facultative Reinsurance Required] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Facultative Spreadsheet Filled Out] = CASE [Facultative Spreadsheet Filled Out]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Financials] = CASE [Financials] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Form 5500] = CASE [Form 5500] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [For-Profit Operations] = CASE [For-Profit Operations] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Foster Care Placement] = CASE [Foster Care Placement] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Does each vehicle have a full VIN#] = CASE [Does each vehicle have a full VIN#] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Group Homes] = CASE [Group Homes] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Hail Exposure] = CASE [Hail Exposure] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Headstart Operations] = CASE [Headstart Operations] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Hired Exposure] = CASE [Hired Exposure] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Homeless Shelters] = CASE [Homeless Shelters] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Independent Contractors] = CASE [Independent Contractors] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
		                [Involuntary Treatment Programs] = CASE [Involuntary Treatment Programs] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Lakes and Ponds] = CASE [Lakes and Ponds] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Licensed Professional/Designations] = CASE [Licensed Professional/Designations] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Life Safety Requirements] = CASE [Life Safety Requirements] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Limits ITV] = CASE [Limits ITV] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Liquor Liability] = CASE [Liquor Liability] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Lock-down Facilities] = CASE [Lock-down Facilities] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Loss Control Requested] = CASE [Loss Control Requested] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Management Signoff] = CASE [Management Signoff] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Martial Arts] = CASE [Martial Arts] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END, 
		                [Meals On Wheels] = CASE [Meals On Wheels] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END, 
                        [Mentally Ill / Impaired Clients] = CASE [Mentally Ill / Impaired Clients] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,      
                        [Mold Exposure] = CASE [Mold Exposure] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [>20 beds in any one facility] = CASE [>20 beds in any one facility] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,   
                        [More than 50% GB''s from a single client] = CASE [More than 50% GB''s from a single client] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,   
                        [B23A3DF8-7BE6-421C-99FF-609E6658793D]= CASE [B23A3DF8-7BE6-421C-99FF-609E6658793D] --MVRChecks
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END, 
						[Narrative from field] = CASE [Narrative from field] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Narrative Write-Up of Account] = CASE [Narrative Write-Up of Account]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [No Loss Letter Received] = CASE [No Loss Letter Received] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [No Prior Coverage] = CASE [No Prior Coverage] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Non-Owned Exposure] = CASE [Non-Owned Exposure] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [No Qualified Peer Review] = CASE [No Qualified Peer Review] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
		                [Physicians on Staff] = CASE [Physicians on Staff] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
		                [PIIC Boiler] = CASE [PIIC Boiler] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Playground] = CASE [PIIC Boiler] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Playground Equipment] = CASE [Playground Equipment] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Do any of the insured locations have a pool?] = CASE [Do any of the insured locations have a pool?] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Prior Coverage] = CASE [Prior Coverage] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Rated Premium agrees with binding premium] = CASE 	[Rated Premium agrees with binding premium]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Referred to Management] = CASE [Referred to Management]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Rental Properties] = CASE [Rental Properties] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Retro Date Applies] = CASE [Retro Date Applies] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Resume] = CASE [Resume] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
		                [Was Risk Meter Checked if needed] = CASE [Was Risk Meter Checked if needed] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Special Events] = CASE [Special Events] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Any sports activities provided?] = CASE [Any sports activities provided?] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Stadiums] = CASE [Stadiums] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Stained Glass] = CASE [Stained Glass] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [State Hospital/Institution] = CASE [State Hospital/Institution] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Standard Contract] = CASE [Standard Contract] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [State Inspection] = CASE [State Inspection] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Subsidiaries/Affiliates] = CASE [Subsidiaries/Affiliates] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Successful Peer Review] = CASE [Successful Peer Review] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Suicide Hotlines] = CASE [Suicide Hotlines] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Suits For Fees] = CASE [Suits For Fees] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Supplemental Claim Form Received] = CASE [Supplemental Claim Form Received] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Supplemental Claim Form/Loss Run] = CASE [Supplemental Claim Form/Loss Run]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Tanning] = CASE [Tanning] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Tennis Bubble] = CASE [Tennis Bubble] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Tennis Courts]  = CASE [Tennis Courts] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Umbrella] = CASE [Umbrella] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [UM/UIM State Issues] = CASE [UM/UIM State Issues] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Vacant Buildings] = CASE [Vacant Buildings] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Vacant Land]  = CASE [Vacant Land] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Does each vehicle show the seat capacity?] = CASE [Does each vehicle show the seat capacity?] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Volunteers] = CASE [Volunteers] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Waiver] = CASE [Waiver] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Weatherization Programs] = CASE [Weatherization Programs] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
						[Within Underwriting Authority] = CASE [Within Underwriting Authority]
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Women Shelters]  = CASE [Women Shelters] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Workshops] = CASE [Workshops] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Administer or sponsor insurance programs for members] = CASE [Administer or sponsor insurance programs for members] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Any disciplinary, administrative or criminal actions] = CASE [Any disciplinary, administrative or criminal actions] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,																					                        [Disciplinary action as a results of peer review activities] = CASE [Disciplinary action as a results of peer review activities] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Employment Application] = CASE [Employment Application] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Employment Application/Handbook] = CASE [Employment Application/Handbook] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Information Only] = CASE [Information Only] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,																					                        [List of D&O''s] = CASE [List of D&O''s] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Merger, acquisition or consolidation with another entity] = CASE [Merger, acquisition or consolidation with another entity] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,								
                        [Peer Review Activities or Disciplinary Action] = CASE [Peer Review Activities or Disciplinary Action] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Positive Fund Balance] = CASE [Positive Fund Balance] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Product research or development, testing, certif services] = CASE [Product research or development, testing, certif services] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Proper employment procedures in place] = CASE [Proper employment procedures in place] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,																					                        [Publish Magazines, periodicals, or newsletters] = CASE [Publish Magazines, periodicals, or newsletters] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,		
                        [Security precautions taken] = CASE [Security precautions taken] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,		
                        [Standard setting or Member Certification Services] = CASE [Standard setting or Member Certification Services] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,		
                        [Tax Exempt] = CASE [Tax Exempt] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,																					                         [Transaction/e-Commerce] = CASE [Transaction/e-Commerce] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Website Information Only] = CASE [Website Information Only] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Website Transactional/e-Commerce] = CASE [Website Transactional/e-Commerce] 
												WHEN 0 THEN ''N'' 
												WHEN 1 THEN ''Y'' 
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Auto Facultative Reinsurance Bound] = CASE [Auto Facultative Reinsurance Bound]  -- Added as part of Revision #1
												WHEN 0 THEN ''N''
												WHEN 1 THEN ''Y''
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END,
                        [Composite Rated Auto] = CASE [Composite Rated Auto]  -- Added as part of Revision #1
												WHEN 0 THEN ''N''
												WHEN 1 THEN ''Y''
												WHEN 2 THEN ''NA''
												ELSE ''No Info'' END
                             			
												
            FROM        
            (
                  SELECT 
                        pss.PolicyNumber,
                        ugi.UCLGridItemName,
                        ugd.Status
--						ugd.Number		
                        FROM 
                              PathNet2.dbo.PolicySnapshot pss with (nolock)
--                        INNER JOIN
						left outer join  -- Added as part of Revision #1
                              PathNet2.dbo.UCLGridData ugd with (nolock)
                        ON
                              pss.TransactionID = ugd.UCLChecklistID
--                        INNER JOIN
						left outer join  -- Added as part of Revision #1
                              PathNet2.dbo.UCLGridItem ugi with (nolock)
                        ON
                              ugd.UCLGridItemID = ugi.UCLGridItemID           
                        
            ) 
                  as SourceData
            PIVOT
                  (
				SUM(Status)
                  FOR 
                  UCLGridItemName IN 
                        (
                              [4 years of hard copy loss runs],
                              [Abuse/Molestation],
							  [Adoption],
                              [Asbestos/Lead],
                              [Athletic Participants],
                              [Board Experience],
							  [Brochures],
	                          [Builders Risk],
							  [Bylaws],
                              [Cafeteria/Restaurant],
                              [Camps],
                              [Do they have CGL Coverage?],
                              [Church Sponsored Trips],
							  [Class/Operations], 
                              [Clean Warranty Letter Received],
                              [Coastal/Wind Guides],
							  [Completed ACORD],
							  [Completed/Signed Application],
							  [Completed Supplemental Apps.],
                              [Crisis Centers (24 hr. care)],
                              [Day Care Operation],
                              [Diving Board],
                              [Dormitories],
                              [3AF044A8-6A35-4718-B296-9F2B27F64A45],  --DriversList_YN
                              [Drivers < 21 Years],
                              [Is anyone under the age of 25 transporting people in vans or buses?],
                              [Drug/Alcohol Centers],
                              [EEO-1 Report Received],
                              [Employment Handbook],
                              [Employment policies in place],
                              [Engagement Letters],
                              [Facultative Reinsurance Required],
							  [Facultative Spreadsheet Filled Out],
							  [Financials],
                              [Form 5500],
                              [For-Profit Operations],
                              [Foster Care Placement],
                              [Does each vehicle have a full VIN#],
                              [Group Homes],
                              [Hail Exposure],
                              [Headstart Operations],
                              [Hired Exposure],
                              [Homeless Shelters],
                              [Independent Contractors],
                              [Involuntary Treatment Programs],
                              [Lakes and Ponds],
                              [Licensed Professional/Designations],
                              [Life Safety Requirements],
                              [Limits ITV],
							  [Liquor Liability],
							  [Loss Control Requested],
							  [Lock-down Facilities],	
							  [Management Signoff],
                              [Martial Arts] ,
                              [Meals On Wheels],
                              [Mentally Ill / Impaired Clients],      
                              [Mold Exposure],
                              [>20 beds in any one facility],   
                              [More than 50% GB''s from a single client],
                              [B23A3DF8-7BE6-421C-99FF-609E6658793D],	  --MVRChecks
							  [Narrative from field],
							  [Narrative Write-Up of Account],
                              [No Loss Letter Received],
                              [No Prior Coverage],
                              [Non-Owned Exposure],
                              [No Qualified Peer Review],
                              [Physicians on Staff],
                              [PIIC Boiler],
                              [Playground],
                              [Playground Equipment],
                              [Do any of the insured locations have a pool?],
                              [Prior Coverage],
							  [Rated Premium agrees with binding premium],
							  [Referred to Management],
                              [Rental Properties],
                              [Retro Date Applies],
                              [Resume],
							  [Was Risk Meter Checked if needed],
							  [Special Events],
                              [Any sports activities provided?],
                              [Stadiums],
                              [Stained Glass],
							  [Standard Contract],	
                              [State Hospital/Institution],
                              [State Inspection],
                              [Subsidiaries/Affiliates],
                              [Successful Peer Review],
                              [Suicide Hotlines],
                              [Suits For Fees],
                              [Supplemental Claim Form Received],
							  [Supplemental Claim Form/Loss Run],
                              [Tanning],
                              [Tennis Bubble],
                              [Tennis Courts],
                              [Umbrella],
                              [UM/UIM State Issues],
                              [Vacant Buildings],
                              [Vacant Land],
                              [Does each vehicle show the seat capacity?],
                              [Volunteers],
                              [Waiver],
                              [Weatherization Programs],
							  [Within Underwriting Authority],
                              [Women Shelters],
                              [Workshops],
                              [Administer or sponsor insurance programs for members],                           
                              [Any disciplinary, administrative or criminal actions],
                              [Disciplinary action as a results of peer review activities],
                              [Employment Application],
                              [Employment Application/Handbook],
                              [Information Only],
                              [List of D&O''s],
                              [Merger, acquisition or consolidation with another entity],
                              [Peer Review Activities or Disciplinary Action],
                              [Positive Fund Balance],
                              [Product research or development, testing, certif services],
                              [Proper employment procedures in place],
                              [Publish Magazines, periodicals, or newsletters],
                              [Security precautions taken],
                              [Standard setting or Member Certification Services],
                              [Tax Exempt],
                              [Transaction/e-Commerce],
                              [Website Information Only],
                              [Website Transactional/e-Commerce],
                              [Auto Facultative Reinsurance Bound],  -- Added as part of Revision #1
                              [Composite Rated Auto]  -- Added as part of Revision #1
                              
                              )
                  ) as PivotTable
      ) as A
      ON
            UW.PolicyNumber = A.PolicyNumber

-- Code added as part of Revision #1
-- Skilled Nursing Percentage Update
update Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work
set Skilled_Nursing_Percentage = isnull(p.UCLGridComboOptionName,''No Info'')
from Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work de with (nolock)
left outer join (select pss.PolicyNumber,
                        ugc.UCLGridComboOptionName
                 from PathNet2.dbo.PolicySnapshot pss with (nolock)
                 left outer join PathNet2.dbo.UCLGridData ugd with (nolock)
                 on  pss.TransactionID = ugd.UCLChecklistID
                 left outer join PathNet2.dbo.UCLGridItem ugi with (nolock)
                 on  ugd.UCLGridItemID = ugi.UCLGridItemID 
                 left outer join PathNet2..UCLGridComboOption ugc with (nolock)
                 on  ugd.UCLGridItemID = ugc.UCLGridItemID
                 and ugd.UCLGridComboOptionID = ugc.UCLGridComboOptionID
                 where UCLGridItemName = ''Skilled Nursing Percentage'') p
on de.policynumber = p.PolicyNumber
-- End of Code added as part of Revision #1

--8 minutes 3/25/2010

--**************************************************************************************************
--**************************************************************************************************

--STEP 5
--UPDATES ALL NUMERIC UNDERWRITING CHECKLIST INFORMATION - sum on number only


UPDATE Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work 

      SET   
			[Attestation_Percent] = [Attestation],
			[Audit_Percent] = [Audit],
			[Bookkeeping_Percent] = [Bookkeeping],
			[Church_Members_Num] = [Number of Church Members],
			[Claims_Past_5Yrs] = [Number of Paid Claims in the last 5 years],
            [Clergy_Num] = [# of Clergy],
			[Compilation_Percent] = [Compilation],
			[Corporate_Financial_Planning_Percent] = [Corporate Financial Planning],
			[Corporate_Tax_Percent] = [Corporate Tax],
			[Data_Processing_Percent] = [Data Processing],
			[Elder_Care_Percent] = [Elder Care],
			[Employee_Salary_GT100k] = [# of employees over $100K in salary],	
			[Fleet_Size] = [Fleet Size],
			[Individual_Tax_Percent] = [Individual Tax],
			[Insider_Shareholder_Percent] = [Insider Shareholder Percent],
			[Locations_Num] = [Number of Locations],
			[MAS_Services_Percent] = [MAS Services],
			[Number_of_Buildings_Greater_than_3_Stories] = [Num of Buildings > 3 Stories],
			[Number_of_Rooms] = [Total Number of Rooms],
			[Number_of_Full_Time_Employees] = [Number of Full Time Employees],
			[Number_of_Part_Time_Employees] = [Number of Part Time Employees],
			[Number_of_Temporary_Employees] = [Number of Temporary Employees],
			[Number_of_Lease_Employees] = [Number of Lease Employees],
			[Number_of_Total_Employees] = [Total Employees],
			[Number_of_Years_in_Operation] = [Number of Years in Operation],
			[Other_Assurance_Percent] = [Other Assurance],
			[Percentage_Occupancy] = [Percentage of Occupancy],
			[Personal_Financial_Planning_Percent] = [Personal Financial Planning],
			[Plan_Assets] = [Plan Assets],
			[Review_Percent] = [Review],
			[SEC_Work_Percent] = [SEC Work],
			[Total_Claims] = [Total Claims],
			[Total_Participants] = [Total Participants],
			[Turnover_Rate] = [Turnover Rate],
			[Year_Condo_Built] = [Year Condo was Built],
			[Year_Roof_Updated] = [Year of Roof update]
           
      FROM
            Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work UW
      --INNER JOIN
		LEFT JOIN
      (     
            SELECT
                        PolicyNumber as PolicyNumber,
                        
						[Attestation] = isnull([Attestation],0),

						[Audit] = isnull([Audit],0),

						[Bookkeeping] = isnull([Bookkeeping],0),

						[Number of Church Members] = isnull([Number of Church Members],0),
												
                        [# of Clergy] = isnull([# of Clergy],0),

                        [Compilation] = isnull([Compilation],0),

						[Corporate Financial Planning] = isnull([Corporate Financial Planning],0),

						[Corporate Tax] = isnull([Corporate Tax],0),

						[Data Processing] = isnull([Data Processing],0),

						[Elder Care] = isnull([Elder Care],0),

						[# of employees over $100K in salary] = isnull([# of employees over $100K in salary],0),							

                        [Fleet Size] = isnull([Fleet Size],0),

                        [Individual Tax] = isnull([Individual Tax],0),
       
						[Insider Shareholder Percent] = isnull([Insider Shareholder Percent],0),
			   			
                        [MAS Services] = isnull([MAS Services],0),

						[Number of Locations] = isnull([Number of Locations],0),

						[Number of Paid Claims in the last 5 years] = isnull([Number of Paid Claims in the last 5 years],0),
												
						[Num of Buildings > 3 Stories] = isnull([Num of Buildings > 3 Stories],0),
						
						[Number of Full Time Employees] = isnull([Number of Full Time Employees],0),

						[Number of Part Time Employees] = isnull([Number of Part Time Employees],0),
						
						[Number of Temporary Employees] = isnull([Number of Temporary Employees],0),

						[Number of Lease Employees] = isnull([Number of Lease Employees],0),

						[Number of Years in Operation] = isnull([Number of Years in Operation],0),

						[Other Assurance] = isnull([Other Assurance],0),

						[Personal Financial Planning] = isnull([Personal Financial Planning],0),
						
						[Plan Assets] = isnull([Plan Assets],0),

						[Review] = isnull([Review],0),

						[SEC Work] = isnull([SEC Work],0),

                        [Total Claims] = isnull([Total Claims],0),

						[Total Employees] = isnull([Total Employees],0),

                        [Total Number of Rooms] = isnull([Total Number of Rooms],0),
												
						[Total Participants] = isnull([Total Participants],0),

						[Turnover Rate] = isnull([Turnover Rate],0),

                        [Percentage of Occupancy] = isnull([Percentage of Occupancy],0),
	                   								
                        [Year Condo was Built] = isnull([Year Condo was Built],0),
												
                        [Year of Roof update] = isnull([Year of Roof update],0) 
												
 
            FROM        
            (
                  SELECT 
                        pss.PolicyNumber,
                        ugi.UCLGridItemName,
                        --ugd.Status,
						ugd.Number		
                        FROM 
                              PathNet2.dbo.PolicySnapshot pss with (nolock)
                        INNER JOIN
							  PathNet2.dbo.UCLGridData ugd with (nolock)
                        ON
                              pss.TransactionID = ugd.UCLChecklistID
                        INNER JOIN
                              PathNet2.dbo.UCLGridItem ugi with (nolock)
                        ON
                              ugd.UCLGridItemID = ugi.UCLGridItemID    
                       
            ) 
                  as SourceData

            PIVOT
                  (
				SUM(Number)
				
                  FOR 
                  UCLGridItemName IN 
                        (
							[Attestation],    
							[Audit],  
							[Bookkeeping], 
							[Compilation],  
							[Corporate Financial Planning], 
							[Corporate Tax], 
							[Data Processing],
							[Elder Care],    
							[Number of Church Members],
							[Number of Paid Claims in the last 5 years],
                            [# of Clergy],
							[# of employees over $100K in salary],	
							[Individual Tax],  
							[Insider Shareholder Percent],
							[Fleet Size],	
                            [Number of Locations],
                            [Lock-down facilities],
       						[MAS Services],           
                            [Num of Buildings > 3 Stories],
                            [Total Number of Rooms],
							[Number of Full Time Employees],
							[Number of Part Time Employees],
							[Number of Temporary Employees],
							[Number of Lease Employees],
							[Number of Years in Operation],	
							[Total Employees],
							[Other Assurance],
							[Percentage of Occupancy],
							[Personal Financial Planning],
							[Plan Assets],
							[Review],
							[SEC Work],
							[Total Claims],
							[Total Participants],
							[Turnover Rate],
                          	[Year Condo was Built],
                            [Year of Roof update]
                              
                              )
                  ) as PivotTable

      ) as A

      ON
            UW.PolicyNumber = A.PolicyNumber


--**************************************************************************************************
--**************************************************************************************************
--STEP 7
--CALCULATE RANGE FIELDS 

update Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work
set 

	Number_of_Full_Time_Employees_Range = (case
		when Number_of_Full_Time_Employees is null then ''a: No Data''
		when Number_of_Full_Time_Employees = 0 then ''b: No Employees''
		when Number_of_Full_Time_Employees < 50 then ''c: Below 50 Employees''
		when Number_of_Full_Time_Employees <= 100 then ''d: 50 to 100 Employees''
		when Number_of_Full_Time_Employees <= 200 then ''e: 100 to 200 Employees''
		else ''f: greater than 200 Employees''
		end),
	Number_of_Part_Time_Employees_Range = (case
		when Number_of_Part_Time_Employees is null then ''a: No Data''
		when Number_of_Part_Time_Employees = 0 then ''b: No Employees''
		when Number_of_Part_Time_Employees < 50 then ''c: Below 50 Employees''
		when Number_of_Part_Time_Employees <= 100 then ''d: 50 to 100 Employees''
		when Number_of_Part_Time_Employees <= 200 then ''e: 100 to 200 Employees''
		else ''f: greater than 200 Employees''
		end),
	Number_of_Temporary_Employees_Range = (case
		when Number_of_Temporary_Employees is null then ''a: No Data''
		when Number_of_Temporary_Employees = 0 then ''b: No Employees''
		when Number_of_Temporary_Employees < 50 then ''c: Below 50 Employees''
		when Number_of_Temporary_Employees <= 100 then ''d: 50 to 100 Employees''
		when Number_of_Temporary_Employees <= 200 then ''e: 100 to 200 Employees''
		else ''f: greater than 200 Employees''
		end),
	Number_of_Total_Employees_Range = (case
		when Number_of_Total_Employees is null then ''a: No Data''
		when Number_of_Total_Employees = 0 then ''b: No Employees''
		when Number_of_Total_Employees < 50 then ''c: Below 50 Employees''
		when Number_of_Total_Employees <= 100 then ''d: 50 to 100 Employees''
		when Number_of_Total_Employees <= 200 then ''e: 100 to 200 Employees''
		else ''f: greater than 200 Employees''
		end),
	Claims_Past_5yrs_Range = (case
		when Claims_Past_5yrs is null then ''a: No Data''
		when Claims_Past_5yrs = 0 then ''b: zero''
		when Claims_Past_5yrs <= 1 then ''c: 1''
		when Claims_Past_5yrs <= 2 then ''d: 2''
		when Claims_Past_5yrs <= 3 then ''e: 3''
		else ''f: 4 or more''
		end),
	Insider_Shareholder_Percent_Range = 
		(case	when Insider_Shareholder_Percent is null then ''f: N/A''
				when Insider_Shareholder_Percent = 0 then ''a: 0%''
				when Insider_Shareholder_Percent <= 25 then ''b: 0% to 25%''
				when Insider_Shareholder_Percent <= 50 then ''c: 26% to 50%''
				when Insider_Shareholder_Percent <= 85 then ''d: 51% to 85%''
				when Insider_Shareholder_Percent <= 100 then ''d: 85% to 100%''
				else ''f: N/A'' end), 

	Employee_Salary_GT100k_Range = 
	(case	when Employee_Salary_GT100k is null then ''f: N/A''
				when Employee_Salary_GT100k = 0 then ''a: zero''
				when Employee_Salary_GT100k <= 2 then ''b: 1 to 2''
				when Employee_Salary_GT100k <= 5 then ''c: 3 to 5''
				when Employee_Salary_GT100k <= 50 then ''d: 6 to 50''
				when Employee_Salary_GT100k > 50 then ''e: over 50''
				else ''f: N/A'' end),

	Salary_100K_to_Total_Employees_Range = 
	(Case when Employee_Salary_GT100k is null or Number_of_Full_Time_Employees is null  
						or Number_of_Full_Time_Employees = 0 then ''a: no data''
				when Employee_Salary_GT100k / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) = 0 then ''b: 0%''
				when Employee_Salary_GT100k / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) <= 0.05 then ''c: < 5%''
				when Employee_Salary_GT100k / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) <= 0.15 then ''d: 6 to 15%''
				when Employee_Salary_GT100k / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) <= 0.5 then ''e: 15 to 50%''
				else ''f: more than 50%'' end),
	Percent_of_Part_Time_and_Temp_Employees_Range = 
	(Case when Number_of_Full_Time_Employees is null or Number_of_Full_Time_Employees = 0 
					or (Number_of_Part_Time_Employees is null and Number_of_Temporary_Employees is null) then ''a: no data''
				when (isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0))  / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) = 0 then ''b: 0%''
				when (isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0))  / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) <= 0.05 then ''c: < 5%''
				when (isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0))  / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) <= 0.15 then ''d: 6 to 15%''
				when (isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) / (Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0)) <= 0.5 then ''e: 15 to 50%''
				else ''f: more than 50%'' end),
	Employees_SUM_Range = 
		(case	when Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0) is null then ''a: no data''
				when Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0) = 0 then ''b: none''
				when Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0) < 5 then ''c: 1 to 5''
				when Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0) < 50 then ''d: 6 to 50''
				when Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0) < 100 then ''e: 51 to 100''				
				when Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0) < 250 then ''f: 101 to 250''
				when Number_of_Full_Time_Employees + isnull(Number_of_Part_Time_Employees,0) + isnull(Number_of_Temporary_Employees,0) < 500 then ''g: 251 to 500''
				else ''h: 501 and up'' end),
	Plan_Assets_Range =
		(Case when Plan_Assets is null then ''a: no data''
				when Plan_Assets = 0 then ''b: zero''
				when Plan_Assets < 1000000 then ''c: less than $1M''
				when Plan_Assets < 5000000 then ''d: $1M to $5M''
				when Plan_Assets < 10000000 then ''e: $5M to $10M''
				when Plan_Assets < 100000000 then ''f: $10M to $100M''
				else ''g: over $100M'' end),
	Total_Participants_Range = 
		(Case when Total_Participants is null then ''a: no data''
				when Total_Participants = 0 then ''b: zero''
				when Total_Participants < 15 then ''c: less than 15''
				when Total_Participants < 100 then ''d: 15 to 100''
				when Total_Participants < 300 then ''e: 50 to 300''
				else ''f: over 300'' end),
	Number_of_Buildings_Greater_than_3_Stories_Range =
		(case when Number_of_Buildings_Greater_than_3_Stories is null then ''a: No data''
				when Number_of_Buildings_Greater_than_3_Stories  = 0 then ''b: Zero Buildings''
				when Number_of_Buildings_Greater_than_3_Stories < 2 then ''c: 1 or 2 Buildings''
				when Number_of_Buildings_Greater_than_3_Stories < 5 then ''d: 2 to 5 Buildings''
				else ''e: over 5 Buildings'' end),
	Year_Built_Range =
		(case when Year_Condo_Built is null then ''a: No data''
				when Year_Condo_Built < 1980 then ''b: before 1980''
				when Year_Condo_Built < 1985 then ''c: between 1980 and 1984''
				when Year_Condo_Built < 1990 then ''d: between 1985 and 1989''
				else ''e: 1990 and after'' end),
	Year_Roof_Updated_Range =
		(case when Year_Roof_Updated is null then ''a: No data''
				when Year_Roof_Updated < 1989 then ''e: more than 20 years''
				when Year_Roof_Updated < 1999 then ''d: 10 to 20 years''
				when Year_Roof_Updated < 2004 then ''c: 5 to 10 years''
				else ''b: less than 5 years'' end),
	Locations_Range =
		(case when Locations_Num is null or Locations_Num in (0,999) then ''a: No data''
				when Locations_Num = 1 then ''b: 1 Location''
				when Locations_Num < 6 then ''c: 2 to 5 Locations''
				when Locations_Num < 26 then ''d: 6 to 25 Locations''
				else ''e: over 25 Locations'' end),
  	Fleet_Size_Range = 	(case 
		when Fleet_Size is null or 
			Fleet_Size in (0,999) then ''a: No data''
		when Fleet_Size < 25 then ''b: 0 to 25 Vehs''
		when Fleet_Size < 50 then ''c: 26 to 50 Vehs''
		when Fleet_Size < 100 then ''d: 51 to 100 Vehs''
		else ''e: over 100 Vehs'' 
		end),

	Number_of_Rooms_Range =
		(case when Number_of_rooms is null then ''a: No data''
				when Number_of_rooms < 100 then ''b: less than 100 rooms''
				when Number_of_rooms < 200 then ''c: 100 to 200 rooms''
				when Number_of_rooms < 500 then ''d: 200 to 500 rooms''
				else ''e: over 500 rooms'' end),
	Percentage_Occupancy_Range =
		(case when Percentage_Occupancy is null then ''a: No data''
				when Percentage_Occupancy < 60 then ''b: less than 60%''
				when Percentage_Occupancy < 75 then ''c: 60 to 75%''
				when Percentage_Occupancy < 100 then ''d: 75 to 100%''
				else ''e: over 100%'' end),
	Number_of_Lease_Employees_Range = (case
		when Number_of_Lease_Employees is null then ''a: No Data''
		when Number_of_Lease_Employees = 0 then ''b: No Employees''
		when Number_of_Lease_Employees < 50 then ''c: Below 50 Employees''
		when Number_of_Lease_Employees <= 100 then ''d: 50 to 100 Employees''
		when Number_of_Lease_Employees <= 200 then ''e: 100 to 200 Employees''
		else ''f: greater than 200 Employees''
		end),
	Turnover_Rate_Range = (case
		when cast(Turnover_Rate as float) is null then ''a: No Data''
		when cast(Turnover_Rate as float) = 0 then ''b: No Turnover''
		when cast(Turnover_Rate as float) < 25 then ''c: Below 25''
		when cast(Turnover_Rate as float) <= 50 then ''d: 25 to 50''
		when cast(Turnover_Rate as float) <=100 then ''e: 50 to 100''
		else ''f: over 100''
		end),
	Number_of_years_in_Operation_Range = (case 
		when Number_of_years_in_Operation is null then ''a: No Data''
		when Number_of_years_in_Operation = 0 then ''a: No Data''
		when Number_of_years_in_Operation < 5 then ''b: Below 5''
		when Number_of_years_in_Operation <= 10 then ''c: 5 to 10 years''
		when Number_of_years_in_Operation <=25 then ''d: 10 to 25 years''
		else ''e: over 25 years''
		end),
	Clergy_Range =
		(case when Clergy_Num is null or Clergy_Num = 999 then ''a: No data''
					when Clergy_Num = 0 then ''b: No Clergy''
					when Clergy_Num < 4 then ''c: 1 to 3''
					when Clergy_Num < 11 then ''d: 4 to 10''
					else ''e: over 10'' end),
	Church_Members_Range =
		(case when Church_Members_Num is null or Church_Members_Num = 999999 then ''a: No data''
				when Church_Members_Num < 151 then ''b: 0 to 150''
				when Church_Members_Num < 1501 then ''c: 151 to 1,500''
				when Church_Members_Num < 10001 then ''d: 1,501 to 10,000''
				else ''e: over 10,000'' end),
	
	Attestation_Range = (case
		when Attestation_Percent is Null then ''No Data''
		when Attestation_Percent = 0 then ''0''
		when Attestation_Percent < 15 then ''< 15%''
		when Attestation_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Audit_Range = (case
		when Audit_Percent is Null then ''No Data''
		when Audit_Percent = 0 then ''0''
		when Audit_Percent < 15 then ''< 15%''
		when Audit_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Bookkeeping_Range = (case
		when Bookkeeping_Percent is Null then ''No Data''
		when Bookkeeping_Percent = 0 then ''0''
		when Bookkeeping_Percent < 15 then ''< 15%''
		when Bookkeeping_Percent <= 100 then ''> 15%''
		else ''Other''
		end),


	Compilation_Range = (case
		when Compilation_Percent is Null then ''No Data''
		when Compilation_Percent = 0 then ''0''
		when Compilation_Percent < 15 then ''< 15%''
		when Compilation_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Corporate_Financial_Planning_Range = (case
		when Corporate_Financial_Planning_Percent is Null then ''No Data''
		when Corporate_Financial_Planning_Percent = 0 then ''0''
		when Corporate_Financial_Planning_Percent < 15 then ''< 15%''
		when Corporate_Financial_Planning_Percent <= 100 then ''> 15%''
		else ''Other''
		end),
 
	Corporate_Tax_Range = (case
		when Corporate_Tax_Percent is Null then ''No Data''
		when Corporate_Tax_Percent = 0 then ''0''
		when Corporate_Tax_Percent < 15 then ''< 15%''
		when Corporate_Tax_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Data_Processing_Range = (case
		when Data_Processing_Percent is Null then ''No Data''
		when Data_Processing_Percent = 0 then ''0''
		when Data_Processing_Percent < 15 then ''< 15%''
		when Data_Processing_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Individual_Tax_Range = (case
		when Individual_Tax_Percent is Null then ''No Data''
		when Individual_Tax_Percent = 0 then ''0''
		when Individual_Tax_Percent < 15 then ''< 15%''
		when Individual_Tax_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	MAS_Services_Range  = (case
		when MAS_Services_Percent is Null then ''No Data''
		when MAS_Services_Percent = 0 then ''0''
		when MAS_Services_Percent < 15 then ''< 15%''
		when MAS_Services_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Other_Assurance_Range = (case
		when Other_Assurance_Percent is Null then ''No Data''
		when Other_Assurance_Percent = 0 then ''0''
		when Other_Assurance_Percent < 15 then ''< 15%''
		when Other_Assurance_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Personal_Financial_Planning_Range = (case
		when Personal_Financial_Planning_Percent is Null then ''No Data''
		when Personal_Financial_Planning_Percent = 0 then ''0''
		when Personal_Financial_Planning_Percent < 15 then ''< 15%''
		when Personal_Financial_Planning_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	Review_Range = (case
		when Review_Percent is Null then ''No Data''
		when Review_Percent = 0 then ''0''
		when Review_Percent < 15 then ''< 15%''
		when Review_Percent <= 100 then ''> 15%''
		else ''Other''
		end),

	SEC_Work_Range = (case
		when SEC_Work_Percent is Null then ''No Data''
		when SEC_Work_Percent = 0 then ''0''
		when SEC_Work_Percent < 15 then ''< 15%''
		when SEC_Work_Percent <= 100 then ''> 15%''
		else ''Other''
		end)

from Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work

--30 seconds 3/25/2010





update Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work
set Number_of_Swimming_Pools = case
				when Number is not null then Number
				else 99 end
	from Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work UW,
	(
		select PolicyNumber, TransactionID, ProductID, Status, Number from PathNet2.dbo.PolicySnapshot SNAP,
		(
			select UCLGridDataID, UCLChecklistID, DATA.UCLGridItemID, Status, Number
			from PathNet2.dbo.UCLGridData DATA,
			(
				select UCLGridItemID
				from PathNet2.dbo.UCLGridItem
				where UCLGridItemName = ''Do any of the insured locations have a pool?''
			) ITEM
			where DATA.UCLGridItemID = ITEM.UCLGridItemID
		) SNAP2
		where SNAP.TransactionID = SNAP2.UCLChecklistID
	) UCL
	where UW.PolicyNumber = UCL.PolicyNumber

--30 seconds 3-24-2010

update Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work
set 
	Number_of_Swimming_Pools_Range =
		(case when Number_of_Swimming_Pools is null or Number_of_Swimming_Pools = 99 then ''a: No data''
				when Number_of_Swimming_Pools < 1 then ''b: 0 Pools''
				when Number_of_Swimming_Pools = 1 then ''c: 1 Pool''
				when Number_of_Swimming_Pools < 6 then ''c: 2 to 5 Pools''
				else ''e: over 5 Pools'' end)
from  Act_Detailed_Experience.dbo.Policy_Information_Underwriting_Check_List_work

--30 seconds 3-24-2010


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)



' 
END
GO
