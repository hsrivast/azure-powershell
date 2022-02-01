if(($null -eq $TestName) -or ($TestName -contains 'Get-AzDataShare'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzDataShare.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzDataShare' {
    It 'List' {
        $shares = Get-AzDataShare -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId
        $shares.Count | Should -BeGreaterOrEqual 1
    }

    It 'Get' {
        $share = Get-AzDataShare -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -Name $env.shareName
        $share.Name | Should -Be $env.shareName
    }

    It 'GetViaIdentity' {
        $obj = Get-AzDataShare -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -Name $env.shareName
        $share = Get-AzDataShare -InputObject $obj
        $share.Name | Should -Be $env.shareName
    }
}
