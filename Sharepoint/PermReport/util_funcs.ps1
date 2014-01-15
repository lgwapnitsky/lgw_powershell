Function New-Underline
{
 [CmdletBinding()]
param(
      [Parameter(Mandatory = $true,Position = 0,valueFromPipeline=$true)]
      [string]
      $stringIN,
      [string]
      $char = "_"
 )
  $underLine= $char * $stringIn.length
  $stringIn
  $underLine
} #end function new-underline