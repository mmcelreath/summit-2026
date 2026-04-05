function Get-SummitService {
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [PSCredential]$Credential
    )

    Write-Warning "Getting service '$ServiceName' on computer '$ComputerName'..."
    $service = Invoke-Command -ComputerName $ComputerName -Credential $credential -ScriptBlock {
        Get-Service -Name $using:ServiceName
    }

    $service | Select-Object Name, Status, StartType
}