if(($null -eq $TestName) -or ($TestName -contains 'Get-AzDataShareSubscription'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzDataShareSubscription.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzDataShareSubscription' {
    It 'List' {
        $shareSubscriptions = Get-AzDataShareSubscription -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId
        $shareSubscriptions.Count | Should -BeGreaterOrEqual 1
    }

    It 'Get' {
        $shareSubscription = Get-AzDataShareSubscription -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -Name $env.shareSubscriptionName
        $shareSubscription.Name | Should -Be $env.shareSubscriptionName
    }

    It 'GetViaIdentity' {
        $obj = Get-AzDataShareSubscription -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -Name $env.shareSubscriptionName
        $shareSubscription = Get-AzDataShareSubscription -InputObject $obj
        $shareSubscription.Name | Should -Be $env.shareSubscriptionName
    }
}
