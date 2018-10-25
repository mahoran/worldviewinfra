#-------------------------------------------------------------------------
# Copyright (c) Microsoft.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------


$rgName = "rgSHARED-CENTRAL"

# Select Managed VM Image to convert to Premium storage disks

$imageName = "OctBaseWin2016-image-20181008163844"

$image = 
    Get-AzureRmImage `
        -ResourceGroupName $rgName `
        -Name $imageName

$location = 
    $image.Location

# Convert OS disk to default to Premium storage

$osDisk = 
    $image.StorageProfile.OsDisk

$osDisk.StorageAccountType = "Premium_LRS"

# Convert Data disks to default to Premium Storage

$dataDisks =  $image.StorageProfile.DataDisks

for ($i = 0; $i -lt $dataDisks.Count; $i++)
{ 
    $dataDisks[$i].StorageAccountType = "Premium_LRS" 
}

# Enter new name for converted image

$newImageName = 
    Read-Host `
        -Prompt "Enter new name for converted VM image [Enter = ${imageName}-ssd]"

if ($newImageName -eq "") 
{
    $newImageName = "${imageName}-ssd" 
}

# Define new config for converted image

$newImageConfig =  New-AzureRmImageConfig `
        -Location $location `
        -OsDisk $osDisk `
        -DataDisk $dataDisks -Debug 

# Create new image based on converted image config 

New-AzureRmImage `
    -ResourceGroupName $rgName `
    -ImageName $newImageName `
    -Image $newImageConfig -Debug