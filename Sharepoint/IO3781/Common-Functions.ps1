####################################################################################################
# Function: EnumerateSubWebs
# Description: Fills an ArrayList recursively with the URL of all subwebs
# Params
#  WebURL - The URL of the site to enumerate
#  TheList - The ArrayList to be populated
#  IncludeRoot - If true, the passed value for WebURL will be added to the list
####################################################################################################
Function EnumerateSubWebs([String]$WebUrl,[System.Collections.ArrayList]$TheList,[bool]$IncludeRoot)
{
  if ($IncludeRoot)
  {
    $Dummy = $TheList.Add($WebUrl)
  }
  
  $Web = Get-SPWeb($WebURL)
  if ($Web -ne $NULL)
  {
    $SubWebs = $Web.Webs
    ForEach ($SubWeb In $SubWebs)
    {
      $SubURL = $SubWeb.URL
      EnumerateSubWebs $SubURL $TheList $true
    }  
  }
}

####################################################################################################
# Function: GetDivisionInformation
# Description: Fills an ArrayList with Atlas division site information
# Params
#  TheList - The ArrayList to be populated
####################################################################################################
Function GetDivisionInformation([System.Collections.ArrayList]$TheList)
{
    #----------------------- Division Name ------------ Relative URL -- Content Database ----------------------
    $count = $TheList.Add( ("Eastern",                 "eastern",      "WSS_Content_Atlas_Eastern") );
    $count = $TheList.Add( ("North Central",           "northcentral", "WSS_Content_Atlas_NorthCentral") );
    $count = $TheList.Add( ("South",                   "south",        "WSS_Content_Atlas_South") );
    $count = $TheList.Add( ("West",                    "west",         "WSS_Content_Atlas_West") );
    $count = $TheList.Add( ("Spotlight",               "spotlight",    "WSS_Content_Atlas_Spotlight") );
}

####################################################################################################
# Function: GetTeamSiteInformation
# Description: Fills an ArrayList with Atlas team site information
# Params
#  TheList - The ArrayList to be populated
####################################################################################################
Function GetTeamSiteInformation([System.Collections.ArrayList]$TheList)
{
    #----------------------- Site Name ---------------- Relative URL -- Content Database ----------------------
    $count = $TheList.Add( ("Teamsites East",          "tse",          "WSS_Content_Atlas_TS_East") );
    $count = $TheList.Add( ("Teamsites North Central", "tsn",          "WSS_Content_Atlas_TS_NorthCentral") );
    $count = $TheList.Add( ("Teamsites South",         "tss",          "WSS_Content_Atlas_TS_South") );
    $count = $TheList.Add( ("Teamsites West",          "tsw",          "WSS_Content_Atlas_TS_West") );
    $count = $TheList.Add( ("Teamsites Spotlight",     "tssp",         "WSS_Content_Atlas_TS_Spotlight") );
}

####################################################################################################
# Function: GetMarketInformation
# Description: Fills an ArrayList with Atlas market site information
# Params
#  TheList - The ArrayList to be populated
####################################################################################################
Function GetMarketInformation([System.Collections.ArrayList]$TheList)
{
    #----------------------- Market Name ---------------------- Relative URL ----------------------
    $count = $TheList.Add( ("Baltimore",                       "/eastern/baltimore") );
    $count = $TheList.Add( ("Charlottesville Harrisonburg",    "/eastern/charlottesville-harrisonburg") );
    $count = $TheList.Add( ("Hlly",                            "/eastern/hlly") );
    $count = $TheList.Add( ("New York",                        "/eastern/newyork") );
    $count = $TheList.Add( ("Philadelphia",                    "/eastern/philadelphia") );
    $count = $TheList.Add( ("Pitt-OH-WV-JAS",                  "/eastern/pitt-oh-wv-jas") );
    $count = $TheList.Add( ("Richmond",                        "/eastern/richmond") );
    $count = $TheList.Add( ("Roanoke-Lynchburg",               "/eastern/roanoke-lynchburg") );
    $count = $TheList.Add( ("Salisbury",                       "/eastern/salisbury") );
    $count = $TheList.Add( ("Washington",                      "/eastern/washington") );
    $count = $TheList.Add( ("Wilkes-Barre-Scranton",           "/eastern/wilkes-barre-scranton") );
    $count = $TheList.Add( ("Central IL",                      "/northcentral/centralil") );
    $count = $TheList.Add( ("Central Region",                  "/northcentral/centralregion") );
    $count = $TheList.Add( ("Chicago",                         "/northcentral/chicago") );
    $count = $TheList.Add( ("Michigan Region",                 "/northcentral/michiganregion") );
    $count = $TheList.Add( ("New England Region",              "/northcentral/newenglandregion") );
    $count = $TheList.Add( ("Twin Cities",                     "/northcentral/twincities") );
    $count = $TheList.Add( ("Atlanta",                         "/south/atlanta") );
    $count = $TheList.Add( ("Augusta",                         "/south/augusta") );
    $count = $TheList.Add( ("Charleston",                      "/south/charleston") );
    $count = $TheList.Add( ("Chattanooga",                     "/south/chattanooga") );
    $count = $TheList.Add( ("Columbus-Tupelo",                 "/south/columbus-tupelo") );
    $count = $TheList.Add( ("Fort Myers",                      "/south/fortmyers") );
    $count = $TheList.Add( ("Hattiesburg-Laurel",              "/south/hattiesburg-laurel") );
    $count = $TheList.Add( ("Houston",                         "/south/houston") );
    $count = $TheList.Add( ("Huntsville-Florence",             "/south/huntsville-florence") );
    $count = $TheList.Add( ("Jackson",                         "/south/jackson") );
    $count = $TheList.Add( ("Jacksonville",                    "/south/jacksonville") );
    $count = $TheList.Add( ("Knoxville",                       "/south/knoxville") );
    $count = $TheList.Add( ("Little Rock",                     "/south/littlerock") );
    $count = $TheList.Add( ("Memphis",                         "/south/memphis") );
    $count = $TheList.Add( ("Meridian",                        "/south/meridian") );
    $count = $TheList.Add( ("Mississippi-Louisiana",           "/south/mississippi-louisiana") );
    $count = $TheList.Add( ("Monroe",                          "/south/monroe") );
    $count = $TheList.Add( ("Nashville-Paducah-Bowling Green", "/south/nashville-paducah-bowlinggreen") );
    $count = $TheList.Add( ("Panama City-Dothan",              "/south/panamacity-dothan") );
    $count = $TheList.Add( ("Sarasota-West Tampa",             "/south/sarasota-westtampa") );
    $count = $TheList.Add( ("Savannah",                        "/south/savannah") );
    $count = $TheList.Add( ("South Florida",                   "/south/southflorida") );
    $count = $TheList.Add( ("Tallahassee",                     "/south/tallahassee") );
    $count = $TheList.Add( ("Colorado",                        "/west/colorado") );
    $count = $TheList.Add( ("Fresno",                          "/west/fresno") );
    $count = $TheList.Add( ("Monterey Bay",                    "/west/montereybay") );
    $count = $TheList.Add( ("New Mexico",                      "/west/newmexico") );
    $count = $TheList.Add( ("Portland-Eugene",                 "/west/portland-eugene") );
    $count = $TheList.Add( ("Sacramento",                      "/west/sacramento") );
    $count = $TheList.Add( ("Salt Lake City",                  "/west/saltlakecity") );
    $count = $TheList.Add( ("San Francisco",                   "/west/sanfrancisco") );
    $count = $TheList.Add( ("Seattle-Spokanes",                "/west/seattle-spokane") );
    $count = $TheList.Add( ("Corporate",                       "/spotlight/corporate") );
}

####################################################################################################
# Function: GetListTemplates
# Description: Fills an ArrayList with Atlas list template information
# Params
#  TheList - The ArrayList to be populated
####################################################################################################
Function GetListTemplates([System.Collections.ArrayList]$TheList)
{
    #---------------------- Template File --------------- Template Name ----------- List Name -----------------
    $count = $TheList.Add( ("SpotLightAnnouncements.stp", "SpotLightAnnouncements", "Spotlight Announcements") );
    $count = $TheList.Add( ("Spotlight-Images.stp",       "Spotlight-Images",       "Spotlight Images") );
    $count = $TheList.Add( ("Sales.stp",                  "Sales",                  "Sales") );
    $count = $TheList.Add( ("HR.stp",                     "HR",                     "HR") );
    $count = $TheList.Add( ("Office.stp",                 "Office",                 "Office") );
    $count = $TheList.Add( ("Atlas.stp",                  "Atlas",                  "Atlas") );
    $count = $TheList.Add( ("SalesLook.stp",              "SalesLook",              "SalesLook") );
    $count = $TheList.Add( ("Training.stp",               "Training",               "Training") );
}
