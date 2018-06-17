---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFALiveMatch

## SYNOPSIS
Gets details about currently live match(es).

## SYNTAX

```
Get-FIFALiveMatch [[-AsString] <AsStringOptions>] [<CommonParameters>]
```

## DESCRIPTION
Gets details about currently live match. If there is more than one match, it will return both of them.
Match details can be obtained in JSON format or as string in one of the predefined formats, based on parameter `-AsString`.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-FIFALiveMatch Full
```

```text
Brazil - Switzerland 1:0 (34')
```

Returns details about currently running match. For parameter explanation see parameter `-AsString` below.

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
