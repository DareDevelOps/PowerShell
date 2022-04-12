<#
.Synopsis short script to update the packer application
.Descriptiom
#>

#get the download uri
$URI = "https://www.packer.io/downloads"

#scrape the links off the download page
$links = (Invoke-WebRequest -Uri $URI).links.href

# extract the platform download link
($downloadLInk = $links -match "_windows_amd64")

# define the  download  location
$output = "C:\temp\packer.zip"

Invoke-WebRequest -Uri "$downloadLInk" -OutFile $output

#change to the source diretory
Set-Location -Path "C:\Temp"

Expand-Archive -Path .\packer.zip -DestinationPath "C:\packer" -Force