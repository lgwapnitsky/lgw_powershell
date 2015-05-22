IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_2a_Claim_Information]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_2a_Claim_Information]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_2a_Claim_Information]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'











CREATE procedure [dbo].[usp_Step_2a_Claim_Information] as



update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

--- Create Base Claim Information Table
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[ALL_CLAIMS_12_Information_1_work]'') AND type in (N''U''))
drop table Act_Detailed_Experience.dbo.ALL_CLAIMS_12_Information_1_work;


select
	claim_number,
	 cast(max(Incurred_Loss) as float) as Max_Incurred_Loss
	into #Loss_Datamart_Info
from (
	select 
		claim_number,
		acct_year,
		acct_mm,
		sum(tot_Case+tot_CLAE+tot_PdLoss+tot_PdLAE+tot_salv+tot_subro) as Incurred_Loss
	from Losshistory.dbo.loss_datamart
	group by claim_number, acct_year, acct_mm
	) as temp1
group by claim_number



select
	claim_number,
	acct_mm, 
	(acct_year-YEAR(curr_date_of_loss))*12 as aging_months,
	cast(sum(
		isnull(tot_Case,0)
		+isnull(tot_CLAE,0)
		+isnull(tot_PdLoss,0)
		+isnull(tot_PdLAE,0)
		+isnull(tot_salv,0)
		+isnull(tot_subro,0)) as float) as Incurred_Loss into #Loss_Datamart_Info_prior
from Losshistory.dbo.loss_datamart
where acct_mm in (3,6,12)
group by claim_number, acct_mm, (acct_year-YEAR(curr_date_of_loss))*12

select
	claim_number as Claimnumber,
	policy_number as policynumber,
	Accident_Year,
	Accident_Month,
	product as productcode,
	Exp_product as Experienceproduct,
	Coverage_Group,
	Coverage_Reporting_group,
	sum(Incurred_Loss_ALAE_with_SS) as Incurred_Loss_ALAE_with_SS
 into #claims_source
from Act_Detailed_Experience.dbo.ALL_POLICIES_12_Detail_Information_1_work
group by 
	claim_number,
	policy_number,
	Accident_Year,
	Accident_Month,
	product,
	Exp_product,
	Coverage_Group,
	Coverage_Reporting_group
	
/*The acct_mms below do not change across processing months, per actuarial. */

select Claimnumber,
	policynumber,
	Accident_Year,
	Accident_Month,
	productcode,
	Experienceproduct,
	Coverage_Group,
	Coverage_Reporting_group,
	Incurred_Loss_ALAE_with_SS,
	
	sum(case when LDP.acct_mm=6 and LDP.aging_months=0 then LDP.Incurred_Loss else null end) as Incurred_Loss_6_months,
	sum(case when LDP.acct_mm=6 and LDP.aging_months=12 then LDP.Incurred_Loss else null end) as Incurred_Loss_18_months,
	sum(case when LDP.acct_mm=6 and LDP.aging_months=24 then LDP.Incurred_Loss else null end) as Incurred_Loss_30_months,
	
	sum(case when LDP.acct_mm=3 and LDP.aging_months=0 then LDP.Incurred_Loss else null end) as Incurred_Loss_3_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=12 then LDP.Incurred_Loss else null end) as Incurred_Loss_15_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=24 then LDP.Incurred_Loss else null end) as Incurred_Loss_27_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=36 then LDP.Incurred_Loss else null end) as Incurred_Loss_39_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=48 then LDP.Incurred_Loss else null end) as Incurred_Loss_51_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=60 then LDP.Incurred_Loss else null end) as Incurred_Loss_63_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=72 then LDP.Incurred_Loss else null end) as Incurred_Loss_75_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=84 then LDP.Incurred_Loss else null end) as Incurred_Loss_87_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=96 then LDP.Incurred_Loss else null end) as Incurred_Loss_99_months,
	sum(case when LDP.acct_mm=3 and LDP.aging_months=108 then LDP.Incurred_Loss else null end) as Incurred_Loss_111_months,
	
	sum(case when LDP.acct_mm=12 and LDP.aging_months=0 then LDP.Incurred_Loss else null end) as Incurred_Loss_12_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=12 then LDP.Incurred_Loss else null end) as Incurred_Loss_24_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=24 then LDP.Incurred_Loss else null end) as Incurred_Loss_36_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=36 then LDP.Incurred_Loss else null end) as Incurred_Loss_48_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=48 then LDP.Incurred_Loss else null end) as Incurred_Loss_60_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=60 then LDP.Incurred_Loss else null end) as Incurred_Loss_72_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=72 then LDP.Incurred_Loss else null end) as Incurred_Loss_84_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=84 then LDP.Incurred_Loss else null end) as Incurred_Loss_96_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=96 then LDP.Incurred_Loss else null end) as Incurred_Loss_108_months,
	sum(case when LDP.acct_mm=12 and LDP.aging_months=108 then LDP.Incurred_Loss else null end) as Incurred_Loss_120_months
into #claims_source_with_incurred_loss
from #claims_source CL
left join #Loss_Datamart_Info_prior LDP
on LDP.Claim_number = CL.claimnumber 

group by 	Claimnumber,
	policynumber,
	Accident_Year,
	Accident_Month,
	productcode,
	Experienceproduct,
	Coverage_Group,
	Coverage_Reporting_group,
	Incurred_Loss_ALAE_with_SS
	

/*Acct_mms 6, 18 and 30 do not have capped fields, as they have not been requested by actuarial. */

select Claimnumber,
	policynumber,
	Accident_Year,
	Accident_Month,
	productcode,
	Experienceproduct,
	Coverage_Group,
	Coverage_Reporting_group,
	Incurred_Loss_ALAE_with_SS,
	
	cast((
	Case
	when Incurred_Loss_ALAE_with_SS = 0 then ''a: 0''
	when Incurred_Loss_ALAE_with_SS <= 1000 then ''b: 1 to 1,000''
	when Incurred_Loss_ALAE_with_SS <= 20000 then ''c: 1,000 to 20,000''
	when Incurred_Loss_ALAE_with_SS <= 50000 then ''d: 20,000 to 50,000''
	when Incurred_Loss_ALAE_with_SS <= 100000 then ''e: 50,000 to 100,000''
	when Incurred_Loss_ALAE_with_SS <= 500000 then ''f: 100,000 to 500,000''
	when Incurred_Loss_ALAE_with_SS <= 1000000 then ''g: 500,000 to 1,000,000''
	when Incurred_Loss_ALAE_with_SS > 1000000 then ''h: over 1,000,000''
	else ''z: no data''
	end) as varchar(50)) as
	Claim_Incurred_Loss_Range,
	LD.Max_Incurred_Loss as Max_Incurred_Loss,
	cast((Case
	when LD.Max_Incurred_Loss = 0 then ''a: 0''
	when LD.Max_Incurred_Loss <= 1000 then ''b: 1 to 1,000''
	when LD.Max_Incurred_Loss <= 20000 then ''c: 1,000 to 20,000''
	when LD.Max_Incurred_Loss <= 50000 then ''d: 20,000 to 50,000''
	when LD.Max_Incurred_Loss <= 100000 then ''e: 50,000 to 100,000''
	when LD.Max_Incurred_Loss <= 500000 then ''f: 100,000 to 500,000''
	when LD.Max_Incurred_Loss <= 1000000 then ''g: 500,000 to 1,000,000''
	when LD.Max_Incurred_Loss > 1000000 then ''h: over 1,000,000''
	else ''z: no data''
	end) as [varchar] (50)) as Max_Incurred_Loss_Range,
	
	Incurred_Loss_6_months,
	Incurred_Loss_18_months,
	Incurred_Loss_30_months,
	
	Incurred_Loss_3_months,
	Incurred_Loss_15_months,
	Incurred_Loss_27_months,
	Incurred_Loss_39_months,
	Incurred_Loss_51_months,
	Incurred_Loss_63_months,
	Incurred_Loss_75_months,
	Incurred_Loss_87_months,
	Incurred_Loss_99_months,
	Incurred_Loss_111_months,
	
	Incurred_Loss_12_months,
	Incurred_Loss_24_months,
	Incurred_Loss_36_months,
	Incurred_Loss_48_months,
	Incurred_Loss_60_months,
	Incurred_Loss_72_months,
	Incurred_Loss_84_months,
	Incurred_Loss_96_months,
	Incurred_Loss_108_months,
	Incurred_Loss_120_months,
	
	(case when Incurred_Loss_3_months > 250000 then 250000 else Incurred_Loss_3_months end) as Capped_Incurred_Loss_3_months,
	(case when Incurred_Loss_15_months > 250000 then 250000 else Incurred_Loss_15_months end) as Capped_Incurred_Loss_15_months,
	(case when Incurred_Loss_27_months > 250000 then 250000 else Incurred_Loss_27_months end) as Capped_Incurred_Loss_27_months,
	(case when Incurred_Loss_39_months > 250000 then 250000 else Incurred_Loss_39_months end) as Capped_Incurred_Loss_39_months,
	(case when Incurred_Loss_51_months > 250000 then 250000 else Incurred_Loss_51_months end) as Capped_Incurred_Loss_51_months,
	(case when Incurred_Loss_63_months > 250000 then 250000 else Incurred_Loss_63_months end) as Capped_Incurred_Loss_63_months,
	(case when Incurred_Loss_75_months > 250000 then 250000 else Incurred_Loss_75_months end) as Capped_Incurred_Loss_75_months,
	(case when Incurred_Loss_87_months > 250000 then 250000 else Incurred_Loss_87_months end) as Capped_Incurred_Loss_87_months,
	(case when Incurred_Loss_99_months > 250000 then 250000 else Incurred_Loss_99_months end) as Capped_Incurred_Loss_99_months,
	(case when Incurred_Loss_111_months > 250000 then 250000 else Incurred_Loss_111_months end) as Capped_Incurred_Loss_111_months,
	
	(case when Incurred_Loss_12_months > 250000 then 250000 else Incurred_Loss_12_months end) as Capped_Incurred_Loss_12_months,
	(case when Incurred_Loss_24_months > 250000 then 250000 else Incurred_Loss_24_months end) as Capped_Incurred_Loss_24_months,
	(case when Incurred_Loss_36_months > 250000 then 250000 else Incurred_Loss_36_months end) as Capped_Incurred_Loss_36_months,
	(case when Incurred_Loss_48_months > 250000 then 250000 else Incurred_Loss_48_months end) as Capped_Incurred_Loss_48_months,
	(case when Incurred_Loss_60_months > 250000 then 250000 else Incurred_Loss_60_months end) as Capped_Incurred_Loss_60_months,
	(case when Incurred_Loss_72_months > 250000 then 250000 else Incurred_Loss_72_months end) as Capped_Incurred_Loss_72_months,
	(case when Incurred_Loss_84_months > 250000 then 250000 else Incurred_Loss_84_months end) as Capped_Incurred_Loss_84_months,
	(case when Incurred_Loss_96_months > 250000 then 250000 else Incurred_Loss_96_months end) as Capped_Incurred_Loss_96_months,
	(case when Incurred_Loss_108_months > 250000 then 250000 else Incurred_Loss_108_months end) as Capped_Incurred_Loss_108_months,
	(case when Incurred_Loss_120_months > 250000 then 250000 else Incurred_Loss_120_months end) as Capped_Incurred_Loss_120_months
	
into   Act_Detailed_Experience.dbo.ALL_CLAIMS_12_Information_1_work
from #claims_source_with_incurred_loss CL
left join #Loss_Datamart_Info LD
on LD.Claim_number = CL.claimnumber    


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)







' 
END
GO
