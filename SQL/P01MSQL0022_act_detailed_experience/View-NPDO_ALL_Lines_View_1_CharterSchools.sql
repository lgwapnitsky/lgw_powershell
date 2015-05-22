IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_ALL_Lines_View_1_CharterSchools]'))
DROP VIEW [dbo].[NPDO_ALL_Lines_View_1_CharterSchools]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[NPDO_ALL_Lines_View_1_CharterSchools]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.NPDO_ALL_Lines_View_1_CharterSchools
AS
SELECT     statecode, Coverage_Reporting_group, productcode, Fiscal_AY_Year, currentwrittenpremium, currentearnedpremium, 
                      Policy_count_Reporting_Coverage, Incurred_Loss_ALAE_with_SS_NonCat, Capped_Incurred_Loss_ALAE_with_SS_wo_cat, 
                      Ult_LDF_Incurred_Loss_ALAE_with_SS_NonCat, Ult_LDF_Capped_Incurred_Loss_ALAE_with_SS_wo_cat, Reported_Claims, Incurred_Claims, 
                      Commission_dollars, Commission_Premiums, New_Renew_Tail, Renew_New_Auto, Branch_Region, program, Written_Premium_Range, 
                      Coverage_Group, product_group, Primary_Umbrella, Earned_Buildings, Earned_Locations, Earned_TIV, GL_Dom_Terr_Description, 
                      GL_Dom_Region_in_State, Primary_Producer, Policy_count_All_Cov_Combined, Account_UltLoss_Ratio_Working_Cover_Range, 
                      Account_RepLoss_Ratio_Working_Cover_Range, Policy_count_Coverage_Group, accountnumber, Primary_Producer_type, 
                      Incurred_Loss_ALAE_with_SS, Capped_Incurred_Loss_ALAE_with_SS, Ult_LDF_Incurred_Loss_ALAE_with_SS, 
                      Ult_LDF_Capped_Inc_Loss_ALAE_with_SS, policynumber, Coverage_Form, Endorsement_Elite_YN, Account_Name, County_Pop_Density_Range, 
                      Branch_Office, COL_Breach_of_Contract_Loss, COL_Discrimination_Loss, COL_Wrongful_Termination_Loss, COL_Harrassment_Loss, 
                      COL_SLD_All_Other_Loss, COL_SLD_All_Other_Count, COL_Harassment_Count, COL_WrongfulTermination_Count, COL_Discrimination_Count, 
                      COL_Breach_of_Contract_Count, First_Policy_Year, Price_Monitor_Standard_Cov_Grp_Monitored_range, COL_DO_Other_Count, COL_DO_Other_Loss, 
                      COL_EPL_Other_Count, COL_EPL_Other_Loss, COL_Fiduciary_Other_Count, COL_Fiduciary_Other_Loss, COL_Worplace_Violence_Other_Count, 
                      COL_Worplace_Violence_Other_Loss, COL_Internet_Other_Count, COL_Internet_Other_Loss, FF_DO_Limit, FF_EPL_Limit, FF_DO_Alt_Retention, 
                      FF_EPL_Num_of_Employees_Range, TrimBusiness_Type, FF_DO_RatingClass, FF_EPL_RatingClass, Financials_YN, 
                      Supplemental_Claim_Form_Loss_Run_YN, Bylaws_YN, Employment_Handbook_YN, Form_5500_YN, FF_EPL_Alt_Retention, 
                      Number_of_Years_in_Operation, Plan_Assets, Turnover_Rate, Plan_Assets_Range, Turnover_Rate_Range, Subsidiaries_Affiliates_YN, 
                      No_Loss_Letter_Received_YN, No_Prior_Coverage_YN, Clean_Warranty_Letter_Received_YN, Supp_Claim_Form_Received_YN, 
                      Website_Transactional_E_Commerce_YN, Website_Information_Only_YN, Transaction_E_Commerce_YN, Tax_Exempt_YN, 
                      Standard_Setting_or_Member_Certification_Services_YN, Security_Precautions_YN, Magazines_Periodicals_or_Newsletters_YN, 
                      Proper_Employment_Procedures_YN, Product_Research_or_Development_Testing_Certif_Services_YN, Positive_Fund_Balance_YN, 
                      Peer_Review_or_Disciplinary_Action_YN, Merger_Acquisition_or_Consolidation_YN, List_of_D_and_Os_YN, Information_Only_YN, 
                      Employment_Application_Handbook_YN, Employment_Application_YN, Disciplinary_Action_from_Peer_Review_YN, 
                      Disciplinary_Administrative_or_Criminal_Actions_YN, Insurance_Programs_For_Members_YN, Last_Reporting_Year, Last_Reporting_Month, 
                      Fiscal_AY_Month_Ending, ProductType, DivisionName, BusinessClassDesc, Source_Detail_Name, PIC_Producer, underwriter, EPL_Limit_int, 
                      FF_DO_Alt_Retention_int, FF_EPL_Alt_Retention_int, FF_EPL_Limit_int, Written_Premium_Range_for_Product, policyEffectivedate, 
                      policyexpirationdate, Latest_PY, policy_effective_month, policy_effective_year
FROM         dbo.NPDO_ALL_Lines_View_1
WHERE     (accountnumber IN (80165073, 91194, 80593622, 70850, 80597600, 80626737, 80589928, 43379, 80573696, 78932798, 80595929, 40078, 80604920, 
                      78833367, 78804698, 78940979, 78839376, 78842899, 78945700, 78839377, 96192, 78956467, 78951183, 80469029, 80608509, 80379324, 80609160, 
                      80420214, 79108654, 80633930, 110732, 22161, 78953905, 79314485, 75664, 79177474, 80154124, 80399440, 78806271, 78804978, 79417449, 
                      79030031, 80629044, 80625651, 78112, 79007255, 79173875, 80598202, 80627182, 78978950, 78944999, 79031473, 79262256, 80339863, 80386661, 
                      80628924, 11492, 79273505, 80631261, 78960504, 78842976, 80618464, 78967566, 78842608, 40327, 80608971, 78965828, 78842609, 80393628, 
                      80181484, 80614644, 78958257, 80152444, 78846629, 80611523, 79056953, 78967580, 80638704, 80065714, 80441142, 78848528, 80362140, 42531, 
                      80600627, 80614625, 78839557, 80629219, 80625653, 18384, 80602895, 80626853, 80615786, 80620823, 80618421, 80633487, 80625642, 79062529, 
                      80617642, 26985, 80607804, 80627371, 79247441, 79075003, 72157, 79074341, 80594625, 80625809, 41481, 80641326, 80626616, 78844322, 
                      79077193, 80039168, 80613025, 78804789, 80043670, 80634861, 78959045, 80585787, 80627572, 80048763, 80638914, 80608888, 80115841, 
                      80623328, 80543732, 80626641, 78807688, 41626, 78932612, 78806644, 102879, 79225847, 80305832, 80627570, 80607586, 79194265, 80595899, 
                      79415780, 86545, 80122297, 78811867, 80580170, 80481359, 80607411, 79165736, 80628933, 80626855, 80490963, 101558, 78343, 80618408, 
                      80622850, 79239568, 79112289, 80626845, 18555, 44699, 79317657, 79544237, 80604773, 80629395, 76739, 80625647, 103859, 80622855, 
                      79235439, 80615774, 78809754, 97606, 79223553, 79130883, 85571, 79281076, 80617413, 96374, 41603, 80626860, 79439326, 79632452, 80629214, 
                      80623340, 78967893, 57726, 78843237, 78955558, 80625638, 80569129, 80366756, 80334565, 79151480, 78809495, 79369996, 78956444, 78959307, 
                      79850460, 79956507, 80376630, 80396184, 79327041, 80404609, 80378638, 80608645, 80597666, 78807636, 80617948, 79208034, 76138, 79393778, 
                      22530, 98711, 80637118, 80059461, 80569880, 80101757, 78845780, 78977692, 79191150, 78969992, 78809506, 97782, 80321897, 27298, 98723, 
                      80121403, 79888175, 80414688, 94892, 80410220, 80408022, 80407994, 80410263, 44580, 44580, 98538, 80410179, 79101532, 80397009, 78969709, 
                      79345406, 78945228, 22840, 80420718, 78810867, 80408050, 101278, 80423797, 78970050, 80408025, 80407999, 78847528, 80396436, 78809756, 
                      80406948, 78817309, 80408032, 78974339, 44196, 27909, 80637327, 97912, 80357537, 78809748, 78849895, 78848316, 44820, 79290861, 18713, 
                      44829, 80639489, 80016926, 78810446, 80139855, 27647, 44321, 76058, 98893, 78841877, 45710, 80135124, 60729, 44286, 80658913, 80665054, 
                      78985832, 80027512, 62522, 28025, 80140564, 78836612, 78920053, 78848306, 78908202, 79187603, 78850594, 80165510, 78809227, 80667861, 
                      43503, 110581, 78848005, 79368910, 78849896, 100228, 80361289, 78990792, 78850374, 100176, 80672012, 80143624, 78981723, 78982042, 44692, 
                      80413417, 78991196, 78981722, 78744, 79745304, 78856652, 80424945, 27814, 80428169, 78981712, 46153, 46137, 91262, 78851237, 82352, 76423, 
                      78983608, 79059680, 78992764, 80718774, 62074, 79270838, 80426823, 99714, 79356613, 79749, 78649, 78983631, 80116648, 80376685, 44702, 
                      80415286, 99991, 99503, 62478, 78852310, 78857855, 79496641, 100646, 45728, 23569, 78852294, 28322, 102005, 102005, 61704, 78991338, 
                      102287, 80694096, 80645, 18934, 27121, 78810811, 45714, 79250085, 79081175, 101355, 102642, 62758, 78837431, 80158276, 80133909, 78857231, 
                      80755041, 23797, 27805, 80404209, 78968498, 78813717, 78848545, 78856469, 78993522, 79869931, 78858059, 78997666, 80033302, 78859441, 
                      78999215, 80771005, 79179158, 78999882, 79002141, 79002692, 80474984, 79560435, 80776977, 79406129, 49185, 24627, 83639, 84718, 79019367, 
                      79495461, 85570, 80819739, 80282169, 78877433, 78881274, 40022, 80494471, 79164163, 78823879, 84006, 79367704, 78985530, 80451615, 
                      80361606, 78823323, 78901174, 78823076, 80226, 80785365, 80287415, 80283452, 78827951))
' 
GO
