Write-Output "Hello World! Waiting for 5 seconds..."
Start-Sleep -Seconds 5
Write-Output "Starting UDP server"
invoke-expression 'cmd /c start powershell -Command { .\UDP_Server.ps1}'
Start-Sleep -Seconds 5
Write-Output "Starting http server"
invoke-expression 'cmd /c start powershell -Command { cd ..\Tavolo\; http-server . -p 8080 ;}'
Start-Sleep -Seconds 5
Write-Output "Starting client on chrome"
Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList '--password-store=basic --incognito --disable-pinch -start-fullscreen "http://127.0.0.1:8080"'
