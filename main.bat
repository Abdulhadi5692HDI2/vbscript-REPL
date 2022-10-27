@echo off
title REPL for VBScript [v1]
echo REPL Ver 1.0
echo type .help for int commands.
echo type any vbscript command.
echo x=msgbox statement may not work. use .msgbox instead
echo Windows Kernel Type: %os%
:loop
set /p line0=repl ? 
echo %line0% > %temp%\repl-info.vbs
if %line0%==.help goto display
if %line0%==.exit goto exit
if %line0%==.refresh goto refresh
if %line0%==.msgbox goto msgb
if %line0%==.clear cls
cscript //nologo %temp%\repl-info.vbs
del %temp%\repl-info.vbs
goto :loop

:display
echo REPL int Command List.
echo .help Displays this screen
echo .exit Exits the program PROPERLY
echo .refresh Refreshes the program.
echo .msgbox Displays a msgbox. (VBScript controlled)
echo .clear Clears the screen.
goto :loop

:exit
del %temp%\repl-info.vbs
echo Goodbye!
exit /b %errorlevel%

:refresh
cls
echo Start Mode: Refreshed.
del %temp%\repl-info.vbs
goto :loop

:msgb
echo Message Content: 
set /p cont =
echo Message Title:
set /p title =
echo x=msgbox(%cont%, 0+0, %title%) > %temp%\msg.vbs
cscript //nologo %temp%\msg.vbs
del %temp%\msg.vbs
goto :loop