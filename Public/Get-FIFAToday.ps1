
function Get-FIFAToday {
    param (
        [string]$AsString
    )
    $Response = Get-FIFAEndpoint 'matches/today' 
    if ($AsString) {
        Convert-FIFAMatchToString $Response $AsString
    } else {
        $Response
    }
}




