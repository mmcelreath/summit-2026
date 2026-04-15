
# Import the module
Import-Module .\module\Summit-Toolbox\ -Force

Get-Command -Module Summit-Toolbox

Get-SummitGreeting

Get-Help Update-SummitService 

Update-SummitService -ServiceName bits -Action Get 

Update-SummitService -ServiceName bits -Action Start 

Update-SummitService -ServiceName bits -Action Stop 

Update-SummitService -ServiceName bits -Action Restart 


Get-BasicCommand -CommandName "Testing 123"