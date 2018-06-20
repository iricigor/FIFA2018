# FIFA2018

[![Build status](https://ci.appveyor.com/api/projects/status/9v6xq9coradp2j5b/branch/master?svg=true)](https://ci.appveyor.com/project/iricigor/fifa2018/branch/master)
[![latest version](https://img.shields.io/powershellgallery/v/FIFA2018.svg?label=latest+version)](https://www.powershellgallery.com/packages/FIFA2018)
[![downloads](https://img.shields.io/powershellgallery/dt/FIFA2018.svg?label=downloads)](https://www.powershellgallery.com/packages/FIFA2018)

This module is a PowerShell wrapper for FIFA results API [estiens/world_cup_json](https://github.com/estiens/world_cup_json).
It gives results / fixtures / statistics about Football World Cup **[FIFA 2018](https://www.fifa.com/worldcup/)** matches.

Module was tested with PowerShell Core 6.0.2 on Ubuntu 16.04 and with Windows PowerShell 5.1 on Windows 10.

## Install Instructions

You can install module in two ways:

1. From PowerShell Gallery (preferred way)

```PowerShell
Install-Module FIFA2018 -Scope CurrentUser
```

2. By cloning GitHub repository
```PowerShell
git clone https://github.com/iricigor/FIFA2018.git
Import-Module .\FIFA2018\FIFA2018.psd1 -Force
```

## Examples

By default all commands return data in JSON format for further processing. It can be changed to string(s) using `-AsString` parameter.

```PowerShell
# Get list of todays matches
Get-FIFAToday -AsString Full

# Get current match events
Get-FIFALiveMatch Events
# -AsString is the only parameter, so name can be skipped

# Get short list of tomorrow's matches and their times
Get-FIFATomorrow Short

# Get teams' group standings, multiple teams supported
Get-FIFATeamStanding SRB,CRO Full

# Get group rankings accepts pipeline and it is better to format it as table
'D','E' | Get-FIFAGroupStanding | Format-Table

# List all matches for current world champions on this championship
Get-FIFATeamMatches Germany Full

# You can get always accurate list of top scorers
(Get-FIFAAllTeams).fifa_code | Get-FIFATeamScorers | Group player,country | ? Count -gt 1 | Sort-Object Count -Desc | Select Name, Count
```

For more information, see detailed examples for each command:

- Matches: [Today](Docs/Get-FIFAToday.md), [Tomorrow](Docs/Get-FIFATomorrow.md), [LiveMatch](Docs/Get-FIFALiveMatch.md)
- Teams - Standings, Goals: [TeamStanding](Docs/Get-FIFATeamStanding.md), [GroupStanding](Docs/Get-FIFAGroupStanding.md), [TeamMatches](Docs/Get-FIFATeamMatches.md), [TeamScorers](Docs/Get-FIFATeamScorers.md)
- Lists: [AllTeams](Docs/Get-FIFAAllTeams.md), [AllGroups](Docs/Get-FIFAAllGroups.md)

### -AsString parameter explanation

If parameter `-AsString` is not specified, functions return JSON object as provided by parent API.

**`-AsString Short`** gives short names for countries and result. For live matches, it will display current match time. If match is not yet started, it will display match start time.

**`-AsString Full`** gives full names for countries and result. For live and future matches, it applies the same logic as short.

**`-AsString Events`** gives full names for countries and result, followed by chronological list of events from the match.