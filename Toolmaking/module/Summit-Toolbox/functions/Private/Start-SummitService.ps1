function Start-SummitService {
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    Write-Warning "Starting service '$ServiceName' on computer '$ComputerName'..."
    $service = Invoke-Command -ComputerName $ComputerName -Credential $credential -ScriptBlock {
        Start-Service -Name $using:ServiceName
        Get-Service -Name $using:ServiceName
    }

    $service | Select-Object Name, Status, StartType
}