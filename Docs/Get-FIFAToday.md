---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFAToday

## SYNOPSIS
Lists all today's matches.

## SYNTAX

```
Get-FIFAToday [[-AsString] <AsStringOptions>] [<CommonParameters>]
```

## DESCRIPTION
Function will list all today's FIFA 2018 matches in one of the predefined formats.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FIFAToday Short
```

```
CRC-SRB 0:1
GER-MEX 0:1
BRA-SUI 1:0 (45'+2')
```

Returns brief details about all today's matches.

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
