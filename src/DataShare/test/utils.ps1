function RandomString([bool]$allChars, [int32]$len) {
    if ($allChars) {
        return -join ((33..126) | Get-Random -Count $len | % {[char]$_})
    } else {
        return -join ((48..57) + (97..122) | Get-Random -Count $len | % {[char]$_})
    }
}
$env = @{}
if ($UsePreviousConfigForRecord) {
    $previousEnv = Get-Content (Join-Path $PSScriptRoot 'env.json') | ConvertFrom-Json
    $previousEnv.psobject.properties | Foreach-Object { $env[$_.Name] = $_.Value }
}
# Add script method called AddWithCache to $env, when useCache is set true, it will try to get the value from the $env first.
# example: $val = $env.AddWithCache('key', $val, $true)
$env | Add-Member -Type ScriptMethod -Value { param( [string]$key, [object]$val, [bool]$useCache) if ($this.Contains($key) -and $useCache) { return $this[$key] } else { $this[$key] = $val; return $val } } -Name 'AddWithCache'
function setupEnv() {
    # Preload subscriptionId and tenant from context, which will be used in test
    # as default. You could change them if needed.
    $env.SubscriptionId = (Get-AzContext).Subscription.Id
    $env.Tenant = (Get-AzContext).Tenant.Id
    $env.location = 'eastus'

    $rstr1 = RandomString -allChars $false -len 6
    $rstr2 = RandomString -allChars $false -len 6
    $env.Add("rstr1", $rstr1)
    $env.Add("rstr2", $rstr2)

    $guid1 = "39417cc4-56f4-4c65-865f-0d5de6bf048b"
    $env.Add("guid1", $guid1)
    $guid2 = "04b69dad-541c-4983-9b2b-4aa290c81e53"
    $env.Add("guid2", $guid2)

    $env.Add("consumerResourceGroup", "ads_azure_cli_rg")
    $env.Add("consumerStorageAccount", "azurecliadsconsumersa")
    $env.Add("consumerAccount", "cli_test_consumer_account")

    # Create test resource group
    write-host "Creating test resource group..."
    $resourceGroupName = "ads-pwsh-rg" + $rstr1
    $env.Add("resourceGroupName", $resourceGroupName)
    New-AzResourceGroup -Name $resourceGroupName -Location $env.location
    write-host "Resource Group created"

    # Create provider test account
    write-host "Creating provider test account..."
    $accountName = "ads-pwsh-account" + $rstr1
    $env.Add("accountName", $accountName)
    $account = New-AzDataShareAccount -SubscriptionId $env.SubscriptionId -ResourceGroupName $env.resourceGroupName -Name $accountName -Location $env.location -IdentityType SystemAssigned
    $env.Add("email", $account.UserEmail)
    write-host "Account created"

    # Create share
    write-host "Creating shares..."
    $shareName = "ads-pwsh-share" + $rstr2
    $env.Add("shareName", $shareName)
    $shareDescription = "Test share"
    $env.Add("shareDescription", $shareDescription)
	$shareTerms = "Test terms"
    $env.Add("shareTerms", $shareTerms)
    New-AzDataShare -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -Name $shareName -Description $shareDescription -Term $shareTerms -ShareKind InPlace
    $shareNameCpy = "ads-pwsh-share-copy-based" + $rstr2
    $env.Add("shareNameCpy", $shareNameCpy)
    New-AzDataShare -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -Name $shareNameCpy -Description $shareDescription -Term $shareTerms -ShareKind CopyBased
    write-host "Shares created"

    #Create DataSet
    write-host "Creating dataset..."
    #$dataSetName = "adsdataset" + $rstr2
    #$env.Add("dataSetName", $dataSetName)
    #$containerName = "adscontainer" + $rstr2
    #$env.Add("containerName", $containerName)
    #$storageAccountName = "adsstorage" + $rstr2
    #$env.Add("storageAccountName", $storageAccountName)
    #$dataSetObj = New-AzDataShareBlobContainerDataSetObject -ContainerName $env.containerName -ResourceGroup $env.resourceGroupName -StorageAccountName $env.accountName -SubscriptionId $env.SubscriptionId -Kind "Container"
    #New-AzDataShareDataSet -ResourceGroupName $env.resourceGroupName -AccountName $env.accountName -ShareName $env.shareNameCpy -Name $env.dataSetName -DataSet $dataSetObj
    write-host "DataSet created"

    #Create synchronization setting
    write-host "Creating synchronization setting..."
    $recurrenceInterval = "hour"
    $env.Add("recurrenceInterval", $recurrenceInterval)
    $synchronizationTime = "1/15/2022 12:45:58 PM"
    $env.Add("synchronizationTime", $synchronizationTime)
    $synchronizationSettingName = "ads-pwsh-sync-setting" + $rstr2
    $env.Add("synchronizationSettingName", $synchronizationSettingName)
    $settings = New-AzDataShareScheduledSynchronizationSettingObject -RecurrenceInterval $recurrenceInterval -SynchronizationTime $synchronizationTime
    New-AzDataShareSynchronizationSetting -SubscriptionId $env.SubscriptionId -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -ShareName $env.shareNameCpy -Name $synchronizationSettingName -SynchronizationSetting $settings
    write-host "Synchronization setting created"

    # Create invitations
    write-host "Creating invitations..."
    $invitationNameWithEmail = "ads-pwsh-invitation-email" + $rstr2
    $env.Add("invitationNameWithEmail", $invitationNameWithEmail)
    $invitation = New-AzDataShareInvitation -SubscriptionId $env.SubscriptionId -ResourceGroupName $env.resourceGroupName -AccountName $env.accountName -ShareName $env.shareName  -Name $invitationNameWithEmail -TargetEmail $env.email
    $env.Add("invitationIdWithEmail", $invitation.invitationId)
    $invitationNameWithDirectory = "ads-pwsh-invitation-directory" + $rstr2
    $env.Add("invitationNameWithDirectory", $invitationNameWithDirectory)
    $invitation = New-AzDataShareInvitation -SubscriptionId $env.SubscriptionId -ResourceGroupName $env.resourceGroupName -AccountName $env.accountName -ShareName $env.shareName -Name $invitationNameWithDirectory -TargetActiveDirectoryId $env.Tenant -TargetObjectId $env.guid1
    $env.Add("invitationIdWithDirectory", $invitation.invitationId)
    write-host "Invitations created"

    # Create share Subscription
    write-host "Creating share subscription..."
    $shareSubscriptionName = "ads-share-subscription" + $rstr2
    $env.Add("shareSubscriptionName", $shareSubscriptionName)
    New-AzDataShareSubscription -SubscriptionId $env.SubscriptionId -AccountName $env.accountName -ResourceGroupName $env.resourceGroupName -Name $shareSubscriptionName -InvitationId $env.invitationIdWithEmail -SourceShareLocation $env.location
    write-host "Share subscription created"

    #Create DataSet Mapping
    write-host "Creating dataset mapping..."
    write-host "Dataset mapping created"

    #Create share subscription synchronization
    write-host "Creating share Subscription synchronization..."
    write-host "Share Subscription synchronization created"
    
    #Create Trigger
    write-host "Creating trigger..."
    write-host "Trigger created"

    # For any resources you created for test, you should add it to $env here.
    $envFile = 'env.json'
    if ($TestMode -eq 'live') {
        $envFile = 'localEnv.json'
    }
    set-content -Path (Join-Path $PSScriptRoot $envFile) -Value (ConvertTo-Json $env)
}
function cleanupEnv() {
    # Clean resources you create for testing
    Remove-AzResourceGroup -Name $env.resourceGroupName
}

