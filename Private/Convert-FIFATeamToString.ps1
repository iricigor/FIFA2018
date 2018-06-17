function Convert-FIFATeamToString {

    param (

        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [PSObject[]]$Team,

        [AsStringOptions]$Type
    )

    foreach ($T1 in $Team) {

        switch ($Type) {

            'Short' {$T1.fifa_code + ' (' + $T1.group_letter + ') ' + (positive $T1.goal_differential) + ' ' + $T1.points}

            'Full' {$T1.country + ' (group ' + $T1.group_letter + ') ' + $T1.wins + ' ' + $T1.draws + ' ' + $T1.losses + ' ' + $T1.goals_for + ':' + $T1.goals_against + ' (' + (positive $T1.goal_differential) + ') ' + $T1.points + 'pts'}

            'Events' {throw 'Events format not supported for teams'}
            Default {throw "Unknown string type $Type"}

        } # end switch
    } # end foreach $Match

}