#This script converts PFX file to base64 encoding and saves it to keyvault
# .\addcerttokeyvault.ps1 -CertificateFile c:\temp\wvcert.pfx -KeyVaultName worldviewltdprod-kv `
#                   -KeyVaultCertDataSecretName global-myworldviewltd-certdata `
#                   -KeyVaultCertPasswordName global-myworldviewltd-certpassword `
#                   -CertPassword your password
##################################################################################################                   

Param(
    [string] [Parameter(Mandatory=$true)] $CertificateFile,
    [string] [Parameter(Mandatory=$true)] $KeyVaultName,
    [string] [Parameter(Mandatory=$true)] $KeyVaultCertDataSecretName,
    [string] [Parameter(Mandatory=$true)] $KeyVaultCertPasswordName,
    [string] [Parameter(Mandatory=$true)] $CertPassword
)


$fileContentBytes = get-content $CertificateFile -Encoding Byte

$base64Encoded = [System.Convert]::ToBase64String($fileContentBytes)
$secret = ConvertTo-SecureString -String $base64Encoded -AsPlainText -Force
Set-AzureKeyVaultSecret -VaultName $KeyVaultName -Name $KeyVaultCertDataSecretName -SecretValue $secret

$secret = ConvertTo-SecureString -String $CertPassword -AsPlainText -Force
Set-AzureKeyVaultSecret -VaultName $KeyVaultName -Name $KeyVaultCertPasswordName -SecretValue $secret
