$mgmtgroup = "worldview"
$mgmtgroupdisplayname = "worldview group"
$tenantid = ""
$subscriptionId = ""

#Create new management group
New-AzureRmManagementGroup -GroupName $mgmtgroup -DisplayName $mgmtgroupdisplayname -ParentId $tenantid


#move subscription into the management group
New-AzureRmManagementGroupSubscription -GroupName $mgmtgroup -SubscriptionId $subscriptionId