function Get-FIFAAllTeams {
    
    # returns list of all groups

    [CmdletBinding()]

    param (
        [AsStringOptions]$AsString
    )

    $Teams = Get-FIFAEndpoint 'teams/results'

    # return value
    if ($AsString) {
        Convert-FIFATeamToString $Teams $AsString
    } else {
        $Teams
    }
    
}