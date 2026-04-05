function Restart-SummitService {
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    if ($ServiceName -eq "bits") {
        $ServiceName = "bits-error"
    }

    Write-Warning "Restarting service '$ServiceName' on computer '$ComputerName'..."
    $service = Invoke-Command -ComputerName $ComputerName -Credential $credential -ScriptBlock {
        Restart-Service -Name $using:ServiceName
        Get-Service -Name $using:ServiceName
    }

    $service | Select-Object Name, Status, StartType
}