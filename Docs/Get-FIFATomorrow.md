---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFATomorrow

## SYNOPSIS
Lists all matches scheduled for tomorrow.

## SYNTAX

```
Get-FIFATomorrow [[-AsString] <AsStringOptions>] [<CommonParameters>]
```

## DESCRIPTION
Function lists all football matches scheduled for the next day.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FIFATomorrow Full
```

```text
Sweden - Korea Republic  (02:00 PM)
Belgium - Panama  (05:00 PM)
Tunisia - England  (08:00 PM)
```

Lists all matches scheduled for tomorrow including their start times.

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
