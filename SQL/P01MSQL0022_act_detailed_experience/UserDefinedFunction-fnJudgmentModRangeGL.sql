IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnJudgmentModRangeGL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnJudgmentModRangeGL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnJudgmentModRangeGL]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION dbo.fnJudgmentModRangeGL(@Portion float,@Monitored float)
RETURNS NVARCHAR(50)
As
BEGIN
DECLARE @fnJudgmentModRangeGL nvarchar(50)
SET	@fnJudgmentModRangeGL = 
		(Case when @Portion >= .95
				or @Portion <= 1.05
			then (Case
				when @Monitored is NULL then ''a: No Data''
				when @Monitored < .80 then ''b: <.80 Judgment Mod''
				when @Monitored < .95 then ''c: .80 to .95 Judgment Mod''
				when @Monitored < 1.05 then ''d: .95 to 1.05 Judgment Mod''
				when @Monitored < 1.20 then ''e: 1.05 to 1.20 Judgment Mod''
				else ''f: 1.20 or more Judgment Mod''
				end)
			else ''a: No Data'' end)

RETURN(@fnJudgmentModRangeGL)
END;



--Price_Monitor_Standard_CovGrp_GL_Monitored_range
--Price_Monitor_Standard_CovGrp_GL_Monitored' 
END

GO
