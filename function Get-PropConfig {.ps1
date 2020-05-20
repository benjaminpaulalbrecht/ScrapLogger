function Get-PropConfig { 
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $ConfigFile
    )


    #TODO: check for valid properties file.

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


