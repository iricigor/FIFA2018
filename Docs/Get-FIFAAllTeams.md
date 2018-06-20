---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFAAllTeams

## SYNOPSIS
Lists all teams in FIFA 2018 championship.

## SYNTAX

```
Get-FIFAAllTeams [[-AsString] <AsStringOptions>] [<CommonParameters>]
```

## DESCRIPTION
Lists all teams in FIFA 2018 championship. Useful if you would need to generate some bigger reports.
Teams can be listed in JSON, or as string in short format (i.e. BRA) or full format (i.e. Brazil)

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FIFAAllTeams Full
```

Lists all 32 teams from FIFA 2018 championship.

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
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
