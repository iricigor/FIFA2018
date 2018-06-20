#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests.
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#

#
# Import module
#

$ModuleName = 'FIFA2018'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path # test folder
$root = (get-item $here).Parent.FullName                # module root folder
Import-Module (Join-Path $root "$ModuleName.psd1") -Force

#
# Display troubleshooting variables
#

if ($Env:APPVEYOR) {
    "Checking environment details`n" | Out-Host
    $PSVersionTable | Out-Host
    Get-Module | Out-Host
    Get-Module -ListAvailable PowerShellGet,PackageManagement | Out-Host
    Get-PackageProvider | Out-Host
    Get-PackageProvider -ListAvailable  | Out-Host
}

#
# Fake test
#

Describe "Fake-Test" {
    It "Should be fixed by developer" {
        $true | Should -Be $true
    }
}


#
# Module should import two functions
#


Describe 'Proper Declarations' {

    It 'Checks for existence of functions' {
        @(Get-Command -Module $ModuleName -CommandType Function).Count | Should -Be 8 -Because 'We should have six functions defined'
        Get-Command Get-FIFAToday -ea 0 | Should -Not -Be $Null
        Get-Command Get-FIFALiveMatch -ea 0 | Should -Not -Be $Null
        Get-Command Get-FIFATomorrow -ea 0 | Should -Not -Be $Null
        Get-Command Get-FIFATeamStanding -ea 0 | Should -Not -Be $Null
        Get-Command Get-FIFAGroupStanding -ea 0 | Should -Not -Be $Null
        Get-Command Get-FIFATeamMatches -ea 0 | Should -Not -Be $Null
        Get-Command Get-FIFAAllTeams -ea 0 | Should -Not -Be $Null
        Get-Command Get-FIFAAllGroups -ea 0 | Should -Not -Be $Null
        Get-Command NonExistingCommand -ea 0 | Should -Be $Null
    }

   It 'Checks for Aliases' {
       @(Get-Command -Module $ModuleName -CommandType Alias).Count | Should -Be 0 -Because 'We have no aliases defined'
       Get-Alias NenExistingAlias -ea 0 | Should -Be $null
   }
}


#
# Check if documentation is proper
#

Describe 'Proper Documentation' {

	It 'Updates documentation and does git diff' {
		# install PlatyPS
        # Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
        if (!(Get-Module platyPS -List -ea 0)) {Install-Module platyPS -Force -Scope CurrentUser}
		Import-Module platyPS
		# update documentation
		Push-Location -Path $root
        Update-MarkdownHelp -Path .\Docs
        New-ExternalHelp -Path .\Docs -OutputPath .\en-US -Force
        $diff = git diff .\Docs .\en-US
        Pop-Location
		$diff | Should -Be $null
	}
}

Describe 'ScriptAnalyzer Tests' {
    it 'Checks script and finds no errors' {
        # Install PSScriptAnalyzer
        if (!(Get-Module PSScriptAnalyzer -List -ea 0)) {Install-Module PSScriptAnalyzer -Force -Scope CurrentUser}
        Import-Module PSScriptAnalyzer
        # Check code
        $SA = Invoke-ScriptAnalyzer -Path $root -Recurse
        $SA | ? Severity -eq 'Error' | Should -Be $null
    }
}
