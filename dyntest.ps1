function foo {
    Param (
    [Parameter(Position=1,Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias("FullName")]
    [String] $FileName,
   
    [Parameter(Position=2,Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
    [Alias("InsertFile")]
    [Bool] $FileToTable = $false )

    DynamicParam  {
       $attributes = new-object System.Management.Automation.ParameterAttribute
       if ($FileToTable) { $attributes.Mandatory = $true }
       else { $attributes.Mandatory = $false }
        
       $attributeCollection = new-object -Type System.Collections.ObjectModel.Collection``1[System.Attribute]
       $attributeCollection.Add($attributes)
        
       $dynParam1 = new-object System.Management.Automation.RuntimeDefinedParameter("servername", [string], $attributeCollection)
        
       $paramDictionary = new-object System.Management.Automation.RuntimeDefinedParameterDictionary
       $paramDictionary.Add("servername", $dynParam1)
       return $paramDictionary
    }
    
    Begin {}
    Process{
        if ( $filetotable ) { write-host "$filename, $filetotable, $servername" }
        else { write-host "$filename, $filetotable" }
    }
    End {}
    
}