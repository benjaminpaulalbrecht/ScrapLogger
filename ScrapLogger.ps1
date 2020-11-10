$symbols = [PSCustomObject] @{
    SMILEY_WHITE = ([char]9786)
    SMILEY_BLACK = ([char]9787)
    GEAR         = ([char]9788)
    HEART        = ([char]9829)
    DIAMOND      = ([char]9830)
    CLUB         = ([char]9827)
    SPADE        = ([char]9824)
    CIRCLE       = ([char]8226)
    NOTE1        = ([char]9834)
    NOTE2        = ([char]9835)
    MALE         = ([char]9794)
    FEMALE       = ([char]9792)
    YEN          = ([char]165)
    COPYRIGHT    = ([char]169)
    PI           = ([char]960)
    TRADEMARK    = ([char]8482)
    CHECKMARK    = ([char]8730)
}

#Set Ansi Colors
#todo: Set-ItemProperty HKCU:\Console VirtualTerminalLevel -Type DWORD 1

function Scrap {
    param (
        $message,
        $loglevel
    )

    switch ($loglevel) { 
        { $_ -eq "Info" } { 
            $levelColor = "Magenta"
            $stat = $($symbols.GEAR)
        }
        { $_ -eq "Error" } { 
            $levelColor = "Red"
            $stat = $($symbols.SMILEY_BLACK)
        }
        { $_ -eq "Warning" } {
            $levelColor = "Orange"
        }
        { $_ -eq "Success" } { 
            $levelColor = "Green"
            $stat = $($symbols.CHECKMARK)
        }
        { $_ -eq "Failure" } { 
            $levelColor = "Red"
            $stat = $($symbols.FEMALE)
        }
    }
    
    Write-Host "$stat  " -NoNewline -ForegroundColor Cyan # for Comments  
    Write-Host "$(Get-Date): " -NoNewLine -BackGroundColor "Gray" -ForegroundColor "Black"
    Write-Host " $message   " -NoNewline -ForegroundColor $levelColor
    Write-Host "    " 
}

