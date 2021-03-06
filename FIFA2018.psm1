[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost','')]
param()

$ModName = 'FIFA2018'
Get-Module $ModName | Remove-Module -Force

Write-Host "`n`n$ModName module import starting`n" -ForegroundColor Cyan

#
# Module definitions
#

enum AsStringOptions {Short = 1; Full = 2; Events = 3}


#
# Import main functions
#

$Public = @(Get-ChildItem (Join-Path $PSScriptRoot 'Public') -Filter *.ps1)
$Private = @(Get-ChildItem (Join-Path $PSScriptRoot 'Private') -Filter *.ps1 -ErrorAction SilentlyContinue)

foreach ($F in ($Private+$Public) ) {

    Write-Host ("Importing $($F.Name)... ") -NoNewline

    try {
        . ($F.FullName)
        Write-Host '  OK  ' -ForegroundColor Green
    } catch {
        Write-Host 'FAILED' -ForegroundColor Red
    }
}

Export-ModuleMember -Function $Public.BaseName
Write-Host "Exported $($Public.Count) member(s)"
Export-ModuleMember -Alias *


Write-Host "`nModule is based on API provided by github.com/estiens/world_cup_json"
Write-Host "`nType 'Get-Command -Module $ModName' for list of commands, 'Get-Help <CommandName>' for help, or"
Write-Host "'Get-Command -Module $ModName | Get-Help | Select Name, Synopsis' for explanation on all commands`n"
