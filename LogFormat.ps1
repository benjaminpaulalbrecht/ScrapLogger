#LogFormat.ps1



# JSON 


# XML 



# HTML 


# ProtoBuf 


#CommonLogFormat (Apache)



# BASIC / DEFAULT / Internal 
function Get-LogColor { 
    Param([Parameter(Position=0)]
    [String]$LogEntry
    )

    process { 
        if ($LogEntry.Contains("Created")) { Return "Green"} 
        elseif ($LogEntry.Contains("Changed")) { Return "Yellow"}
        elseif ($LogEntry.Contains("Deleted")) { Return "Red"}
        elseif ($LogEntry.Contains("Renamed")) {Return "Blue"}
        else {Return "White"}
        }
}


