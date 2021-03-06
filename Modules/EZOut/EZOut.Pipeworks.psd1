@{
    
    WebCommand = @{
        "Write-FormatView" = @{
            HideParameter = "RenamedProperty", "VirtualProperty", "FormatProperty", "Name", "GroupAction", "AsControl", "Width"
            EscapeOutput = $true
            FriendlyName = "Write a Format View"
        }
        "Write-TypeView" = @{
            HideParameter = "CodeProperty", "CodeMethod", "Reserializer"            
            EscapeOutput = $true
            FriendlyName = "Write a Type View"
        }                
    }

    JQueryUITheme = 'Humanity'
    
    AnalyticsId = 'UA-24591838-4'  # Providing an Analytics ID will add an analytics tracker to each page
    
    CommandOrder = "Write-FormatView", "Write-TypeView"
    
    DomainSchematics = @{
        "Ezout.Start-Automating.com | EzOut.StartAutomating.com | EasyOut.Start-Automating.com | EasyOut.StartAutomating.com" = "Default"
    }
    
    AllowDownload = $true         #-AllowDownload lets the module get downloaded
    
    AddPlusOne = $true            # Adds a Google +1 button to all pages
    
    TwitterId = 'jamesbru'        # Adds a a twitter ID to all pages
    
    GoogleSiteVerification =      # The Google Site Verification lets you use Google WebMaster Tools 
        'JFEJmONZO1y1ucWbdc4m0YODOr4y98C3rGIGzh0wLDg'
    
    BingValidationKey =           # The Bing Validation Key lets you use Bing Webmaster Tools
        '7B94933EC8C374B455E8263FCD4FE5EF'
    
    
    
    Facebook = @{                 # A Facebook App IP Lets you log in with facebook, and adds Like buttons
        AppId = '424980144210380'
    }

} 
