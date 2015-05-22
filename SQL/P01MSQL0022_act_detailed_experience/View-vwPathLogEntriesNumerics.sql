IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwPathLogEntriesNumerics]'))
DROP VIEW [dbo].[vwPathLogEntriesNumerics]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwPathLogEntriesNumerics]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW vwPathLogEntriesNumerics
AS

SELECT 
	PolicyNumber,
	MAX([Attestation]) as [Attestation],    
	MAX([Audit]) as [Audit],  
	MAX([Bookkeeping]) as [Bookkeeping], 
	MAX([Compilation]) as [Compilation],  
	MAX([Corporate Financial Planning]) as [Corporate Financial Planning], 
	MAX([Corporate Tax]) as [Corporate Tax], 
	MAX([Data Processing]) as [Data Processing],
	MAX([Elder Care]) as [Elder Care],    
	MAX([Number of Church Members]) as [Number of Church Members],
	MAX([Number of Paid Claims in the last 5 years]) as [Number of Paid Claims in the last 5 years],
    MAX([# of Clergy]) as [# of Clergy],
	MAX([# of employees over $100K in salary]) as [# of employees over $100K in salary],	
	MAX([Individual Tax]) as [Individual Tax],  
	MAX([Insider Shareholder Percent]) as [Insider Shareholder Percent],
	MAX([Fleet Size]) as [Fleet Size],	
    MAX([Number of Locations]) as [Number of Locations],
    --MAX([Lock-down facilities]) as [Lock-down facilities],
	MAX([MAS Services]) as [MAS Services],           
    MAX([Num of Buildings > 3 Stories]) as [Num of Buildings > 3 Stories],
    MAX([Total Number of Rooms]) as [Total Number of Rooms],
	MAX([Number of Full Time Employees]) as [Number of Full Time Employees],
	MAX([Number of Part Time Employees]) as [Number of Part Time Employees],
	MAX([Number of Temporary Employees]) as [Number of Temporary Employees],
	MAX([Number of Lease Employees]) as [Number of Lease Employees],
	MAX([Number of Years in Operation]) as [Number of Years in Operation],	
	MAX([Total Employees]) as [Total Employees],
	MAX([Other Assurance]) as [Other Assurance],
	MAX([Percentage of Occupancy]) as [Percentage of Occupancy],
	MAX([Personal Financial Planning]) as [Personal Financial Planning],
	MAX([Plan Assets]) as [Plan Assets],
	MAX([Review]) as [Review],
	MAX([SEC Work]) as [SEC Work],
	MAX([Total Claims]) as [Total Claims],
	MAX([Total Participants]) as [Total Participants],
	MAX([Turnover Rate]) as [Turnover Rate],
  	MAX([Year Condo was Built]) as [Year Condo was Built],
    MAX([Year of Roof update]) as [Year of Roof update]
FROM
(

            SELECT
                        PolicyNumber as PolicyNumber,
                        
						[Attestation] = isnull([Attestation],0),

						[Audit] = isnull([Audit],0),

						[Bookkeeping] = isnull([Bookkeeping],0),

						[Number of Church Members] = isnull([Number of Church Members],0),
												
                        [# of Clergy] = isnull([# of Clergy],0),

                        [Compilation] = isnull([Compilation],0),

						[Corporate Financial Planning] = isnull([Corporate Financial Planning],0),

						[Corporate Tax] = isnull([Corporate Tax],0),

						[Data Processing] = isnull([Data Processing],0),

						[Elder Care] = isnull([Elder Care],0),

						[# of employees over $100K in salary] = isnull([# of employees over $100K in salary],0),							

                        [Fleet Size] = isnull([Fleet Size],0),

                        [Individual Tax] = isnull([Individual Tax],0),
       
						[Insider Shareholder Percent] = isnull([Insider Shareholder Percent],0),
			   			
                        [MAS Services] = isnull([MAS Services],0),

						[Number of Locations] = isnull([Number of Locations],0),

						[Number of Paid Claims in the last 5 years] = isnull([Number of Paid Claims in the last 5 years],0),
												
						[Num of Buildings > 3 Stories] = isnull([Num of Buildings > 3 Stories],0),
						
						[Number of Full Time Employees] = isnull([Number of Full Time Employees],0),

						[Number of Part Time Employees] = isnull([Number of Part Time Employees],0),
						
						[Number of Temporary Employees] = isnull([Number of Temporary Employees],0),

						[Number of Lease Employees] = isnull([Number of Lease Employees],0),

						[Number of Years in Operation] = isnull([Number of Years in Operation],0),

						[Other Assurance] = isnull([Other Assurance],0),

						[Personal Financial Planning] = isnull([Personal Financial Planning],0),
						
						[Plan Assets] = isnull([Plan Assets],0),

						[Review] = isnull([Review],0),

						[SEC Work] = isnull([SEC Work],0),

                        [Total Claims] = isnull([Total Claims],0),

						[Total Employees] = isnull([Total Employees],0),

                        [Total Number of Rooms] = isnull([Total Number of Rooms],0),
												
						[Total Participants] = isnull([Total Participants],0),

						[Turnover Rate] = isnull([Turnover Rate],0),

                        [Percentage of Occupancy] = isnull([Percentage of Occupancy],0),
	                   								
                        [Year Condo was Built] = isnull([Year Condo was Built],0),
												
                        [Year of Roof update] = isnull([Year of Roof update],0) 


										
            FROM        
            (
                  SELECT 
                        pss.PolicyNumber,
                        ugi.UCLGridItemName,
                        ugd.Status,
						ugd.Number
                        FROM 
                              PathNet2.dbo.PolicySnapshot pss with (nolock)
                        INNER JOIN
							  PathNet2.dbo.UCLGridData ugd with (nolock)
                        ON
                              pss.TransactionID = ugd.UCLChecklistID
                        INNER JOIN
                              PathNet2.dbo.UCLGridItem ugi with (nolock)
                        ON
                              ugd.UCLGridItemID = ugi.UCLGridItemID 
--where policynumber = ''PHSD341198''   
            ) 
                  as SourceData

            PIVOT
                  (
				SUM(Number)
				
                  FOR 
                  UCLGridItemName IN 
                        (
							[Attestation],    
							[Audit],  
							[Bookkeeping], 
							[Compilation],  
							[Corporate Financial Planning], 
							[Corporate Tax], 
							[Data Processing],
							[Elder Care],    
							[Number of Church Members],
							[Number of Paid Claims in the last 5 years],
                            [# of Clergy],
							[# of employees over $100K in salary],	
							[Individual Tax],  
							[Insider Shareholder Percent],
							[Fleet Size],	
                            [Number of Locations],
                            [Lock-down facilities],
       						[MAS Services],           
                            [Num of Buildings > 3 Stories],
                            [Total Number of Rooms],
							[Number of Full Time Employees],
							[Number of Part Time Employees],
							[Number of Temporary Employees],
							[Number of Lease Employees],
							[Number of Years in Operation],	
							[Total Employees],
							[Other Assurance],
							[Percentage of Occupancy],
							[Personal Financial Planning],
							[Plan Assets],
							[Review],
							[SEC Work],
							[Total Claims],
							[Total Participants],
							[Turnover Rate],
                          	[Year Condo was Built],
                            [Year of Roof update]
							                             
                              )

                  ) as PivotTable
) as a
	GROUP BY 
		policynumber' 
GO
