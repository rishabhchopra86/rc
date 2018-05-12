@ECHO OFF
set command1=%1
IF "%command1%"=="new" (
cmd /c rcnew %2
) ELSE IF "%command1%"=="start" (
cmd /c rcstart )