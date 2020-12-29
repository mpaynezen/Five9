Stop-Service -Name DCUWindowsService
(Get-Content C:\ProgramData\Verint\DPA\Data\PcMonConfig.ini).replace('five9verint', 'verint02') | Set-Content C:\ProgramData\Verint\DPA\Data\PcMonConfig.ini
Start-service -Name DCUWindowsService