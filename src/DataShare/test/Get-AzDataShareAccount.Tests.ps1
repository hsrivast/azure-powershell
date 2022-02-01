if(($null -eq $TestName) -or ($TestName -contains 'Get-AzDataShareAccount'))
{
  $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
  if (-Not (Test-Path -Path $loadEnvPath)) {
      $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
  }
  . ($loadEnvPath)
  $TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzDataShareAccount.Recording.json'
  $currentPath = $PSScriptRoot
  while(-not $mockingPath) {
      $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
      $currentPath = Split-Path -Path $currentPath -Parent
  }
  . ($mockingPath | Select-Object -First 1).FullName
}

Describe 'Get-AzDataShareAccount' {
    It 'List' {
        $accounts = Get-AzDataShareAccount -SubscriptionId $env.SubscriptionId
        $accounts.Count | Should -BeGreaterOrEqual 1
    }

    It 'Get' {
        $account = Get-AzDataShareAccount -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId
        $account.Name | Should -Be $env.accountName
    }

    It 'List1' {
        $accounts = Get-AzDataShareAccount -SubscriptionId $env.SubscriptionId -ResourceGroupName $env.resourceGroupName
        $accounts.Count | Should -BeGreaterOrEqual 1
    }

    It 'GetViaIdentity' {
        $obj = Get-AzDataShareAccount -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId
        $account = Get-AzDataShareAccount -InputObject $obj
        $account.Name | Should -Be $env.accountName
    }
}
