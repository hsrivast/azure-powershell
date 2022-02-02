if(($null -eq $TestName) -or ($TestName -contains 'Get-AzDataShareInvitation'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzDataShareInvitation.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzDataShareInvitation' {
    It 'List' {
        $invitations = Get-AzDataShareInvitation -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -ShareName $env.shareName
        $invitations.Count | Should -BeGreaterOrEqual 1
    }

    It 'Get' {
        $invitation = Get-AzDataShareInvitation -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -ShareName $env.shareName -Name $env.invitationNameWithDirectory
        $invitation.Name | Should -Be $env.invitationNameWithDirectory
    }

    It 'GetViaIdentity' {
        $obj = Get-AzDataShareInvitation -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -ShareName $env.shareName -Name $env.invitationNameWithDirectory
        $invitation = Get-AzDataShareInvitation -InputObject $obj
        $invitation.Name | Should -Be $env.invitationNameWithDirectory
    }
}
