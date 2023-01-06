Configuration MyWebServerCfg {
 
    Import-DscResource -ModuleName PsDesiredStateConfiguration
 
    Node 'localhost' {
 
        # The first resource block ensures that the Web-Server (IIS) feature is enabled.
        WindowsFeature IIS {
            Ensure = 'Present'
            Name   = 'Web-Server'
        }
 
        # The second resource block ensures that the Web-Mgmt-Tools feature is enabled.
        WindowsFeature IIS-Tools {
            Ensure    = 'Present'
            Name      = 'Web-Mgmt-Tools'
            DependsOn = "[WindowsFeature]IIS'
        }
 
    }
}