@{
  GUID = '45c6feae-0fc6-4049-ace9-cb2fadfb72ad'
  RootModule = './Az.DataShare.psm1'
  ModuleVersion = '2.0.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: DataShare cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.DataShare.private.dll'
  FormatsToProcess = './Az.DataShare.format.ps1xml'
  FunctionsToExport = 'Get-AzDataShare', 'Get-AzDataShareAccount', 'Get-AzDataShareConsumerInvitation', 'Get-AzDataShareConsumerSourceDataSet', 'Get-AzDataShareDataSet', 'Get-AzDataShareDataSetMapping', 'Get-AzDataShareInvitation', 'Get-AzDataShareProviderShareSubscription', 'Get-AzDataShareSubscription', 'Get-AzDataShareSubscriptionSourceShareSynchronizationSetting', 'Get-AzDataShareSubscriptionSynchronization', 'Get-AzDataShareSubscriptionSynchronizationDetail', 'Get-AzDataShareSynchronization', 'Get-AzDataShareSynchronizationDetail', 'Get-AzDataShareSynchronizationSetting', 'Get-AzDataShareTrigger', 'Initialize-AzDataShareEmailRegistrationEmail', 'Invoke-AzDataShareAdjustProviderShareSubscription', 'Invoke-AzDataShareReinstateProviderShareSubscription', 'Invoke-AzDataShareRejectConsumerInvitation', 'New-AzDataShare', 'New-AzDataShareAccount', 'New-AzDataShareADLSGen1FileDataSetObject', 'New-AzDataShareADLSGen1FolderDataSetObject', 'New-AzDataShareADLSGen2FileDataSetMappingObject', 'New-AzDataShareADLSGen2FileDataSetObject', 'New-AzDataShareADLSGen2FileSystemDataSetMappingObject', 'New-AzDataShareADLSGen2FileSystemDataSetObject', 'New-AzDataShareADLSGen2FolderDataSetMappingObject', 'New-AzDataShareADLSGen2FolderDataSetObject', 'New-AzDataShareBlobContainerDataSetMappingObject', 'New-AzDataShareBlobContainerDataSetObject', 'New-AzDataShareBlobDataSetMappingObject', 'New-AzDataShareBlobDataSetObject', 'New-AzDataShareBlobFolderDataSetMappingObject', 'New-AzDataShareBlobFolderDataSetObject', 'New-AzDataShareDataSet', 'New-AzDataShareDataSetMapping', 'New-AzDataShareInvitation', 'New-AzDataShareKustoClusterDataSetMappingObject', 'New-AzDataShareKustoClusterDataSetObject', 'New-AzDataShareKustoDatabaseDataSetMappingObject', 'New-AzDataShareKustoDatabaseDataSetObject', 'New-AzDataShareKustoTableDataSetMappingObject', 'New-AzDataShareKustoTableDataSetObject', 'New-AzDataShareScheduledSourceSynchronizationSettingObject', 'New-AzDataShareScheduledSynchronizationSettingObject', 'New-AzDataShareScheduledTriggerObject', 'New-AzDataShareSqlDBTableDataSetMappingObject', 'New-AzDataShareSqlDBTableDataSetObject', 'New-AzDataShareSqlDWTableDataSetMappingObject', 'New-AzDataShareSqlDWTableDataSetObject', 'New-AzDataShareSubscription', 'New-AzDataShareSynapseWorkspaceSqlPoolTableDataSetMappingObject', 'New-AzDataShareSynapseWorkspaceSqlPoolTableDataSetObject', 'New-AzDataShareSynchronizationSetting', 'New-AzDataShareTrigger', 'Register-AzDataShareEmailRegistrationEmail', 'Remove-AzDataShare', 'Remove-AzDataShareAccount', 'Remove-AzDataShareDataSet', 'Remove-AzDataShareDataSetMapping', 'Remove-AzDataShareInvitation', 'Remove-AzDataShareSubscription', 'Remove-AzDataShareSynchronizationSetting', 'Remove-AzDataShareTrigger', 'Revoke-AzDataShareProviderShareSubscription', 'Stop-AzDataShareSubscriptionSynchronization', 'Sync-AzDataShareSubscription', 'Update-AzDataShareAccount', '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'DataShare'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}
