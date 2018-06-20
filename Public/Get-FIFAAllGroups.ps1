function Get-FIFAAllGroups {
    
    # returns list of all groups

    [CmdletBinding()]

    param ()

    $Response = Get-FIFAEndpoint 'teams/group_results'

    # return value
    $Response.group.letter
    
}