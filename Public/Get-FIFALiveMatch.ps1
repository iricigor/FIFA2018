function Get-FIFALiveMatch {

    # returns live match details
    # if no match, it returns warning
    
    param (
        [AsStringOptions]$AsString
    )

    $Match = Get-FIFAToday | ? Status -eq 'In Progress'
    if (!$Match) {
        Write-Warning "No match in progress."
    } else {
        if ($AsString) {Convert-FIFAMatchToString $Match $AsString}
        else {$Match}    
    }
}
