#Prepare the VM parameters
$rgName = "rgSHARED-CENTRAL"
$location = "centralus"
$vnet = "vnetCOMMERCE-CENTRAL"
$subnet = "/subscriptions/d387ee22-63eb-4f23-8d7d-839f802b2260/resourceGroups/rgCOMMERCE-CENTRAL/providers/Microsoft.Network/virtualNetworks/vnetCOMMERCE-CENTRAL/subnets/snCOM-WEB-CENTRAL"
$nicName = "octwinbase02-Nic-01"
$vmName = "octwinbase02"
$osDiskName = "octwinbase02-OSDisk"
$osDiskUri = "https://worldviewshrstg01.blob.core.windows.net/vhds/octbasewin2016.vhd"
$VMSize = "Standard_DS1_V2"
$storageAccountType = "PremiumLRS"
$IPaddress = "10.70.30.25"
#Create the VM resources
$IPconfig = New-AzureRmNetworkInterfaceIpConfig -Name "IPConfig1" -PrivateIpAddressVersion IPv4 -PrivateIpAddress $IPaddress -SubnetId $subnet
$nic = New-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $rgName -Location $location -IpConfiguration $IPconfig
$vmConfig = New-AzureRmVMConfig -VMName $vmName -VMSize $VMSize
$vm = Add-AzureRmVMNetworkInterface -VM $vmConfig -Id $nic.Id
$osDisk = New-AzureRmDisk -DiskName $osDiskName -Disk (New-AzureRmDiskConfig -AccountType $storageAccountType -Location $location -CreateOption Import -SourceUri $osDiskUri) -ResourceGroupName $rgName
$vm = Set-AzureRmVMOSDisk -VM $vm -ManagedDiskId $osDisk.Id -StorageAccountType $storageAccountType -DiskSizeInGB 128 -CreateOption Attach -Windows
$vm = Set-AzureRmVMBootDiagnostics -VM $vm -disable
#Create the new VM
New-AzureRmVM -ResourceGroupName $rgName -Location $location -VM $vm