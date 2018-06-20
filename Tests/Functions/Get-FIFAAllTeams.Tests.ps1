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

$CommandName = 'Get-FIFAAllTeams'
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

    It 'Running command should not throw an error' {
        {Get-FIFAAllTeams -wa SilentlyContinue} | Should -Not -Throw
    }
}