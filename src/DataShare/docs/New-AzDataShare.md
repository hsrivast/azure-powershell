---
external help file:
Module Name: Az.DataShare
online version: https://docs.microsoft.com/powershell/module/az.datashare/new-azdatashare
schema: 2.0.0
---

# New-AzDataShare

## SYNOPSIS
Create a share

## SYNTAX

### CreateExpanded (Default)
```
New-AzDataShare -AccountName <String> -Name <String> -ResourceGroupName <String> [-SubscriptionId <String>]
 [-Description <String>] [-ShareKind <ShareKind>] [-Term <String>] [-DefaultProfile <PSObject>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

### Create
```
New-AzDataShare -AccountName <String> -Name <String> -ResourceGroupName <String> -Share <IShare>
 [-SubscriptionId <String>] [-DefaultProfile <PSObject>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### CreateViaIdentity
```
New-AzDataShare -InputObject <IDataShareIdentity> -Share <IShare> [-DefaultProfile <PSObject>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

### CreateViaIdentityExpanded
```
New-AzDataShare -InputObject <IDataShareIdentity> [-Description <String>] [-ShareKind <ShareKind>]
 [-Term <String>] [-DefaultProfile <PSObject>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Create a share

## EXAMPLES

### Example 1: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

### Example 2: {{ Add title here }}
```powershell
PS C:\> {{ Add code here }}

{{ Add output here }}
```

{{ Add description here }}

## PARAMETERS

### -AccountName
The name of the share account.

```yaml
Type: System.String
Parameter Sets: Create, CreateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: (All)
Aliases: AzureRMContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Share description.

```yaml
Type: System.String
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Identity Parameter
To construct, see NOTES section for INPUTOBJECT properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.IDataShareIdentity
Parameter Sets: CreateViaIdentity, CreateViaIdentityExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
The name of the share.

```yaml
Type: System.String
Parameter Sets: Create, CreateExpanded
Aliases: ShareName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The resource group name.

```yaml
Type: System.String
Parameter Sets: Create, CreateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Share
A share data transfer object.
To construct, see NOTES section for SHARE properties and create a hash table.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.Api20210801.IShare
Parameter Sets: Create, CreateViaIdentity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ShareKind
Share kind.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Support.ShareKind
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
The subscription identifier

```yaml
Type: System.String
Parameter Sets: Create, CreateExpanded
Aliases:

Required: False
Position: Named
Default value: (Get-AzContext).Subscription.Id
Accept pipeline input: False
Accept wildcard characters: False
```

### -Term
Share terms.

```yaml
Type: System.String
Parameter Sets: CreateExpanded, CreateViaIdentityExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.Api20210801.IShare

### Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.IDataShareIdentity

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.Api20210801.IShare

## NOTES

ALIASES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


INPUTOBJECT <IDataShareIdentity>: Identity Parameter
  - `[AccountName <String>]`: The name of the share account.
  - `[DataSetMappingName <String>]`: The name of the dataSetMapping.
  - `[DataSetName <String>]`: The name of the dataSet.
  - `[Id <String>]`: Resource identity path
  - `[InvitationId <String>]`: An invitation id
  - `[InvitationName <String>]`: The name of the invitation.
  - `[Location <String>]`: Location of the invitation
  - `[ProviderShareSubscriptionId <String>]`: To locate shareSubscription
  - `[ResourceGroupName <String>]`: The resource group name.
  - `[ShareName <String>]`: The name of the share.
  - `[ShareSubscriptionName <String>]`: The name of the shareSubscription.
  - `[SubscriptionId <String>]`: The subscription identifier
  - `[SynchronizationSettingName <String>]`: The name of the synchronizationSetting.
  - `[TriggerName <String>]`: The name of the trigger.

SHARE <IShare>: A share data transfer object.
  - `[SystemDataCreatedAt <DateTime?>]`: The timestamp of resource creation (UTC).
  - `[SystemDataCreatedBy <String>]`: The identity that created the resource.
  - `[SystemDataCreatedByType <CreatedByType?>]`: The type of identity that created the resource.
  - `[SystemDataLastModifiedAt <DateTime?>]`: The type of identity that last modified the resource.
  - `[SystemDataLastModifiedBy <String>]`: The identity that last modified the resource.
  - `[SystemDataLastModifiedByType <LastModifiedByType?>]`: The type of identity that last modified the resource.
  - `[Description <String>]`: Share description.
  - `[Kind <ShareKind?>]`: Share kind.
  - `[Term <String>]`: Share terms.

## RELATED LINKS

