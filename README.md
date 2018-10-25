# Worldview Infrastructure Provisioning #
This repository contains infrastructure as code necessary to setup Worldview applications in Azure platform.
 
## Workstation Setup ##
You will need to install Azure PowerShell Command line tools to provision infrastructure.
[https://azure.microsoft.com/en-us/downloads/](https://azure.microsoft.com/en-us/downloads/ "Downloads")
 
----------
Read Getting started with Azure PowerShell guide here. [https://docs.microsoft.com/en-us/powershell/azureps-cmdlets-docs/](https://docs.microsoft.com/en-us/powershell/azureps-cmdlets-docs/ "Getting started with Azure PowerShell cmdlets")
 
----------
Read Azure Resource Manager Language Reference here. [https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates "Authoring Resource Manager Templates")
 
## Template Best Practices ##
Here are some best practices for designing ARM templates.
[https://docs.microsoft.com/en-us/azure/azure-resource-manager/best-practices-resource-manager-design-templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/best-practices-resource-manager-design-templates "ARM Template Best Practices")
 
## Directory Structure ##
All the templates will be stored under src directory.
All the miscellaneous scripts will be stored in src\scripts directory.
For more complex deployments you will find README files in these directories 
----------
 
- KeyVault: src\keyvault
- compute: src\compute
- firewal: src\firewall
- network: src\network
- oms: src\oms
- RecoveryServiceVault: src\recoveryservicevault
- scripts: src\scripts
- storage: src\storage
 
 
## Deploy infrastructure ##
1. Clone the repository to you PC
2. Run PowerShell command console
3. Change your directory to the service you want to provision
4. Update the parameter files for the environment you want to update.
5. Execute the deploy script in the directory. It will prompt you to log into Azure.
 
