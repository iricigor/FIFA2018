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