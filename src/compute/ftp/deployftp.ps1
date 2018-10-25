#upload scripts used during VM Provisioning
.\uploadscripts.ps1

#Provision Prod FTP Gateway servers
New-AzureRmResourceGroupDeployment -Name ftpgatewayprod -ResourceGroupName rgMOVE-IT -TemplateFile ./ftpgtwyservers.json -TemplateParameterFile ./dmzprod/gateway.parameters.json -DeploymentDebugLogLevel All


#Provision Prod FTP Node servers
New-AzureRmResourceGroupDeployment -Name ftpnodeprod -ResourceGroupName rgMOVE-IT -TemplateFile ./ftpnodeservers.json -TemplateParameterFile ./dmzprod/node.parameters.json -DeploymentDebugLogLevel All