$storageAccountName = ""
$storageAccountKey = “”
$absoluteUri = “https://md-hrbqkhzdzh5n.blob.core.windows.net/pf022kpxh1zq/abcd?sv=2017-04-17&sr=b&si=4614d999-72e5-4f2e-a883-b85ff302635a&sig=hV1iKG0wpf0G7eflmfnIalD5Zkbq9plhEV2QZ3NodnM%3D”
$destContainer = “vhds”
$blobName = “octbasewin2016.vhd”
$destContext = New-AzureStorageContext –StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey
Start-AzureStorageBlobCopy -AbsoluteUri $absoluteUri -DestContainer $destContainer -DestContext $destContext -DestBlob $blobName