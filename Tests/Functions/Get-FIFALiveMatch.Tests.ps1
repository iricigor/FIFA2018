#
# Fake test
#

Describe "Fake-Test" {
    It "Should be fixed by developer" {
        $true | Should -Be $true
    }
}

#
# Check definition
#

$CommandName = 'Get-FIFALiveMatch'
$ParameterNames = @('AsString')

Describe "Function-$CommandName-Definition" {

    $CmdDef = Get-Command -Name $CommandName -Module $ModuleName -ea 0
    $CmdFake = Get-Command -Name 'FakeCommandName' -Module $ModuleName -ea 0

    It "Command should exist" {
        $CmdDef | Should -Not -Be $null
        $CmdFake | Should -Be $null
    }

    It 'Command should have parameters' {
        $CmdDef.Parameters.Keys | Should -Not -Contain 'FakeParameterName'
        foreach ($P1 in $ParameterNames) {
            $CmdDef.Parameters.Keys | Should -Contain $P1
        }
    }
}



#
# Check functionality, real tests
#

Describe "Function-$CommandName-Functionality" {

    # It 'Running command should not throw an error' {
    #     {Get-FIFALiveMatch -wa SilentlyContinue} | Should -Not -Throw
    # }

    Push-Location $PSScriptRoot
    # Mock real API calls
    Mock Get-FIFAEndpoint -ModuleName FIFA2018 -ParameterFilter {$EndPoint -eq 'matches/today'} -MockWith {Get-Content '.\Mock-GetToday.json' -Raw | ConvertFrom-Json}

    It 'Should return one result' {
        @((Get-FIFALiveMatch).time).Count | Should -Be 1
    }

    It 'Should parse minutes properly from mocked command' {
        (Get-FIFALiveMatch).time | should -Be "50'"
    }

    Pop-Location
    
}