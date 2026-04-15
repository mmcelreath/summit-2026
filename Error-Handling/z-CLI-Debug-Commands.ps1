


Set-PSBreakpoint -Script ".\z-CLI-Debug-Script.ps1" -Line 4

Get-PSBreakpoint -Script ".\z-CLI-Debug-Script.ps1"


$ErrorActionPreference = 'break'


.\z-CLI-Debug-Script.ps1


$breakpoint = Get-PSBreakpoint -Script ".\z-CLI-Debug-Script.ps1"
Remove-PSBreakpoint -Breakpoint $breakpoint


