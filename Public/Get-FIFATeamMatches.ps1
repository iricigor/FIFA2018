function Get-FIFATeamMatches {
    param (
        
        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$TeamName,

        [AsStringOptions]$AsString
    )

    BEGIN {
        $Response = Get-FIFAEndpoint 'matches'
    }

    PROCESS {
        foreach ($T1 in $TeamName) {

            $TeamMatches = @()
            $TeamMatches += $Response | ? {$_.home_team.code -eq $T1}
            $TeamMatches += $Response | ? {$_.home_team.country -eq $T1}
            $TeamMatches += $Response | ? {$_.away_team.code -eq $T1}
            $TeamMatches += $Response | ? {$_.away_team.country -eq $T1}

            if ($AsString) {
                Convert-FIFAMatchToString $TeamMatches $AsString -ShortDateFormat 'd.M. HH:mm' -FullDateFormat 'ddd d.MMM HH:mm'
            } else {
                $TeamMatches
            }
        }
    }

    END {}
}