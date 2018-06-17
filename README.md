# FIFA2018

[![Build status](https://ci.appveyor.com/api/projects/status/9v6xq9coradp2j5b/branch/master?svg=true)](https://ci.appveyor.com/project/iricigor/fifa2018/branch/master)

This module is a PowerShell wrapper for FIFA results API [estiens/world_cup_json](https://github.com/estiens/world_cup_json).
It gives results / fixtures / statistics about Football World Cup **[FIFA 2018](https://www.fifa.com/worldcup/)** matches.


## Install Instructions

You can install module in two ways:

1. From PowerShell Gallery (preffered way, not implemented yet)

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
```

### -AsString parameter explanation

If parameter `-AsString` is not specified, functions return JSON object as provided by parent API.

**`-AsString Short`** gives short names for countries and result. For live matches, it will display current match time. If match is not yet started, it will display match start time.

**`-AsString Full`** gives full names for countries and result. For live and future matches, it applies the same logic as short.

**`-AsString Events`** gives full names for countries and result, followed by chronological list of events from the match.