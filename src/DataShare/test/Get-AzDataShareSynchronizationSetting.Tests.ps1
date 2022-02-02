if(($null -eq $TestName) -or ($TestName -contains 'Get-AzDataShareSynchronizationSetting'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzDataShareSynchronizationSetting.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzDataShareSynchronizationSetting' {
    It 'List' {
        $syncSettings = Get-AzDataShareSynchronizationSetting -SubscriptionId $env.SubscriptionId -ResourceGroupName $env.resourceGroupName -AccountName $env.accountName -ShareName $env.shareName
        $syncSettings.Count | Should -BeGreaterOrEqual 1
    }

    It 'Get' {
        $syncSetting = Get-AzDataShareSynchronizationSetting -SubscriptionId $env.SubscriptionId -ResourceGroupName $env.resourceGroupName -AccountName $env.accountName -ShareName $env.shareName -Name $env.synchronizationSettingName
        $syncSetting.Name | Should -Be $env.synchronizationSettingName
    }

    It 'GetViaIdentity' {
        $obj = Get-AzDataShareSynchronizationSetting -SubscriptionId $env.SubscriptionId -ResourceGroupName $env.resourceGroupName -AccountName $env.accountName -ShareName $env.shareName -Name $env.synchronizationSettingName
        $syncSetting = Get-AzDataShareSynchronizationSetting -InputObject $obj
        $syncSetting.Name | Should -Be $env.synchronizationSettingName
    }
}
