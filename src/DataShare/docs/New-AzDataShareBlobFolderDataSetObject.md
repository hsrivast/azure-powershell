---
external help file:
Module Name: Az.DataShare
online version: https://docs.microsoft.com/powershell/module/az.DataShare/new-AzDataShareBlobFolderDataSetObject
schema: 2.0.0
---

# New-AzDataShareBlobFolderDataSetObject

## SYNOPSIS
Create an in-memory object for BlobFolderDataSet.

## SYNTAX

```
New-AzDataShareBlobFolderDataSetObject -ContainerName <String> -Kind <DataSetKind> -Prefix <String>
 -ResourceGroup <String> -StorageAccountName <String> -SubscriptionId <String>
 [-SystemDataCreatedAt <DateTime>] [-SystemDataCreatedBy <String>] [-SystemDataCreatedByType <CreatedByType>]
 [-SystemDataLastModifiedAt <DateTime>] [-SystemDataLastModifiedBy <String>]
 [-SystemDataLastModifiedByType <LastModifiedByType>] [<CommonParameters>]
```

## DESCRIPTION
Create an in-memory object for BlobFolderDataSet.

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

### -ContainerName
Container that has the file path.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Kind
Kind of data set.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Support.DataSetKind
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Prefix
Prefix for blob folder.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroup
Resource group of storage account.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StorageAccountName
Storage account name of the source data set.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
Subscription id of storage account.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemDataCreatedAt
The timestamp of resource creation (UTC).

```yaml
Type: System.DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemDataCreatedBy
The identity that created the resource.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemDataCreatedByType
The type of identity that created the resource.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Support.CreatedByType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemDataLastModifiedAt
The type of identity that last modified the resource.

```yaml
Type: System.DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemDataLastModifiedBy
The identity that last modified the resource.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SystemDataLastModifiedByType
The type of identity that last modified the resource.

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Support.LastModifiedByType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.Api20210801.BlobFolderDataSet

## NOTES

ALIASES

## RELATED LINKS

