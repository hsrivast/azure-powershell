if(($null -eq $TestName) -or ($TestName -contains 'Get-AzDataShareConsumerInvitation'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzDataShareConsumerInvitation.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzDataShareConsumerInvitation' {
    It 'List' {
        $invitations = Get-AzDataShareConsumerInvitation
        $invitations.Count | Should -BeGreaterOrEqual 2
    }

    It 'Get' {
        $invitation = Get-AzDataShareConsumerInvitation -InvitationId $env.invitationIdWithEmail -Location $env.location
        $invitation.Name | Should -Be $env.invitationNameWithEmail
    }

    It 'GetViaIdentity' {
        $obj = Get-AzDataShareConsumerInvitation -InvitationId $env.invitationIdWithDirectory -Location $env.location
        $invitation = Get-AzDataShareConsumerInvitation -InputObject $obj
        $invitation.Name | Should -Be $env.invitationNameWithDirectory
    }
}
