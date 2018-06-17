---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFATeamMatches

## SYNOPSIS
Lists all the matches for a given team.

## SYNTAX

```
Get-FIFATeamMatches [-TeamName] <String[]> [[-AsString] <AsStringOptions>] [<CommonParameters>]
```

## DESCRIPTION
Lists all the matches for a given team. Team can be specified either as three letter abbreviation or as full country name.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FIFATeamMatches BRA Full
```

```text
Brazil - Costa Rica  (Fri 22.Jun 14:00)
Brazil - Switzerland 1:1  (Sun 17.Jun 20:00)
Serbia - Brazil  (Wed 27.Jun 20:00)
```

Lists all scheduled matches of Brazil. For past matches results are also displayed.

## PARAMETERS

### -AsString
If parameter `-AsString` is not specified, functions return JSON object as provided by parent API.

- **`-AsString Short`** gives short names for countries and result. For live matches, it will display current match time. If match is not yet started, it will display match start time.
- **`-AsString Full`** gives full names for countries and result. For live and future matches, it applies the same logic as short.
- **`-AsString Events`** gives full names for countries and result, followed by chronological list of events from the match.

```yaml
Type: AsStringOptions
Parameter Sets: (All)
Aliases:
Accepted values: Short, Full, Events

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamName
{{Fill TeamName Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
