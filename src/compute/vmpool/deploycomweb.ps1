#upload scripts used during VM Provisioning
.\uploadscripts.ps1

#Provision Prod Commerce Web Servers
New-AzureRmResourceGroupDeployment -Name comwebprod -ResourceGroupName rgCOM-WEB-CENTRAL -TemplateFile ./vmpoolilb.json -TemplateParameterFile ./comprod/web.parameters.json -DeploymentDebugLogLevel All