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

- **`-AsString Short`** gives shorter string representing team. It includes country code and part of information.
- **`-AsString Full`** gives longer string representing team. It includes full country name and detailed standings information.

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

String specifying country for which we need information. It can be provided as three lettered abbreviation or as full country name.
More countries can be specified with comma separated list.

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
