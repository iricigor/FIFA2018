function Get-FIFAEndpoint {
    param (
        [string]$EndPoint
    )
    Invoke-WebRequest -Uri "http://worldcup.sfg.io/$EndPoint" | Select-Object -Expand Content | ConvertFrom-Json
}
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

function Convert-FIFAMatchToString {
    param (
        [PSObject]$Match, # TODO: Make it accept pipeline
        [string]$Type 
    )
    foreach ($M1 in $Match) {


        switch ($Type) {

            'Short' {
                switch ($M1.status) {
                    'completed' {$M1.home_team.code + '-' + $M1.away_team.code + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals}
                    'in progress' {$M1.home_team.code + '-' + $M1.away_team.code + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals + ' (' + $M1.time + ')'}
                    'future' {$M1.home_team.code + '-' + $M1.away_team.code + ' (not started)'}
                    default {Write-Error ('Unknown match status ' + $M1.home_team.code + '-' + $M1.away_team.code + ', status: ' + $M1.status)}
                }
            }

            'Full' {
                switch ($M1.status) {
                    'completed' {$M1.home_team.country + '-' + $M1.away_team.country + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals}
                    'in progress' {$M1.home_team.country + '-' + $M1.away_team.country + ' ' + $M1.home_team.goals + ':' + $M1.away_team.goals + ' (' + $M1.time + ')'}
                    'future' {$M1.home_team.country + '-' + $M1.away_team.country + ' (not started)'}
                    default {Write-Error ('Unknown match status ' + $M1.home_team.country + '-' + $M1.away_team.country + ', status: ' + $M1.status)}
                }
            }

            'Statistics' {
                Convert-FIFAMatchToString $Match 'Full'
                Get-FIFAMatchStatistics $Match
            }

            'Default' {
                throw "Unknown string type $Type"
            }

        } # end switch $Type

    } # end foreach    

}


function Get-FIFALiveMatch {
    param (
        [string]$AsString
    )

    $Match = Get-FIFAToday | ? Status -eq 'In Progress'
    if ($AsString) {Convert-FIFAMatchToString $Match $AsString}
    else {$Match}
}

function Get-FIFAMatchStatistics {
    param (
        [PSObject]$Match
    )

    foreach ($M1 in $Match) {
        $Events = @()
        $Events += $M1.home_team_events | Select type_of_event,player,
            @{Name = "team"; Expression = {$M1.home_team.code}},
            @{Name = "time"; Expression = {[int]($_.time -replace "'",'')}}
        $Events += $M1.away_team_events | Select type_of_event,player,
            @{Name = "team"; Expression = {$M1.away_team.code}},
            @{Name = "time"; Expression = {[int]($_.time -replace "'",'')}}
    }

    $Events | ? time | Sort-Object time | % {$_.type_of_event + ' ' + $_.player + ' (' + $_.team + ') ' + $_.time + "'"} # converted to string
}