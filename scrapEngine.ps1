:scrapEngine.ps1 

:stuff for reading .properties file function Get-PropConfig { 
[CmdletBinding()]
param (
    [Parameter()]
    [String]
    $ConfigFile
)


:TODO: check for valid properties file.

try {
     
    $fContents = Get-Content "$ConfigFile" -Raw
   
}
catch {
    Write-out "Sorry, Can't open: $ConfigFile"
    exit -1     
}
$fContents = [Regex]::Escape($fContents)  
$fContents = $fContents -replace "(\\r)?\\n", [Environment]::NewLine
$config = ConvertFrom-StringData($fContents) 
return $config
} 





function Get-YamlConfig { 

    : todo: validate yaml file.

    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $ConfigFile
    )


    [string][]$fContents = Get-Content $ConfigFile 
    $content = '' 
    foreach ($line in $fContents) { $content = $content + "\n" + $line }
    $config = ConvertFrom-Yaml $content

    return $config 
}

function Parse-Config { 

    [CmdletBinding()] 
    param( 
        [Parameter()] 
        [int] 
        $ParseEngine, 
        [Parameter(mandatory=$true)]
        [String] 
        $ConfigFile 
    )
    switch ($ParseEngine) {
        1 { $results = Get-PropConfig -ConfigFile $ConfigFile  }
        2 { $results = Get-YamlConfig -ConfigFile $ConfigFile  }
        Default {Get-PropConfig -ConfigFile $ConfigFile}
    }   

    switch ($results.mode) {
        "log" {return 0} 
        "watch" { return 1 }
        Default { return -1 }
    } 

    switch ($results.logType) {
        "Apache" { return 0  }
        "General" { return 1} 
        "App_Def" { return 2 }
        Default {return -1 }
    }

    switch ($results.logFormat) {
        "basic" { return 0 }
        "json" { return 1 }
        "winston" { return 2 }
        "formatRules" { return 3 }
        "xml" { return 4} 
        "html" { return 5} 
        "protobuf" { return 6}
        Default { return -1 } 
    } 
    
    switch ($results.logFile) 
    { 
        "*" { return $results.logFile }
        Default { return -1 }
    }

    switch ($results.git){
        "y" { return 0} 
        "n" { return 1 }
        Default { return -1 }
    }

    # either pickup the file specied, or return -1 (no .gitconfig) 
    switch ($results.gitConfig) { 
        "*" { return $results.gitConfig}
        Default { return -1 }
    }

    switch ($results.mesgFile){
        "*" { return $results.mesgFile} 
        Default { return -1}
    }
    
    #todo: appID? 

    switch ($results.logEngine){
        1 { return 0 }
        2 { return 1 }
        Default { return -1 }
    }

    switch ($results.framework){
        "psframework" { 
            return 1 # 1 = YES / load psframework 
        }
        Default { return 0 } #0 = NO 
    }

    # not implemented:  nuGet Engine for Packaging 
}  



# Log Channel Processesing 



# Output-Stdout(): writes to the term window  
function  Output-Stdout {

    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $Input 
    ) 

    Write-Host $Input 
}


#note: we may need to create a class / object called LogFile to handle casting from a message to a file line

# Output-File(): Writes to a file 
function Output-File() 
{ 
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $Input
    )
    try {
        Out-File $Input 
    }
    catch {
        
    }
}

# Out-Window(): Writes contents to a custom log window / canvas widget. in .net
function Out-Window() 
{ 

    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
    [void] [System.Windows.Forms.Application]::EnableVisualStyles() 

    $Form = New-Object System.Windows.Forms.Form 
    
    $Form.Size = New-Object System.Drawing.Size(400, 200)
    
    $Form.MaximizeBox = $true #user may need to see more text printed that a small window
    $Form.StartPosition = "CenterScreen" 
    $Form.FormBorderStyle = "Fixed3D" 
    $Form.Text = "Log" 
    
    $Form.ShowDialog() 

} 

#Out-Term will create a new powershell terminal window to out stdout/file to. 
function Out-Term() {

    


}


# Writes the Log to either Stdout, LogFile or both (central function) 
function Out-Log() 
{ 

}


