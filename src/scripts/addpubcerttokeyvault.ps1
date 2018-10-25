#This script converts PFX file to base64 encoding and saves it to keyvault
# .\addcerttokeyvault.ps1 -CertificateFile c:\temp\wvcert.cer -KeyVaultName worldviewltdprod-kv `
#                   -KeyVaultCertDataSecretName global-myworldviewltd-pubcertdata
##################################################################################################                   

Param(
    [string] [Parameter(Mandatory=$true)] $CertificateFile,
    [string] [Parameter(Mandatory=$true)] $KeyVaultName,
    [string] [Parameter(Mandatory=$true)] $KeyVaultCertDataSecretName
)


$fileContentBytes = get-content $CertificateFile -Encoding Byte

$base64Encoded = [System.Convert]::ToBase64String($fileContentBytes)
$secret = ConvertTo-SecureString -String $base64Encoded -AsPlainText -Force

Set-AzureKeyVaultSecret -VaultName $KeyVaultName -Name $KeyVaultCertDataSecretName -SecretValue $secret
