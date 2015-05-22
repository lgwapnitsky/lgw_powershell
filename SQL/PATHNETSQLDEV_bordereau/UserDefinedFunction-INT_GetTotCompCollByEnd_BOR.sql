IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetTotCompCollByEnd_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[INT_GetTotCompCollByEnd_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetTotCompCollByEnd_BOR]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
--select top 10 * from phlydev8.accessphly_qa.dbo.policy where Policynumber like ''gd%''
--select dbo.INT_GetTotCompCollByEnd_BOR (''GD13333686-0'','''','''','''')

CREATE        FUNCTION [dbo].[INT_GetTotCompCollByEnd_BOR] 
	(@Policy varchar(15),
         @End_num varchar(15),
         @DateIssue varchar(15),
         @DateEff varchar(15),
         @TRANSDATE  varchar(15)     --fpt#5599
         )
RETURNS varchar(15)
AS
BEGIN
  Declare @totcompcoll decimal(10,2) 



select @totcompcoll = total_comp_coll from 
(
Select POLICY_NUM,
       ENDORSEMNT,
       DATE_ISSUE,
       Sum(amt_comp) amt_comp,
       Sum(amt_coll) amt_coll , 
       sum(amt_comp + amt_coll) as total_comp_coll        
from 
(
SELECT
   POLICY_NUM,
   ltrim(rtrim(ENDORSEMNT)) as ENDORSEMNT,   --fpt# 5599
   DATE_ISSUE,	
   amt_comp = 
   CASE 
     WHEN isnumeric(amt_comp_01) = 1 THEN CAST (amt_comp_01 as decimal(10,2)) 
     ELSE 0.0
   END ,
   amt_coll = 
   CASE 
     WHEN isnumeric(amt_coll_01) = 1 THEN CAST (amt_coll_01 as decimal(10,2)) 
     ELSE 0.0
   END ,
  amt_comp_01, 
  amt_coll_01
  from grundy_vehicle (nolock)
   where
   POLICY_NUM = @Policy
   and
   ltrim(rtrim(ENDORSEMNT)) = ltrim(rtrim(@End_num))    --fpt# 5599
   and	
   DATE_ISSUE = @DateIssue
   and
   EFFECT_DATE = @DateEff
   and
   TransDate=@TRANSDATE       --fpt# 5599            
  ) xyz
group by    POLICY_NUM,
   ENDORSEMNT,
   DATE_ISSUE
) xxx

  if @totcompcoll is null
  	select @totcompcoll = 0.0

  RETURN cast(@totcompcoll as varchar(15))

END
' 
END

GO
