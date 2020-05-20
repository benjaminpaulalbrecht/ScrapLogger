# watch.ps1

# setup watch events 
function Set-Watcher { 
    
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $_LogFileSystem = $LogFilesystem, 
        
        [Parameter()]
        [string]
        $_LogFilter = $2 
    )

    $watcher = New-Object System.IO.FileSystemWatcher 
    $watcher.Path = "$LogFileSystem" 
    $watcher.Filter = "$_LogFilter"
    
    #TODO: Make this a switch / case 
    $watcher.IncludeSubdirectories = $true 

    $watcher.EnableRaisingEvents = $true 

    $action = { 
        $path = $Event.SourceEventArgs.FullPath
        $changeType = $Event.SourceEventArgs.$changeType
        $logLine = "$(Get-Date), $changeType"
        
        try {
            Add-Content = $LogFilesystem\$logFile    
        }
        catch {
            Write-Host "I'm Sorry... But I can't grab the file any more/longer. File contention?"
            exit             
        }   
    }

    #finally, register events. 

    try {
        
        Register-ObjectEvent $watcher "Created" -Action $action 
    }
    catch {

        Write-Host "Can't Register <Created> as an event." 
        exit 
    }

    try {
        
        Register-ObjectEvent $watcher "Changed" -Action $action 
    }
    catch {
        
        Write-Host "Can't Register <Changed> as an event." 
        exit 
    }

    try {
        Register-ObjectEvent $watcher "Deleted" -Action $action 
    }
    catch {
        
        Write-Host "Can't Register <Deleted> as an event." 
        exit 
    }

    try {
        Register-ObjectEvent $watcher "Renamed" -Action $action
    }
    catch {
        
        Write-Host "Can't Register <Renamed> as an event." 
        exit 
    }

    while ($true) { 
        sleep 5
    }
}


