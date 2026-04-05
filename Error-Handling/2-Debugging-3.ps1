
Import-Module C:\code\summit-2026\Toolmaking\module\Summit-Toolbox\ -Force

$computerName = "dc"
$serviceName = "bits"
$action = "Restart"
$credential = $cred

Update-SummitService -ComputerName $computerName -ServiceName $serviceName -Action $action -Credential $credential

