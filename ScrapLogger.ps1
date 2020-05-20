# ScrapLogger
# todo: a build system for powershell scripts / general programs (scripts or compiled) called "Scrapper" can employ cvs/test framework 

# default vars 
$appId = "ScrapLogger!" 
$LogFilesystem = "C:\users\balbrecht\Logs" 
$logFile = "$LogFilesystem\log-(Get-Date).log"

function Write-Log() 
{ 
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true )]
        [String]
        $LogMessage
    )

    # helper function: 
    # setup your logging parameters here , and then just pass the LogMessage into here. 

    if ($LogMessage = NULL ) { 
        Write-Host "The Logging Message was empty! Please try again" 
        exit -1  
    } 
    
}



function main() {



    Get-Content $logFile -Wait | ForEach-Object {Write-Host -ForegroundColor (Get-LogColor $_) $_}
}

main

