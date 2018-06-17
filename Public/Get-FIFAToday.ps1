
function Get-FIFAToday {
    
    param (
        [AsStringOptions]$AsString
    )
    
    $Response = Get-FIFAEndpoint 'matches/today' 
    if ($AsString) {
        Convert-FIFAMatchToString $Response $AsString
    } else {
        $Response
    }
}




