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

$CommandName = 'Get-FIFAToday'
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

    Push-Location $PSScriptRoot
    # It 'Running command should not throw an error' {
    #     {Get-FIFAToday -wa SilentlyContinue} | Should -Not -Throw
    # }
    # TODO: Remove test above once mocked one is done

    # Mock real API calls
    Mock Get-FIFAEndpoint -ModuleName FIFA2018 -ParameterFilter {$EndPoint -eq 'matches/today'} -MockWith {Get-Content '.\Mock-GetToday.json' -Raw | ConvertFrom-Json}

    It 'Should return three results' {
        (Get-FIFAToday).Count | Should -Be 3
    }

    It 'Should parse minutes properly from mocked command' {
        (Get-FIFAToday)[2].time | should -Be "50'"
    }

    Pop-Location
}