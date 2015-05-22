 Add-Type -Assembly System.ServiceModel.Web,System.Runtime.Serialization
  
 function Convert-JsonToXml([string]$json)
 {
     $bytes = [byte[]][char[]]$json
     $quotas = [System.Xml.XmlDictionaryReaderQuotas]::Max
     $jsonReader = [System.Runtime.Serialization.Json.JsonReaderWriterFactory]::CreateJsonReader($bytes,$quotas)
     try
     {
         $xml = new-object System.Xml.XmlDocument
  
         $xml.Load($jsonReader)
         $xml
     }
     finally
     {
         $jsonReader.Close()
     }
 }
  
 function Convert-XmlToJson([xml]$xml)
 {
     $memStream = new-object System.IO.MemoryStream
     $jsonWriter = [System.Runtime.Serialization.Json.JsonReaderWriterFactory]::CreateJsonWriter($memStream)
     try
     {
         $xml.Save($jsonWriter)
         $bytes = $memStream.ToArray()
         [System.Text.Encoding]::UTF8.GetString($bytes,0,$bytes.Length)
     }
     finally
     {
         $jsonWriter.Close()
     }
 }
  
 $str = '{"fname":"John", "lname":"Doe", "age":42, "addr":{"city":"Gotham", "street1":"123 Guano Way", "state":"NY"}}'
  
 $xml = Convert-JsonToXml $str
 $xml.root.fname
 $xml.root.lname
  
 $json = Convert-XmlToJson $xml
 $json