IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_24_View_Updates]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Step_24_View_Updates]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Step_24_View_Updates]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE procedure [dbo].[usp_Step_24_View_Updates]

as

-- FootPrints Ticket #65106
-- Creator:	Erik Godfrey
-- Date: 1/18/2013
-- Description: Update views to point to most recent monthly tables

-- FootPrints Ticket #71987
-- Creator:	Steven Breisch
-- Date: 4/23/2013
-- Description: Added 7 new views to the process

set nocount on

declare @PrevMonth varchar(15)
declare @CurMonth varchar(15)
declare @SQLString nvarchar(max)

set @PrevMonth = (select datename(m,convert(date,convert(char,case when Last_Reporting_Month = 1 then 12
                                                                   else Last_Reporting_Month-1
                                                              end)+''/1/1900'',101))
                  from Act_Detailed_Experience.dbo.Detailed_Experience_Parameters)

set @CurMonth = (select datename(m,convert(date,convert(char,Last_Reporting_Month)+''/1/1900'',101))
                 from Act_Detailed_Experience.dbo.Detailed_Experience_Parameters)

-- Policy_Information_ALL_POLICIES_Current

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Policy_Information_ALL_POLICIES_Current'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_All_Lines_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_All_Lines_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_All_Lines_Losses_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_All_Lines_Losses_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- ALL_POLICIES_12_Detail_Information_1_Latest_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.ALL_POLICIES_12_Detail_Information_1_Latest_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- ALL_POLICIES_12_premium_summary_Latest_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.ALL_POLICIES_12_premium_summary_Latest_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_AE_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_AE_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_ALL_POLICIES_AUTO_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_ALL_POLICIES_AUTO_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_ALL_POLICIES_FireAllied_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_ALL_POLICIES_GL_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_ALL_POLICIES_GL_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_CL_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_CL_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_FF_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_FF_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_GL_AVG_RATES_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_GL_AVG_RATES_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_information_PVCD_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_information_PVCD_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_Underwriting_Check_List_View_1

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_Underwriting_Check_List_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_ALL_POLICIES_12_Detail_Information_1_View_1     Added 4/23/2013

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_ALL_POLICIES_12_Detail_Information_1_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_ALL_POLICIES_12_premium_summary_View_1     Added 4/23/2013

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_ALL_POLICIES_12_premium_summary_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_AE_RangesOnly_View_1     Added 4/23/2013

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_AE_RangesOnly_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_ALL_POLICIES_View_1     Added 4/23/2013

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_ALL_POLICIES_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1     Added 4/23/2013

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_GL_AVG_RATES_RangesOnly_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Information_Underwriting_Check_List_RangesOnly_View_1     Added 4/23/2013

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Information_Underwriting_Check_List_RangesOnly_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

-- Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1     Added 4/23/2013

set @SQLString = (select replace(replace(object_definition(object_id(''dbo.Latest_Policy_Product_State_Coverage_Data_ALL_POLICIES_View_1'')),''_''+@PrevMonth,''_''+@CurMonth),''create view'',''alter view''))

exec sp_executesql @SQLString

set nocount off


' 
END
GO
