
# Import the module
Import-Module .\module\Summit-Toolbox\ -Force

Get-Command -Module Summit-Toolbox

Get-SummitGreeting

Update-SummitService -ComputerName dc -ServiceName bits -Action Get -Credential $cred

Update-SummitService -ComputerName dc -ServiceName bits -Action Start -Credential $cred

Update-SummitService -ComputerName dc -ServiceName bits -Action Stop -Credential $cred

Update-SummitService -ComputerName dc -ServiceName bits -Action Restart -Credential $cred