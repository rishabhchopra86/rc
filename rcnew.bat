@ECHO OFF
set mypath=%cd%
setlocal


REM set "psCommand="(new-object -COM 'Shell.Application')^
REM .BrowseForFolder(0,'Please choose a folder.',0,0).self.path""
REM for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
REM setlocal enabledelayedexpansion
set "projectName=%1"
set /p prefix=Do you want prefix of Component if yes than name the prefix else just pass 'n'  :
REM cmd /c ng new %projectName% --skip-install --routing
IF "%prefix%"=="n"(cmd /c ng new %projectName% --routing)ELSE (
cmd /c ng new %projectName% --routing --prefix=%prefix%
)
set /p db=What is Database Engine e.g(mssql,mysql,mongodb/n) :
CD /D %projectName%
IF "%db%"=="mssql" ( cmd /c npm install mssql --save ) ELSE ^
IF "%db%"=="mysql" ( cmd /c npm install mysql --save ) ELSE ^
IF "%db%"=="mongodb" ( cmd /c npm install mongodb --save ) ELSE ^
echo Rejected By User
set /p server=Do you want express(y/n) :
IF "%server%"=="y" ( cmd /c npm install express --save
cmd /c npm install cors --save
cmd /c npm install body-parser --save ) ELSE ^
echo Rejected By User
set "folder1=E:\Rishabh Chopra\work\textfile\rc\files"
set "folder2=%mypath%\%projectName%"
echo f | xcopy /f /s/e/y "%folder1%"  "%folder2%"
start cmd.exe /c ng s --port 4222
cmd /c ng build
start cmd.exe /c node server
start chrome.exe http://localhost:3000
start chrome.exe http://localhost:4222


