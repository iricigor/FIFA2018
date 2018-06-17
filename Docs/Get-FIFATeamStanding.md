---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFATeamStanding

## SYNOPSIS
Gets current group standing for a given team.

## SYNTAX

```
Get-FIFATeamStanding [-TeamName] <String[]> [[-AsString] <AsStringOptions>] [<CommonParameters>]
```

## DESCRIPTION
Gets current group standing for a given team. Team can be specified using three-lettered abbreviation or using its full name.
Team details can be obtained in JSON format or as string in one of the predefined formats, based on parameter `-AsString`.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FIFATeamStanding -TeamName SRB -AsString Full
```

```
Serbia (group E) 1 0 0 1:0 (+1) 3pts
```

Gives details about played matches, goals and points for Serbian team.

## PARAMETERS

### -AsString
If parameter `-AsString` is not specified, functions return JSON object as provided by parent API.

- **`-AsString Short`** gives short names for countries and result. For live matches, it will display current match time. If match is not yet started, it will display match start time.
- **`-AsString Full`** gives full names for countries and result. For live and future matches, it applies the same logic as short.

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
