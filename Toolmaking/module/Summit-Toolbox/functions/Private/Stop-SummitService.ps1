function Stop-SummitService {
    param (
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    Write-Warning "Stopping service '$ServiceName'"
    
    Write-Warning "Starting service '$ServiceName'..."
    
    $service = Get-Service -Name $ServiceName
    
    $service | Select-Object Name, Status, StartType
}