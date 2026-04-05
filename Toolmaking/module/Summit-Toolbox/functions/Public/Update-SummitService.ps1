function Update-SummitService {
    [CmdletBinding()]
    param (
        [string]$ComputerName,
        [string]$ServiceName,
        [ValidateSet("Get", "Start", "Stop", "Restart")]
        [string]$Action,
        [PSCredential]$Credential
    )

    switch ($Action.ToLower()) {
        "get" {
            Get-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
        }
        "start" {
            Start-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
        }
        "stop" {
            Stop-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
        }
        "restart" {
            Restart-SummitService -ComputerName $ComputerName -ServiceName $ServiceName -Credential $Credential
        }
        default {
            Write-Error "Invalid action specified. Use 'start', 'stop', or 'restart'."
        }
    }
}