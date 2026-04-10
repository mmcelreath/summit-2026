function Get-SummitService {
    param (
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    Write-Warning "Getting service '$ServiceName'..."

    $service = Get-Service -Name $ServiceName
    
    $service | Select-Object Name, Status, StartType
}