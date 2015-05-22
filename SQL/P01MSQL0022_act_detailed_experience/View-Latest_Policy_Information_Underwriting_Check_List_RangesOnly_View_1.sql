IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_Underwriting_Check_List_RangesOnly_View_1]'))
DROP VIEW [dbo].[Latest_Policy_Information_Underwriting_Check_List_RangesOnly_View_1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Latest_Policy_Information_Underwriting_Check_List_RangesOnly_View_1]'))
EXEC dbo.sp_executesql @statement = N'CREATE view dbo.Latest_Policy_Information_Underwriting_Check_List_RangesOnly_View_1
AS
SELECT     accountnumber, policyid, policynumber, policyeffectivedate, [4Years_Hard_Copy_Loss_Runs_YN], Abuse_Molestation_YN, Adoption_YN, Asbestos_Lead_YN, 
                      Athletic_Participants_YN, Board_Experience_YN, Brochures_YN, Builders_Risk_YN, Bylaws_YN, Cafeteria_Restaurant_YN, Camps_YN, CGL_Coverage_YN, 
                      Church_Trips_YN, Class_Operations_YN, Clean_Warranty_Letter_Received_YN, Coastal_Wind_Guides_YN, Completed_ACORD_YN, 
                      Complete_Signed_Application_YN, Completed_Supplemental_Apps_YN, Crisis_Centers_YN, Day_Care_Ops_YN, Diving_Board_YN, Dorms_YN, Drivers_List_YN, 
                      Drivers_Under21_YN, Drivers_Under25_Transport_YN, Drug_Alcohol_Centers_YN, EEO1_Report_Received_YN, Employment_Handbook_YN, 
                      Employment_Policies_YN, Engagement_Letters_YN, Facultative_Reinsurance_Required_YN, Facultative_Spreadsheet_Filled_Out_YN, Financials_YN, 
                      Form_5500_YN, For_Profit_YN, Foster_Care_YN, Full_VIN_Num_YN, Group_Homes_YN, Hail_YN, Headstart_YN, Hired_Exposure_YN, Homeless_Shelters_YN, 
                      Independent_Contractors_YN, Involuntary_Treatment_Programs_YN, Lakes_and_Ponds_YN, Licensed_Professional_Designations_YN, 
                      Life_Safety_Requirements_YN, Limits_ITV_YN, Liquor_Liability_YN, Lockdown_facilities_YN, Loss_Control_Requested_YN, Management_Signoff_YN, 
                      Martial_Arts_YN, Meals_On_Wheels_YN, Mentally_Ill_Impaired_Clients_YN, Mold_YN, More_Than_20Beds_In_One_facility_YN, 
                      More_Than_50percent_GB_From_Single_Client_YN, MVR_Checks_YN, Narrative_from_field_YN, Narrative_WriteUp_of_Account_YN, No_Loss_Letter_Received_YN, 
                      No_Prior_Coverage_YN, Non_Owned_YN, No_Qualified_Peer_Review_YN, Physicians_On_Staff_YN, PIIC_Boiler_YN, Playground_YN, Playground_Equip_YN, 
                      Pool_YN, Prior_Coverage_YN, Rated_Premium_Agrees_with_Binding_Premium_YN, Referred_to_Management_YN, Rental_Prop_YN, Retro_Date_Applies_YN, 
                      Resumes_YN, Risk_Meter_Check_YN, Special_Events_YN, Sports_Activities_YN, Stadiums_YN, Stained_Glass_YN, Standard_Contract_YN, 
                      State_Hospital_Institution_YN, State_Inspection_YN, Subsidiaries_Affiliates_YN, Successful_Peer_Review_YN, Suicide_Hotlines_YN, Suits_For_Fees_YN, 
                      Supp_Claim_Form_Received_YN, Supplemental_Claim_Form_Loss_Run_YN, Tanning_YN, Tennis_Bubble_YN, Tennis_Courts_YN, Umbrella_YN, 
                      UMUIM_State_Issues_YN, Vacant_Buildings_YN, Vacant_Land_YN, Vehicle_Seat_Capacity_YN, Volunteers_YN, Waiver_YN, Weatherization_Programs_YN, 
                      Within_Underwriting_Authority_YN, Women_Shelters_YN, Workshops_YN, Insurance_Programs_For_Members_YN, 
                      Disciplinary_Administrative_or_Criminal_Actions_YN, Disciplinary_Action_from_Peer_Review_YN, Employment_Application_YN, 
                      Employment_Application_Handbook_YN, Information_Only_YN, List_of_D_and_Os_YN, Merger_Acquisition_or_Consolidation_YN, 
                      Peer_Review_or_Disciplinary_Action_YN, Positive_Fund_Balance_YN, Product_Research_or_Development_Testing_Certif_Services_YN, 
                      Proper_Employment_Procedures_YN, Magazines_Periodicals_or_Newsletters_YN, Security_Precautions_YN, 
                      Standard_Setting_or_Member_Certification_Services_YN, Tax_Exempt_YN, Transaction_E_Commerce_YN, Website_Information_Only_YN, 
                      Website_Transactional_E_Commerce_YN, Claims_Past_5yrs_Range, Employee_Salary_GT100k_Range, Insider_Shareholder_Percent_Range, 
                      Employees_SUM_Range, Number_of_Full_Time_Employees_Range, Number_of_Part_Time_Employees_Range, Number_of_Temporary_Employees_Range, 
                      Number_of_Total_Employees_Range, Percent_of_Part_Time_and_Temp_Employees_Range, Plan_Assets_Range, Salary_100K_to_Total_Employees_Range, 
                      Total_Participants_Range, Total_Claims_Range, Number_of_Buildings_Greater_than_3_Stories_Range, Year_Built_Range, Year_Roof_Updated_Range, 
                      Locations_Range, Fleet_Size_Range, Number_of_Rooms_Range, Percentage_Occupancy_Range, Number_of_Lease_Employees_Range, 
                      Number_of_years_in_Operation_Range, Revenue_Gross_Billing_Range, Turnover_Rate_Range, Clergy_Range, Church_Members_Range, Attestation_Range, 
                      Audit_Range, BookKeeping_Range, Compilation_Range, Corporate_Financial_Planning_Range, Corporate_Tax_Range, Data_Processing_Range, 
                      Individual_Tax_Range, MAS_Services_Range, Other_Assurance_Range, Personal_Financial_Planning_Range, Review_Range, SEC_Work_Range, 
                      Number_of_Swimming_Pools_Range, CASE WHEN Elder_Care_Percent IS NULL 
                      THEN ''f: N/A'' WHEN Elder_Care_Percent = 0 THEN ''a: 0%'' WHEN Elder_Care_Percent <= .25 THEN ''b: 0% to 25%'' WHEN Elder_Care_Percent <= .25 THEN ''d: 26% to 50%''
                       WHEN Elder_Care_Percent <= .25 THEN ''d: 51% to 85%'' WHEN Elder_Care_Percent <= .25 THEN ''d: 86% to 100%'' WHEN Elder_Care_Percent <= .25 THEN ''f: N/A'' ELSE
                       ''f: N/A'' END AS Elder_Care_Range
FROM         dbo.Policy_Information_Underwriting_Check_List_June
' 
GO
