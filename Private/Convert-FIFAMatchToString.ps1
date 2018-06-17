function Convert-FIFAMatchToString {
    param (

        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [PSObject[]]$Match, 

        [AsStringOptions]$Type 
    )

    foreach ($M1 in $Match) {

        switch ($Type) {

            'Short' {
                switch ($M1.status) {
                    'completed' {$M1.home_team.code + '-' + $M1.away_team.code + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals}
                    'in progress' {$M1.home_team.code + '-' + $M1.away_team.code + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals + ' (' + $M1.time + ')'}
                    'future' {$M1.home_team.code + '-' + $M1.away_team.code + ' (' + (Get-Date ($M1.datetime) -Format t) + ')'}
                    default {Write-Error ('Unknown match status ' + $M1.home_team.code + '-' + $M1.away_team.code + ', status: ' + $M1.status)}
                }
            }

            'Full' {
                switch ($M1.status) {
                    'completed' {$M1.home_team.country + ' - ' + $M1.away_team.country + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals}
                    'in progress' {$M1.home_team.country + ' - ' + $M1.away_team.country + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals + ' (' + $M1.time + ')'}
                    'future' {$M1.home_team.country + ' - ' + $M1.away_team.country + '  (' + (Get-Date ($M1.datetime) -Format t) + ')'}
                    default {Write-Error ('Unknown match status ' + $M1.home_team.country + '-' + $M1.away_team.country + ', status: ' + $M1.status)}
                }
            }

            'Events' {
                Convert-FIFAMatchToString $Match 'Full'
                Get-FIFAMatchStatistics $Match
            }

            'Default' {
                throw "Unknown string type $Type"
            }

        } # end switch $Type

    } # end foreach    

}
