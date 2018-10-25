#upload scripts used during VM Provisioning
.\uploadscripts.ps1

#Provision Prod Commerce App Servers
New-AzureRmResourceGroupDeployment -Name comappprod -ResourceGroupName rgCOM-APP-CENTRAL -TemplateFile ./vmpoolilb.json -TemplateParameterFile ./comprod/app.parameters.json -DeploymentDebugLogLevel All