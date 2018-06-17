---
external help file: FIFA2018-help.xml
Module Name: FIFA2018
online version:
schema: 2.0.0
---

# Get-FIFAGroupStanding

## SYNOPSIS
Gets current standings for given group letter(s).

## SYNTAX

```
Get-FIFAGroupStanding [-GroupLetter] <Char[]> [<CommonParameters>]
```

## DESCRIPTION
Gets current standings for given group letter(s).

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-FIFAGroupStanding E | Format-Table
```

```text
GoalDifferential Group Points Rank Country
---------------- ----- ------ ---- -------
               1 E          3    1 Serbia
               0 E          0    2 Switzerland
               0 E          0    3 Brazil
              -1 E          0    4 Costa Rica
```

Returns current standings for group D. Table formatting is provided with standard PowerShell command Format-Table.

### Example 1

```powershell
Get-FIFAGroupStanding a,b,c,d | ? Rank -eq 1 | Select Group, Country, Points
```

```text
Group Country Points
----- ------- ------
A     Russia       3
B     Iran         3
C     France       3
D     Croatia      3
```

## PARAMETERS

### -GroupLetter

A letter A to H specifying group name. More comma separated leters can be provided.

```yaml
Type: Char[]
Parameter Sets: (All)
Aliases: GroupName

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Char[]


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
