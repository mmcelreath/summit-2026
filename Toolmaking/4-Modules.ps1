
# Import the module
Import-Module .\module\Summit-Toolbox\ -Force

Get-Command -Module Summit-Toolbox

Get-SummitGreeting

Update-SummitService -ComputerName dc -ServiceName bits -Action Get -Credential $credential

Update-SummitService -ComputerName dc -ServiceName bits -Action Start -Credential $credential

Update-SummitService -ComputerName dc -ServiceName bits -Action Stop -Credential $credential

Update-SummitService -ComputerName dc -ServiceName bits -Action Restart -Credential $credential


Get-BasicCommand -CommandName "Testing 123"