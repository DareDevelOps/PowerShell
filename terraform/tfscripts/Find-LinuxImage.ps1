<#
.SYNOPSIS
Determine Current Linux Images
.NOTES
Author: Drew Burt
Date: 9-27-2020
Version: 0.0.1
Resources: https://medium.com/@gmusumeci/how-to-find-azure-linux-vm-images-for-terraform-or-packer-deployments-24e8e0ac68a
#>

$location = Read-Host -Prompt "Please enter the Azure Region you wish to search"

$LinuxDistros = [ordered] @{
    Canonical      = "Ubuntu";
    RedHat         = "RedHat";
    Openlogic      = "CentOS";
    SuSE           = "SUSE";
    Debian         = "credativ";
    "Oracle Linux" = "Oracle-Linux";
    CoreOS         = "CoreOS"
}


"These are the Linux Distributions currently Supported in Azure: " 

$LinuxDistros

$PublisherName = Read-Host -Prompt "Please select a publisher from the list"

#list Image publishers by region

$VMImageOffer = Get-AzVMImageOffer `
    -Location $location `
    -PublisherName $PublisherName

"Here are $PublisherName Offers for $Location `n"

$VMImageOffer.Offer

$ImageSkus = Get-AzVMImageSku `
    -Location $location `
    -PublisherName $PublisherName |
Select-Object Offer, Skus,

"Here are the Skus for $PublisherName in $Location `n"
$ImageSkus