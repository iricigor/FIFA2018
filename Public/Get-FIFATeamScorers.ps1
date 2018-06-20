function Get-FIFATeamScorers {

    [CmdletBinding()]
    param (
        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$TeamName,

        [AsStringOptions]$AsString
    )

    BEGIN {
        $AllMatches = Get-FIFAEndpoint 'matches' 
        Write-Verbose "Read $($AllMatches.Count) matches"
    }

    PROCESS {
        foreach ($T1 in $TeamName) {
            $ListOfGoals = @()
            if ($TeamName.Count -gt 1) {Write-Verbose "Processing team $T1"}
            
            foreach ($M1 in $AllMatches) {
                $GoalEvents = @()
                if (($M1.home_team.code -eq $T1) -or ($M1.home_team.country -eq $T1)) {
                    $GoalEvents = $M1.home_team_events | ? type_of_event -like 'goal*'
                }
                if (($M1.away_team.code -eq $T1) -or ($M1.away_team.country -eq $T1)) {
                    $GoalEvents = $M1.away_team_events | ? type_of_event -like 'goal*'
                }
                if ($GoalEvents) {Write-Verbose "Processing match $(Convert-FIFAMatchToString $M1 Short) with $(@($GoalEvents).Count) goals"}
                foreach ($Goal in $GoalEvents) {
                    $ListOfGoals += New-Object PSObject -Property @{
                        country = $T1
                        player = $Goal.player
                        time = $Goal.time
                        match = $M1
                    }
                }
            }

            # return value
            if ($AsString) {
                foreach ($G1 in $ListOfGoals) {
                    switch ($AsString) {
                        'Short' {$G1.player + ' (' + $G1.country + ') ' + (Convert-FIFAMatchToString ($G1.match) $AsString) + ' - ' + $G1.time}
                        'Full' {$G1.player + ' (' + $G1.country + ') ' + (Convert-FIFAMatchToString ($G1.match) $AsString) + ' - ' + $G1.time}
                        'Events' {throw}
                        default {throw}        
                    }
                }
            } else {
                $ListOfGoals
            }
        } # next team
    }

    END {}
}