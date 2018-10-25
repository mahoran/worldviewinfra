#upload scripts used during VM Provisioning
.\uploadscripts.ps1

#Provision Prod Commerce App Servers
New-AzureRmResourceGroupDeployment -Name comprocprod -ResourceGroupName rgCOM-PROC-CENTRAL -TemplateFile ./vmpool.json -TemplateParameterFile ./comprod/proc.parameters.json -DeploymentDebugLogLevel All