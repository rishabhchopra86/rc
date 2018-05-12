start cmd.exe /c ng s --port 4222
cmd /c ng build
start cmd.exe /c node server
start chrome.exe http://localhost:3000
start chrome.exe http://localhost:4222