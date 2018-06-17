
function Get-FIFAGroupStanding {
    
    param (
        
        [parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [Alias('GroupName')][char[]]$GroupLetter,
        
        [AsStringOptions]$AsString
    )
    
    BEGIN {
        $Response = Get-FIFAEndpoint 'teams/group_results' 
    }

    PROCESS {
        foreach ($G1 in $GroupLetter) {
            
            # find team
            $Group = $Response | Where-Object {$_.group.letter -eq $G1} | Select -Expand Group
            if (!$Group) {
                Write-Warning "Group $G1 not found"
                continue
            } elseif ($Group.count -gt 1) {
                Write-Warning "Multiple teams found: $($Group.group.letter -join ',')"
                continue
            }    
            
            $SortedGroup = for ($i =0; $i -lt 4; $i++) {
                New-Object PSObject -Property @{
                    Group = $Group.letter
                    Rank = $i+1
                    Country = $Group.teams.team[$i].country
                    Points = $Group.teams.team[$i].points
                    GoalDifferential = $Group.teams.team[$i].goal_differential
                }
            }

            # return value
            if ($AsString) {
                Convert-FIFATeamToString $Team $AsString
            } else {
                $SortedGroup
            }        
        }
    }

    END {
        # no actions
    }
}
