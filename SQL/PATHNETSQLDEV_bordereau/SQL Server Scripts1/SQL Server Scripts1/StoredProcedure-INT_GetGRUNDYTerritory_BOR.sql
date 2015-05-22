IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYTerritory_BOR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[INT_GetGRUNDYTerritory_BOR]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INT_GetGRUNDYTerritory_BOR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
/****** Object:  Stored Procedure dbo.INT_GetGRUNDYTerritory_BOR    Script Date: 7/5/2006 8:53:53 AM ******/






CREATE       proc dbo.INT_GetGRUNDYTerritory_BOR 
  @Territory   varchar(3) OUTPUT,
  @State       varchar(2),
  @ZipCode     varchar(5),
  @City        varchar(50)
as

SET NOCOUNT ON

DECLARE @ZipCount int,
        @CityCount int 

-- Adjust the ZipCode to pad leading 0''s until it gets a length of 5
SELECT @ZipCount = count(*) FROM GRUNDY_Territory 
WHERE UPPER(State) = UPPER(@State) and 
((REPLICATE(''0'', (5 - LEN(zipcode)))+ zipcode)) = @ZipCode

-- ZipCount not found so go for city
IF(@ZipCount <= 0)
BEGIN -- count <= 0
SELECT top 1 @ZipCode = ZipCode from GRUNDY_TerritoryAdditional 
WHERE UPPER(State) = UPPER(@State) and UPPER(City) = UPPER(@City)

-- Adjust the ZipCode to pad leading 0''s until it gets a length of 5
SELECT @ZipCode = (REPLICATE(''0'', (5 - LEN(@ZipCode)))) + @ZipCode

SELECT @ZipCount = count(*) FROM GRUNDY_Territory 
WHERE UPPER(State) = UPPER(@State) and 
((REPLICATE(''0'', (5 - LEN(zipcode)))+ zipcode)) = @ZipCode
END -- count <= 0


-- ZipCount equals one then select one
IF(@ZipCount = 1)
BEGIN -- count = 1
SELECT @Territory = Territory FROM GRUNDY_Territory 
WHERE UPPER(State) = UPPER(@State) and 
((REPLICATE(''0'', (5 - LEN(zipcode)))+ zipcode)) = @ZipCode
END -- count = 1

-- ZipCount greater than one then select greater percent
IF(@ZipCount > 1)
BEGIN -- count > 1
SELECT top 1 @Territory = Territory FROM GRUNDY_Territory 
WHERE UPPER(State) = UPPER(@State) and 
((REPLICATE(''0'', (5 - LEN(zipcode)))+ zipcode)) = @ZipCode and 
Percentage in 
( 
  SELECT max(Percentage) FROM GRUNDY_Territory 
  WHERE UPPER(State) = UPPER(@State) and 
  ((REPLICATE(''0'', (5 - LEN(zipcode)))+ zipcode)) = @ZipCode
)
END -- count > 1

-- Adjust the Teritory to pad leading 0''s until it gets a length of 3
IF(( @Territory is null) or (ltrim(rtrim(@Territory))='''') )
SELECT @Territory = ''018''
ELSE
SELECT @Territory = (REPLICATE(''0'', (3 - LEN(@Territory)))) + @Territory






' 
END
GO
