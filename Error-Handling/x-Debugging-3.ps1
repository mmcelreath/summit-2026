
Import-Module C:\code\summit-2026\Toolmaking\module\Summit-Toolbox\ -Force

$serviceName = "bits"
$action = "Restart"
# $credential = $cred

Update-SummitService -ServiceName $serviceName -Action $action -Credential $credential

Write-Host "Done"