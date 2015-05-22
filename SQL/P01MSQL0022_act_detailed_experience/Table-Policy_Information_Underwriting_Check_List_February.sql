IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Underwriting_Check_List_February]') AND type in (N'U'))
DROP TABLE [dbo].[Policy_Information_Underwriting_Check_List_February]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Underwriting_Check_List_February]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy_Information_Underwriting_Check_List_February](
	[accountnumber] [int] NULL,
	[policyid] [int] NULL,
	[policynumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[policyeffectivedate] [datetime] NULL,
	[4Years_Hard_Copy_Loss_Runs_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Abuse_Molestation_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Adoption_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Asbestos_Lead_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Athletic_Participants_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Board_Experience_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Brochures_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Builders_Risk_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Bylaws_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cafeteria_Restaurant_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Camps_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CGL_Coverage_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Church_Trips_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Class_Operations_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Clean_Warranty_Letter_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Coastal_Wind_Guides_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Completed_ACORD_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Complete_Signed_Application_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Completed_Supplemental_Apps_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Crisis_Centers_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day_Care_Ops_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Diving_Board_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Dorms_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Drivers_List_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Drivers_Under21_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Drivers_Under25_Transport_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Drug_Alcohol_Centers_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EEO1_Report_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Handbook_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Policies_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Engagement_Letters_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Facultative_Reinsurance_Required_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Facultative_Spreadsheet_Filled_Out_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Financials_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Form_5500_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[For_Profit_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Foster_Care_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Full_VIN_Num_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group_Homes_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Hail_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Headstart_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Hired_Exposure_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Homeless_Shelters_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Independent_Contractors_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Involuntary_Treatment_Programs_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lakes_and_Ponds_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Licensed_Professional_Designations_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Life_Safety_Requirements_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Limits_ITV_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Liquor_Liability_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lockdown_facilities_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Loss_Control_Requested_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Management_Signoff_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Martial_Arts_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Meals_On_Wheels_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mentally_Ill_Impaired_Clients_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mold_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[More_Than_20Beds_In_One_facility_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[More_Than_50percent_GB_From_Single_Client_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MVR_Checks_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Narrative_from_field_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Narrative_WriteUp_of_Account_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Loss_Letter_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Prior_Coverage_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Non_Owned_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[No_Qualified_Peer_Review_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Physicians_On_Staff_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PIIC_Boiler_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Playground_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Playground_Equip_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Pool_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Prior_Coverage_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rated_Premium_Agrees_with_Binding_Premium_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Referred_to_Management_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rental_Prop_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Retro_Date_Applies_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Resumes_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Risk_Meter_Check_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Special_Events_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sports_Activities_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stadiums_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stained_Glass_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Standard_Contract_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State_Hospital_Institution_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State_Inspection_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Subsidiaries_Affiliates_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Successful_Peer_Review_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Suicide_Hotlines_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Suits_For_Fees_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Supp_Claim_Form_Received_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Supplemental_Claim_Form_Loss_Run_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tanning_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tennis_Bubble_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tennis_Courts_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Umbrella_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UMUIM_State_Issues_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vacant_Buildings_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vacant_Land_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Vehicle_Seat_Capacity_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Volunteers_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Waiver_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Weatherization_Programs_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Within_Underwriting_Authority_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Women_Shelters_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Workshops_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insurance_Programs_For_Members_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Disciplinary_Administrative_or_Criminal_Actions_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Disciplinary_Action_from_Peer_Review_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Application_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employment_Application_Handbook_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Information_Only_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[List_of_D_and_Os_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Merger_Acquisition_or_Consolidation_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Peer_Review_or_Disciplinary_Action_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Positive_Fund_Balance_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Product_Research_or_Development_Testing_Certif_Services_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Proper_Employment_Procedures_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Magazines_Periodicals_or_Newsletters_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Security_Precautions_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Standard_Setting_or_Member_Certification_Services_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tax_Exempt_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_E_Commerce_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website_Information_Only_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website_Transactional_E_Commerce_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Auto_Facultative_Reinsurance_Bound_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Composite_Rated_Auto_YN] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Attestation_Percent] [decimal](18, 6) NULL,
	[Audit_Percent] [decimal](18, 6) NULL,
	[Bookkeeping_Percent] [decimal](18, 6) NULL,
	[Church_Members_Num] [decimal](18, 6) NULL,
	[Claims_Past_5Yrs] [decimal](18, 6) NULL,
	[Clergy_Num] [decimal](18, 6) NULL,
	[Compilation_Percent] [decimal](18, 6) NULL,
	[Corporate_Financial_Planning_Percent] [decimal](18, 6) NULL,
	[Corporate_Tax_Percent] [decimal](18, 6) NULL,
	[Data_Processing_Percent] [decimal](18, 6) NULL,
	[Elder_Care_Percent] [decimal](18, 6) NULL,
	[Employee_Salary_GT100k] [decimal](18, 6) NULL,
	[Fleet_Size] [decimal](18, 6) NULL,
	[Individual_Tax_Percent] [decimal](18, 6) NULL,
	[Insider_Shareholder_Percent] [decimal](18, 6) NULL,
	[Locations_Num] [decimal](18, 6) NULL,
	[MAS_Services_Percent] [decimal](18, 6) NULL,
	[Number_of_Buildings_Greater_than_3_Stories] [decimal](18, 6) NULL,
	[Number_of_Full_Time_Employees] [decimal](18, 6) NULL,
	[Number_of_Part_Time_Employees] [decimal](18, 6) NULL,
	[Number_of_Temporary_Employees] [decimal](18, 6) NULL,
	[Number_of_Total_Employees] [decimal](18, 6) NULL,
	[Number_of_Lease_Employees] [decimal](18, 6) NULL,
	[Number_of_Rooms] [decimal](18, 6) NULL,
	[Number_of_Years_in_Operation] [decimal](18, 6) NULL,
	[Other_Assurance_Percent] [decimal](18, 6) NULL,
	[Percentage_Occupancy] [decimal](18, 6) NULL,
	[Personal_Financial_Planning_Percent] [decimal](18, 6) NULL,
	[Plan_Assets] [decimal](18, 6) NULL,
	[Review_Percent] [decimal](18, 6) NULL,
	[SEC_Work_Percent] [decimal](18, 6) NULL,
	[Total_Claims] [decimal](18, 6) NULL,
	[Total_Participants] [decimal](18, 6) NULL,
	[Turnover_Rate] [decimal](18, 6) NULL,
	[Year_Condo_Built] [decimal](18, 6) NULL,
	[Year_Roof_Updated] [decimal](18, 6) NULL,
	[Skilled_Nursing_Percentage] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Claims_Past_5yrs_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employee_Salary_GT100k_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Insider_Shareholder_Percent_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Employees_SUM_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Full_Time_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Part_Time_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Temporary_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Total_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Percent_of_Part_Time_and_Temp_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Plan_Assets_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Salary_100K_to_Total_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total_Participants_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total_Claims_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Buildings_Greater_than_3_Stories_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Year_Built_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Year_Roof_Updated_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Locations_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fleet_Size_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Rooms_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Percentage_Occupancy_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Lease_Employees_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_years_in_Operation_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Revenue_Gross_Billing_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Turnover_Rate_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Clergy_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Church_Members_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Attestation_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Audit_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BookKeeping_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Compilation_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Corporate_Financial_Planning_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Corporate_Tax_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Data_Processing_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Individual_Tax_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MAS_Services_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Other_Assurance_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Personal_Financial_Planning_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Review_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SEC_Work_Range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Number_of_Swimming_Pools] [float] NULL,
	[Number_of_Swimming_Pools_Range] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Policy_Information_Underwriting_Check_List_February]') AND name = N'IX_policynumber')
CREATE NONCLUSTERED INDEX [IX_policynumber] ON [dbo].[Policy_Information_Underwriting_Check_List_February]
(
	[policynumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
