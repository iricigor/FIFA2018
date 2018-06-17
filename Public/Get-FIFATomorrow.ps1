
function Get-FIFATomorrow {

    [CmdletBinding()]

    param (
        [AsStringType]$AsString
    )

    Write-Verbose "AsString = $AsString"
    $Response = Get-FIFAEndpoint 'matches/tomorrow/' 
    if ([string]$AsString) {
        Write-Verbose "Converting and sending output"
        Convert-FIFAMatchToString $Response $AsString
    } else {
        Write-Verbose "Sending output"
        $Response
    }
}

