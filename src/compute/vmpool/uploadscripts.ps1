<#
    Script to upload files used by VM Custom Script Extension to Azure Storage.
    This script needs to run as part of the deployment
 
    Update the two variables with appropriate values:
    1. $resourceGroupName
    2. $customScriptExtensionStorageAccountName (this needs to match the value in template parameter file
#>
 
$resourceGroupName = "rgMGMT-CENTRAL"  #TODO: Update this variable value
$customScriptExtensionStorageAccountName = "worldviewartf01" #TODO: Update this variable value
 
$scriptDir = "$PSScriptRoot\scripts"
 
$containerName = "script"
 
 
# Get the storage account key
$storageAccountKey = (Get-AzureRmStorageAccountKey -ResourceGroupName $resourceGroupName -Name $customScriptExtensionStorageAccountName)[0].Value
# Create the storage context object (authenticates to the Azure Storage REST API)
$destContext = New-AzureStorageContext -StorageAccountName $customScriptExtensionStorageAccountName -StorageAccountKey $storageaccountkey
 
#Get Container Object
$containerObj = Get-AzureStorageContainer -Context $destContext | Where-Object { $_.Name -eq $containerName }
 
if ($containerObj -eq $null)
{
#Container does not exist so create it
   New-AzureStorageContainer -Name $containerName -Context $destContext
}
 
# Upload the file from local computer's filesystem to the Blob Container
$filePath = "$($scriptDir)\setupserver.ps1"
$blobName = Split-Path -Path $filePath -Leaf
Set-AzureStorageBlobContent -File $filePath -Container $containerName -Blob $blobName -Context $destContext -Force