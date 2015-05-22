@{
    WebCommand = @{
        "Test-Command" = @{
            HideParameter = "Command"
            RunOnline=$true
            FriendlyName = "Test a Command"
        }
        "Get-ScriptCopRule" = @{
            RunWithoutInput = $true
            RunOnline=$true
            FriendlyName = "Learn the Rules"
        }
        "Get-ScriptCopPatrol" = @{
            RunWithoutInput = $true
            RunOnline=$true
            FriendlyName = "Start a Patrol"
        }
    }
    JQueryUITheme = 'Smoothness'
    AnalyticsId = 'UA-24591838-3'
    CommandOrder = "Test-Command", 
        "Get-ScriptCopRule", 
        "Get-ScriptCopPatrol"    
        
    Style = @{
        Body = @{
            'Font' = "14px/2em 'Rockwell', 'Verdana', 'Tahoma'"                                    
            
        }        
    }
    AddPlusOne = $true
    TwitterId = 'jamesbru'
    Facebook = @{
        AppId = '250363831747570'
    }
    
    DomainSchematics = @{
        "Test-Command.com | www.Test-Command.com | ScriptCop.Start-Automating.com | Scriptcop.StartAutomating.com" = 
            "Default"        
    }
    
    AllowDownload = $true
}