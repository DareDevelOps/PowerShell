$counter = 10

while ($counter -ne 0) {
    $counter--
    New-Item -Name "Week$counter" -ItemType Directory
    
}
Write-Host "Session Build Complete..."    
