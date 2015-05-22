IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PMS_MatchPRP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PMS_MatchPRP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PMS_MatchPRP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PMS_MatchPRP]

@PolicyNumber varchar(15) = null

AS
	
BEGIN 
	DECLARE @PriorPolicyNumber varchar(15)
/*
UPDATE insurableobjectPRP
SET
priorinsurableID = null,
priorinsurableidmatchtype = null


DROP TABLE #CurrentPolicy
DROP TABLE #PriorPolicy
*/


	SELECT @PriorPolicyNumber = PriorPolicyNumber FROM PolicySnapshot P WHERE PolicyNumber = @PolicyNumber AND snapshottype = ''I''
	--Current Policy Matching Attributes
		SELECT
			p.PolicyNumber,
			p.PriorPolicyNumber,
			i.InsurableID,
			case when i.coveragecode=''EQ'' then i.coveragecode+i.SubCoverageCode else i.coveragecode end,
			i.ClassCode,
			i.Subline,
			i.territory,
			i.Exposure,
			i.LocationAddress1,
			i.LocationAddress2,
			i.LocationCity,
			i.LocationState,
			i.LocationZip,
			i.AQSPerilSequence,
			i.AQSBuildingSequence,
			i.AQSLocationSequence
		INTO
			#CurrentPolicy
		FROM 
			PolicySnapshot P with (nolock)
		INNER JOIN
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID
		WHERE
			SnapshotType = ''I''
		AND
			p.PolicyNumber = ISNULL(@PolicyNumber,p.PolicyNumber)

	CREATE CLUSTERED INDEX IX_#CurrentPolicy_All ON #CurrentPolicy
	(
		[PriorPolicyNumber] ASC,
		[CoverageCode] ASC,
		[Subline] ASC,
		[ClassCode] ASC,
		[Territory] ASC,
		[Exposure] ASC
	)

	CREATE STATISTICS STAT_#CurrentPolicy_All ON #CurrentPolicy ([PriorPolicyNumber], [CoverageCode], [Subline], [ClassCode], [Territory],[Exposure])


	--Prior Policy Matching Attributes
		SELECT
			p.PolicyNumber,
			i.InsurableID,
			case when i.coveragecode=''EQ'' then i.coveragecode+i.SubCoverageCode else i.coveragecode end,
			i.ClassCode,
			i.Subline,
			i.territory,
			i.Exposure,
			i.LocationAddress1,
			i.LocationAddress2,
			i.LocationCity,
			i.LocationState,
			i.LocationZip,
			i.AQSPerilSequence,
			i.AQSBuildingSequence,
			i.AQSLocationSequence
		INTO
			#PriorPolicy
		FROM 
			PolicySnapshot P with (nolock)
		INNER JOIN
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID
		WHERE
			SnapshotType = ''E''	
		AND
			p.PolicyNumber = ISNULL(@PriorPolicyNumber,p.PolicyNumber)

	CREATE CLUSTERED INDEX IX_#PriorPolicy_All ON #PriorPolicy
	(
		[PolicyNumber] ASC,
		[CoverageCode] ASC,
		[Subline] ASC,
		[ClassCode] ASC,
		[Territory] ASC,
		[Exposure] ASC
	)

	CREATE STATISTICS STAT_#PriorPolicy_All ON #PriorPolicy ([PolicyNumber], [CoverageCode], [Subline], [ClassCode], [Territory],[Exposure])


	/*
	Match Level 1 --> Match on finest grain including all key values
	172187	
	DROP TABLE #InsurableMatchLevel1
	*/

			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel1
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		AND
			c.Exposure = p.Exposure			
		AND
			c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		AND
			c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence


	DELETE 
		FROM 
			#InsurableMatchLevel1
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel1 
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel1 
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)				
		OR
			PriorInsurableID is null


	UPDATE	InsurableObjectPRP --2236051 64.4%  --
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 1
		FROM
			PolicySnapshot P with (nolock)
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel1 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID

	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel1)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel1)

	DROP TABLE #InsurableMatchLevel1
				
	/*
	Match Level 2 --> Match on next lowest grain exclude AQSBuildingSequence & AQSLocationSequence
	23787
	DROP TABLE #InsurableMatchLevel2
	*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel2
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		AND
			c.Exposure = p.Exposure			
		AND
			c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		AND
			c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		--AND
		--	c.AQSBuildingSequence = p.AQSBuildingSequence
		--AND
		--	c.AQSLocationSequence = p.AQSLocationSequence
			


	DELETE 
		FROM 
			#InsurableMatchLevel2
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel2
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel2
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel2

	UPDATE	InsurableObjectPRP --753
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 2
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel2 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel2)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel2)

	DROP TABLE #InsurableMatchLevel2
				

	/*
	Match Level 3 --> Match on next lowest grain exclude Exposure
	14179
	DROP TABLE #InsurableMatchLevel3
	*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel3
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		--AND
		--	c.Exposure = p.Exposure			
		AND
			c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		AND
			c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence
			


	DELETE 
		FROM 
			#InsurableMatchLevel3
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel3
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel3
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel3

	UPDATE	InsurableObjectPRP --338145 9.74%
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 3
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel3 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel3)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel3)

	DROP TABLE #InsurableMatchLevel3

	/*
	Match Level 4 --> 
	6998
	DROP TABLE #InsurableMatchLevel4
	*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel4
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		--AND
		--	c.Exposure = p.Exposure			
		AND
			c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		AND
			c.LocationZip = p.LocationZip
		--AND
		--	c.AQSPerilSequence = p.AQSPerilSequence
		--AND
		--	c.AQSBuildingSequence = p.AQSBuildingSequence
		--AND
		--	c.AQSLocationSequence = p.AQSLocationSequence
			


	DELETE 
		FROM 
			#InsurableMatchLevel4
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel4
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel4
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel4

	UPDATE	InsurableObjectPRP --71452 2.1%
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 4
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel4 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel4)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel4)

	DROP TABLE #InsurableMatchLevel4

	/*
	Match Level 5 --> Match on  exclude location address 1
	*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel5
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		AND
			c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		--AND
		--	c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		AND
			c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence
			


	DELETE 
		FROM 
			#InsurableMatchLevel5
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel5
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel5
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel5

	UPDATE	InsurableObjectPRP --68367 2.1%
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 5
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel5 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel5)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel5)

	DROP TABLE #InsurableMatchLevel5

	/*
	Match Level 6 --> Match on  exclude location address 1

	DROP TABLE #InsurableMatchLevel6
	*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel6
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		--AND
		--	c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		AND
			c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence
			


	DELETE 
		FROM 
			#InsurableMatchLevel6
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel6
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel6
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel6

	UPDATE	InsurableObjectPRP --17122 .8%
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 6
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel6 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel6)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel6)

	DROP TABLE #InsurableMatchLevel6


	/*
	Match Level 7 --> Match on  exclude location address 1 & zip

	DROP TABLE #InsurableMatchLevel7
	*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel7
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		--AND
		--	c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		--AND
		--	c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence

	DELETE 
		FROM 
			#InsurableMatchLevel7
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel7
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel7
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel7

	UPDATE	InsurableObjectPRP --16807 
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 7
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel7 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel7)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel7)

	DROP TABLE #InsurableMatchLevel7

/*
Match Level 8 --> Match on  exclude location address 1 & zip & AQS Location Seq
*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel8
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		--AND
		--	c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		--AND
		--	c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		--AND
		--	c.AQSLocationSequence = p.AQSLocationSequence

	DELETE 
		FROM 
			#InsurableMatchLevel8
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel8
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel8
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel8

	UPDATE	InsurableObjectPRP --33947 
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 8
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel8 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel8)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel8)

	DROP TABLE #InsurableMatchLevel8


/*
Match Level 9 --> Match on  exclude location address 1 & zip & AQS KEYS
*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel9
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		--AND
		--	c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		AND
			c.LocationAddress2 = p.LocationAddress2
		AND
			c.LocationCity = p.LocationCity
		AND
			c.LocationState = p.LocationState
		--AND
		--	c.LocationZip = p.LocationZip
		--AND
		--	c.AQSPerilSequence = p.AQSPerilSequence
		--AND
		--	c.AQSBuildingSequence = p.AQSBuildingSequence
		--AND
		--	c.AQSLocationSequence = p.AQSLocationSequence

	DELETE 
		FROM 
			#InsurableMatchLevel9
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel9
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel9
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel8

	UPDATE	InsurableObjectPRP --15540 
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 9
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel9 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel9)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel9)

	DROP TABLE #InsurableMatchLevel9



/*
Match Level 10 --> Match on everything except entire address
*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel10
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		AND
			c.territory = p.territory
		AND
			c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		--AND
		--	c.LocationAddress2 = p.LocationAddress2
		--AND
		--	c.LocationCity = p.LocationCity
		--AND
		--	c.LocationState = p.LocationState
		--AND
		--	c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence

	DELETE 
		FROM 
			#InsurableMatchLevel10
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel10
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel10
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel10

	UPDATE	InsurableObjectPRP --12801 
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 10
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel10 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel10)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel10)

	DROP TABLE #InsurableMatchLevel10



/*
Match Level 11 --> Match on everything except entire address and territory
*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel11
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		--AND
		--	c.territory = p.territory
		AND
			c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		--AND
		--	c.LocationAddress2 = p.LocationAddress2
		--AND
		--	c.LocationCity = p.LocationCity
		--AND
		--	c.LocationState = p.LocationState
		--AND
		--	c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence

	DELETE 
		FROM 
			#InsurableMatchLevel11
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel11
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel11
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel11

	UPDATE	InsurableObjectPRP --8758 
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 11
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel11 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null


	DELETE FROM	#CurrentPolicy
	WHERE InsurableID IN (SELECT CurrentInsurableID  FROM #InsurableMatchLevel11)
	
	DELETE FROM	#PriorPolicy
	WHERE InsurableID IN (SELECT PriorInsurableID  FROM #InsurableMatchLevel11)

	DROP TABLE #InsurableMatchLevel11



/*
Match Level 12 --> Match on everything except entire address and territory and exposure
*/
			
	SELECT  
		--c.*,p.* 
			c.PolicyNumber as CurrentPolicyNumber,
			c.InsurableID as CurrentInsurableID,
			p.PolicyNumber as PriorPolicyNumber,
			p.InsurableID as PriorInsurableID
		INTO
			#InsurableMatchLevel12
		FROM 
			#CurrentPolicy c with (nolock)
		LEFT OUTER JOIN 
			#PriorPolicy p with (nolock)
		ON 
			c.PriorPolicyNumber = p.PolicyNumber
		AND
			c.CoverageCode = p.CoverageCode
		AND
			c.Subline = p.Subline
		AND
			c.ClassCode = p.ClassCode
		--AND
		--	c.territory = p.territory
		--AND
		--	c.Exposure = p.Exposure			
		--AND
		--	c.LocationAddress1 = p.LocationAddress1
		--AND
		--	c.LocationAddress2 = p.LocationAddress2
		--AND
		--	c.LocationCity = p.LocationCity
		--AND
		--	c.LocationState = p.LocationState
		--AND
		--	c.LocationZip = p.LocationZip
		AND
			c.AQSPerilSequence = p.AQSPerilSequence
		AND
			c.AQSBuildingSequence = p.AQSBuildingSequence
		AND
			c.AQSLocationSequence = p.AQSLocationSequence

	DELETE 
		FROM 
			#InsurableMatchLevel12
		WHERE 
			CurrentInsurableID IN -- Eliminate records that multiplied due to join
				(
					SELECT 
						CurrentInsurableID 
					FROM 
						#InsurableMatchLevel12
					GROUP BY 
						CurrentInsurableID 
					HAVING COUNT(*) > 1
				)
		OR
			PriorInsurableID IN 
				(
					SELECT 
						PriorInsurableID 
					FROM 
						#InsurableMatchLevel12
					GROUP BY 
						PriorInsurableID 
					HAVING COUNT(*) > 1
				)	
		OR
			PriorInsurableID is null

--SELECT COUNT(*) FROM #InsurableMatchLevel12

	UPDATE	InsurableObjectPRP --21916 
		SET
			PriorInsurableID = M1.PriorInsurableID,
			PriorInsurableIDMatchType = 12
		FROM
			PolicySnapshot P
		INNER JOIN		
			InsurableObjectPRP I with (nolock)
		ON
			p.PolicySnapshotID = i.PolicySnapshotID	
		AND
			p.snapshottype = ''I''	
		INNER JOIN
			#InsurableMatchLevel12 M1 with (nolock)
		ON
			I.InsurableID = M1.CurrentInsurableID
		WHERE
			i.PriorInsurableID is null

	DROP TABLE #CurrentPolicy
	DROP TABLE #PriorPolicy
	DROP TABLE #InsurableMatchLevel12

END' 
END
GO
