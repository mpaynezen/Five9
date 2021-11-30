net session >nul 2>&1
if NOT %errorLevel% == 0 echo Failure: Must Run as Administrator & pause & exit /b        
echo Success: Administrative permissions confirmed.    
mkdir  c:\sdc
mkdir  c:\sdc\Five9
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/vc_redist.x86.exe' -Outfile c:\sdc\Five9\vc_redist.x86.exe ;"
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/vc_redist.x64.exe' -Outfile c:\sdc\Five9\vc_redist.x64.exe ;"
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/JavaSetup8u231.exe' -Outfile c:\sdc\Five9\JavaSetup8u231.exe ;"
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/DesktopResources-Verint-15.2.9.115.msi' -Outfile c:\sdc\Five9\DesktopResources-Verint-15.2.9.115.msi ;"
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/PlaybackInstallation-15.2.0.215%%20(1).msi' -Outfile 'c:\sdc\Five9\PlaybackInstallation-15.2.0.215 (1).msi' ;"
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/FormDesigner_KB160045-15.2.4.210.msi' -Outfile c:\sdc\Five9\FormDesigner_KB160045-15.2.4.210.msi ;"
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/KB210880-15.2.9.326.msi' -Outfile 'c:\sdc\Five9\KB210880-15.2.9.326.msi' ;"
Powershell.exe -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;Invoke-WebRequest -Uri 'https://github.com/mpaynezen/Five9/raw/main/DPA-15.2.9.96.msi' -Outfile c:\sdc\Five9\DPA-15.2.9.96.msi ;"
cd c:\sdc\Five9
vc_redist.x86.exe /quiet /norestart
vc_redist.x64.exe /quiet /norestart
JavaSetup8u231.exe /s
msiexec.exe /i "DesktopResources-Verint-15.2.9.115.msi" ALLUSERS=1 /qn /norestart /log output.log
msiexec.exe /i "PlaybackInstallation-15.2.0.215 (1).msi" ALLUSERS=1 /qn /norestart /log output.log USE_COMMAND_LINE=1 PLAYBACK_ENCRYPTED=1 PLAYBACK_ENCRYPTIONWEBSERVICE=verint02.five9-wfo.com SSL=1 PORT=443
msiexec.exe /i "FormDesigner_KB160045-15.2.4.210.msi" ALLUSERS=1 /qn /norestart /log output.log USE_COMMAND_LINE=1 GLOBAL_APP_SERVER_DNS=verint02.five9-wfo.com GLOBAL_APP_SERVER_AUTH_PORT=443 GLOBAL_APP_SERVER_IIS_PORT=443 GLOBAL_USE_SSL=1
msiexec.exe /i "KB210880-15.2.9.326.msi" ALLUSERS=1 /qn /norestart /log output.log ENCRYPTION_DATAENCRYPT=FALSE AGENT_MONITORING_ENABLED=FALSE CONN_INTG_SVC=FALSE CONN_INTG_CLD=FALSE CONN_SEC_INTG_CLD=TRUE SEC_INTG_CLOUD=v02-ris-01-701.five9-wfo.com:29436,v02-ris-01-801.five9-wfo.com:29436 ASC=0
dism /online /enable-feature /all /featurename:msmq-server /norestart /quiet
dism /online /enable-feature /all /featurename:msmq-triggers /norestart /quiet
dism /online /enable-feature /all /featurename:msmq-http /norestart /quiet
msiexec.exe /i "DPA-15.2.9.96.msi" /qn /norestart /log output.log USEIEBHO=N CONFIGSERVER=verint02.five9-wfo.com USEHTTPS=Y AUTOSTART=Y


