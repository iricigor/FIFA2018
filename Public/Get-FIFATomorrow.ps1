
function Get-FIFATomorrow {

    [CmdletBinding()]

    param (
        [AsStringOptions]$AsString
    )

    Write-Verbose "AsString = $AsString"
    $Response = Get-FIFAEndpoint 'matches/tomorrow/'

    if ($AsString) {
        Write-Verbose "Converting and sending output"
        Convert-FIFAMatchToString $Response $AsString
    } else {
        Write-Verbose "Sending output"
        $Response
    }
}

