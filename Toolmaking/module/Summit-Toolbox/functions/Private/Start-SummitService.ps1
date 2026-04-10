function Start-SummitService {
    param (
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    Write-Warning "Starting service '$ServiceName'..."
    
    $service = Get-Service -Name $ServiceName
    
    $service | Select-Object Name, Status, StartType
}