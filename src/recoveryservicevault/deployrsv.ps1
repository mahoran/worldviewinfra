New-AzureRmResourceGroupDeployment -Name createcomsrv -ResourceGroupName rgCOM-WEB-CENTRAL -TemplateFile .\rsv.json -TemplateParameterFile .\prod\com.parameters.json -DeploymentDebugLogLevel All


New-AzureRmResourceGroupDeployment -Name createcomapppolicy -ResourceGroupName rgCOM-WEB-CENTRAL -TemplateFile .\backuppolicy.json -TemplateParameterFile .\prod\comapp.parameters.json -DeploymentDebugLogLevel All


New-AzureRmResourceGroupDeployment -Name createcomprocpolicy -ResourceGroupName rgCOM-WEB-CENTRAL -TemplateFile .\backuppolicy.json -TemplateParameterFile .\prod\comproc.parameters.json -DeploymentDebugLogLevel All


New-AzureRmResourceGroupDeployment -Name createcomftppolicy -ResourceGroupName rgCOM-WEB-CENTRAL -TemplateFile .\backuppolicy.json -TemplateParameterFile .\prod\comftp.parameters.json -DeploymentDebugLogLevel All