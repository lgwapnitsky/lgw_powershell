$filepath = "$pwd\test.xml"

$XmlWriter = New-Object System.XML.XmlTextWriter($filepath, $null)
$XmlWriter.Formatting = "Indented"
$XmlWriter.Indentation = "4"

$XmlWriter.WriteStartDocument()
$XSLPropText = "type='text/xsl' href='project.xsl'"
$XmlWriter.WriteDocType("project", $null, $null, "<!ENTITY p 'project'>")

$XmlWriter.WriteProcessingInstruction("xml-stylesheet",$XSLPropText)

$XmlWriter.WriteStartElement("RootElement")


$XmlWriter.WriteStartElement("project")
$XmlWriter.WriteElementString("Name", "Project1")

$XmlWriter.WriteStartElement("group")
$XmlWriter.WriteEntityRef("p")
$XmlWriter.WriteElementString("refid", "group")
$XmlWriter.WriteEndElement()

$XmlWriter.WriteElementString("test","test")
$XmlWriter.WriteEndElement()
$XmlWriter.WriteEndDocument()

$XmlWriter.Finalize
$XmlWriter.Flush
$XmlWriter.CLose()

$doc = new-object -type system.xml.xmldocument
$doc.PreserveWhitespace=$true
$doc.load($filepath)

write-host $doc.InnerXML