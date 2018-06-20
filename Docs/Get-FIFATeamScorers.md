---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFATeamScorers

## SYNOPSIS
Lists all players that scored goal for a given country.

## SYNTAX

```
Get-FIFATeamScorers [-TeamName] <String[]> [[-AsString] <AsStringOptions>] [<CommonParameters>]
```

## DESCRIPTION
Lists all players that scored goal for a given country.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FIFATeamScorers Portugal Full
```

```text
CRISTIANO RONALDO (Portugal) Portugal vs Spain 3:3  (8:00 PM) - 4'
CRISTIANO RONALDO (Portugal) Portugal vs Spain 3:3  (8:00 PM) - 44'
CRISTIANO RONALDO (Portugal) Portugal vs Spain 3:3  (8:00 PM) - 88'
CRISTIANO RONALDO (Portugal) Portugal vs Morocco 1:0 (90'+5') - 4'
```

### Example 2
```powershell
PS C:\> (Get-FIFAAllTeams).fifa_code | Get-FIFATeamScorers | Group player,country | ? Count -gt 1 | Sort-Object Count -Desc | Select Name, Count
```

```text
Name                   Count
----                   -----
CRISTIANO RONALDO, POR     4
Denis CHERYSHEV, RUS       3
Diego COSTA, ESP           2
Artem DZYUBA, RUS          2
Romelu LUKAKU, BEL         2
Harry KANE, ENG            2
Thiago CIONEK, POL         2
```

You can get always accurate list of top scorers!

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
