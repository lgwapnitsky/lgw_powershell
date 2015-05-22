IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_10b_Average_GL_Rates_Policy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_10b_Average_GL_Rates_Policy]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_10b_Average_GL_Rates_Policy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'










CREATE Procedure [dbo].[usp_Step_10b_Average_GL_Rates_Policy] as

update Detailed_Experience_Run_Log set Start_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[Policy_Information_GL_AVG_RATES_work]'') AND type in (N''U''))
Drop table Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work

select distinct
Policy_Number as Policynumber
into Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work
from Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work



----------------------------------------------------------------------------
--Create temp table for distinct Class_Groups with an index
select distinct Class_Group, CG_Name_Counter = 0
into #Class_Grp_Names
from Act_Detailed_Experience.dbo.GL_Class_Groups CG
where Class_group <> ''blank''

DECLARE @counter int
SET @counter = 0
UPDATE #Class_Grp_Names
SET @counter = CG_Name_Counter = @counter + 1

declare @update_for_class_group varchar(max)
set @update_for_class_group=''UPDATE Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work SET ''

--select * from #Class_Grp_Names 

----------------------------------------------------------------------------
--Use for loop to create variable names for each Class_Group and fill in amounts
declare @i int
set @i = 1
while (@i<= (select max(CG_Name_Counter) from #Class_Grp_Names))
begin

Declare @Class_grp_Name as varchar (50)
set @Class_grp_Name = (select Class_Group from #Class_Grp_Names where @i = CG_Name_Counter)
--''Day Care''


Declare @Class_grp_Field_Name as varchar (50)
set @Class_grp_Field_Name = (
	select distinct top 1 field_name 
	from Act_Detailed_Experience.dbo.GL_Class_Groups CG
	where @Class_grp_Name = CG.Class_Group)

--select @Class_grp_Field_Name

--------------------
--Create list of Classcodes in Class_Group
IF object_id(''tempdb..#Temp_Class_Group_Classes'') IS NOT NULL
drop table #Temp_Class_Group_Classes;

select distinct CGC.Classcode 
into #Temp_Class_Group_Classes
from Act_Detailed_Experience.dbo.GL_Class_Groups CGC
where CGC.Class_Group = @Class_grp_Name

--select * from #Temp_Class_Group_Classes
--------------------
--Create temp table with records having Classcodes in Class_Group
IF object_id(''tempdb..#Temp_Class_Info'') IS NOT NULL
drop table #Temp_Class_Info;

Select *
into #Temp_Class_Info
from Act_Detailed_Experience.dbo.GL_Class_Code_Avg_Rate_ALL_POLICIES_work CLS
where CLS.Class_Code in (select Classcode from #Temp_Class_Group_Classes)

--select *  from #Temp_Class_Info

--------------------
/*
Declare @Class_grp_Name as varchar (50)
set @Class_grp_Name = ''Day Care''
*/
Declare @Execute_add_fields as varchar (1000)
set @Execute_add_fields = ''
ALTER TABLE Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work
add
	[''+@Class_grp_Field_Name+''_Class_Group] [varchar](50),
	[''+@Class_grp_Field_Name+''_Premium] [Float],
	[''+@Class_grp_Field_Name+''_Exposure] [Float],
	[''+@Class_grp_Field_Name+''_Exposure_Adj] [Float],
	[''+@Class_grp_Field_Name+''_Avg_Rate] [Float],
	[''+@Class_grp_Field_Name+''_Avg_Rate_Range] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS
''
--select @execute_add_fields

EXEC(@execute_add_fields)


set @update_for_class_group=@update_for_class_group+ @Class_grp_field_Name+''_Class_Group = ''+char(39)+@Class_grp_Name+char(39)+'', ''+
@Class_grp_field_Name+''_Avg_Rate_Range = case when ''+@Class_grp_field_Name+''_Avg_Rate_Range is null then ''+char(39)+''z: All Other''+CHAR(39)+'' else ''+@Class_grp_field_Name+''_Avg_Rate_Range end,''

Declare @Execute_Update_Rating_fields as varchar (5000)
set @Execute_add_fields = ''
UPDATE Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work
SET
''+@Class_grp_field_Name+''_Premium = CLS.Premium,
''+@Class_grp_field_Name+''_Exposure = CLS.Exposure,
''+@Class_grp_field_Name+''_Exposure_Adj = CLS.Exposure_Adj
from Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work POL
join (select policy_number, sum(Premium) Premium, sum(Exposure) Exposure,
sum(Exposure / Exposure_Adj_Fac) Exposure_Adj
from #Temp_Class_Info group by policy_number) CLS 
on Pol.policynumber=CLS.policy_number
''


EXEC (@Execute_add_fields)

/*
select * from Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work POL
where policynumber = ''PHPK074090''

select * from #Temp_Class_Info
*/

-- Create Temp file with Range info
/*
Declare @Class_grp_Name as varchar (50)
set @Class_grp_Name = ''Day Care''
*/

IF object_id(''tempdb..#Temp_Avg_rate_Range_Info'') IS NOT NULL
drop table #Temp_Avg_rate_Range_Info;

select *
into #Temp_Avg_rate_Range_Info
from (
select top 1 * from Act_Detailed_Experience.dbo.GL_Class_Groups CG
where @Class_grp_Name = CG.Class_Group
) as temp1
--select * from #Temp_Avg_rate_Range_Info



-- Calc Average Rate
/*
Declare @Class_grp_Name as varchar (50)
set @Class_grp_Name = ''Day Care''

Declare @Class_grp_Field_Name as varchar (50)
set @Class_grp_Field_Name = (
	select distinct top 1 field_name 
	from Act_Detailed_Experience.dbo.GL_Class_Groups CG
	where @Class_grp_Name = CG.Class_Group)
*/

Declare @Execute_Update_Avg_Rate as varchar (5000)
set @Execute_Update_Avg_Rate = ''
UPDATE Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work
SET
''+@Class_grp_field_Name+''_Avg_Rate = round(''+@Class_grp_field_Name+''_Premium /''+@Class_grp_field_Name+''_Exposure_Adj,Dec_Places)
from Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work POL,
	#Temp_Avg_rate_Range_Info CG
where ''+@Class_grp_field_Name+''_Exposure_Adj <> 0
''

exec (@Execute_Update_Avg_Rate)


-- Define Rate ranges
/*
select * from Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work POL
where policynumber = ''PHPK079675''
*/
 
--select char(39)
/*
Declare @Class_grp_Name as varchar (50)
set @Class_grp_Name = ''Day Care''

Declare @Class_grp_Field_Name as varchar (50)
set @Class_grp_Field_Name = (
	select distinct top 1 field_name 
	from Act_Detailed_Experience.dbo.GL_Class_Groups CG
	where @Class_grp_Name = CG.Class_Group)
*/
Declare @Dec_Places as varchar (1)
set @Dec_Places = (
	select distinct top 1 dec_places 
	from Act_Detailed_Experience.dbo.GL_Class_Groups CG
	where @Class_grp_field_Name = CG.Field_Name)

declare @greatest float
set @greatest=
(select dbo.fn_greatest(cg.Range_1, isnull(cg.Range_2,0),isnull(cg.Range_3,0),isnull(cg.Range_4,0),isnull(cg.Range_5,0),isnull(cg.Range_6,0),isnull(cg.Range_7,0),isnull(cg.Range_8,0),isnull(cg.Range_9,0),isnull(cg.Range_10,0))
from #Temp_Avg_rate_Range_Info cg)


Declare @Execute_Avg_Rate_Range_1 as varchar (8000)
set @Execute_Avg_Rate_Range_1 =''UPDATE Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work SET ''
	+@Class_grp_field_Name+''_Avg_Rate_Range = (Case
			when CG.Range_1 IS null then ''+char(39)+''a: ALL''+char(39)+''
			when ''+@Class_grp_field_Name+''_Avg_Rate<=CG.Range_1
   				  then ''+char(39)+''a: up to ''+char(39)+''+convert("varchar",convert(decimal(9,1),Range_1))
   				  
   			when ''+@Class_grp_field_Name+''_Avg_Rate>''+cast(@greatest as varchar)+'' then 
   				  case when ''+cast(@greatest as varchar)+''=CG.Range_1 then ''+char(39)+''b''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_2 then ''+char(39)+''c''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_3 then ''+char(39)+''d''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_4 then ''+char(39)+''e''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_5 then ''+char(39)+''f''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_6 then ''+char(39)+''g''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_7 then ''+char(39)+''h''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_8 then ''+char(39)+''i''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_9 then ''+char(39)+''j''+char(39)+''
   					   when ''+cast(@greatest as varchar)+''=CG.Range_10 then ''+char(39)+''k''+char(39)+''
   					else ''+char(39)+''x''+char(39)+'' end + ''+char(39)+'': over ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),''+cast(@greatest as varchar)+''))	
            when CG.Range_1<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_2 
				then ''+char(39)+''b: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_1))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_2))	
            when CG.Range_2<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_3
				then ''+char(39)+''c: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_2))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_3))		
            when CG.Range_3<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_4
				then ''+char(39)+''d: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_3))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_4))
            when CG.Range_4<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_5
				then ''+char(39)+''e: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_4))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_5))
            when CG.Range_5<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_6
				then ''+char(39)+''f: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_5))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_6))
            when CG.Range_6<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_7
				then ''+char(39)+''g: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_6))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_7))
            when CG.Range_7<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_8 
				then ''+char(39)+''h: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_7))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_8))
            when CG.Range_8<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_9
				then ''+char(39)+''i: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_8))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_9))
            when CG.Range_9<''+@Class_grp_field_Name+''_Avg_Rate and  ''+@Class_grp_field_Name+''_Avg_Rate <= CG.Range_10
				then ''+char(39)+''j: ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_9))+
				+''+char(39)+'' to ''+char(39)+''+convert("varchar",convert(decimal(9,''+@Dec_Places+''),Range_10))
else ''+char(39)+''z: All Other''+char(39)+'' end)

from Act_Detailed_Experience.dbo.Policy_Information_GL_AVG_RATES_work POL cross join #Temp_Avg_rate_Range_Info cg
 where ''+@Class_grp_field_Name+''_Avg_Rate is not null''
 
 
exec(@Execute_Avg_Rate_Range_1)


set @i=@i+1
end

set @update_for_class_group=(select SUBSTRING(@update_for_class_group, 1, len(@update_for_class_group)-1))

exec (@update_for_class_group)


update Detailed_Experience_Run_Log set End_Time=GETDATE()
where Step_Name=OBJECT_NAME(@@Procid)
and Run_Month=(select Last_Reporting_Month from Detailed_Experience_Parameters)
and Run_Year=(select Last_Reporting_Year from Detailed_Experience_Parameters)


' 
END
GO
