
function Get-FIFATeamStanding {

    param (

        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [String[]]$TeamName,

        [AsStringOptions]$AsString
    )

    BEGIN {
        $Response = Get-FIFAEndpoint 'teams/results'
    }

    PROCESS {
        foreach ($T1 in $TeamName) {

            # find team
            $Team = $Response | ? Country -eq $T1
            if (!$Team) {$Team = $Response | ? fifa_code -eq $T1}
            if (!$Team) {
                Write-Warning "Team $T1 not found"
                continue
            } elseif ($Team.count -gt 1) {
                Write-Warning "Multiple teams found: $($Team.fifa_code -join ',')"
                continue
            }

            # return value
            if ($AsString) {
                Convert-FIFATeamToString $Team $AsString
            } else {
                $Team
            }
        }
    }

    END {
        # no actions
    }
}
