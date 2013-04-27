
@rem ----- ExeScript Options Begin -----
@rem ScriptType: console,silent,invoker
@rem DestDirectory: current
@rem Icon: X:\Users\Default\Desktop\Por54\ProJect\PorChrome\Chrome\chrome.exe
@rem File: X:\Users\Default\Desktop\Por54\ProJect\PorChrome\7z.exe
@rem OutputFile: X:\Users\Default\Desktop\Por54\ProJect\PorChrome\PorChrome.exe
@rem CompanyName: KSSC
@rem FileDescription: Chrome Loader
@rem FileVersion: 0.0.0.1
@rem LegalCopyright: KingShui
@rem ProductName: Chrome Loader
@rem ProductVersion: 0.0.0.1
@rem ----- ExeScript Options End -----

@echo off
:begin
cd /d %~dp0
setlocal enableextensions
setlocal enabledelayedexpansion
title Por54 Firefox Loader By KingShui
	
:init
set fpath=%~dp0
set ini=%~n0
if not exist PorChrome.ini call :createini
for /f "delims=" %%i in ('findstr "=" PorChrome.ini') do set %%i

:package
if "%~1" NEQ "" (
	if exist 7z.exe (
		start /min /b /wait 7z a -t7z -mx5 PorChrome_profile.7z "%~1"
		goto :eof
		)
	)

:unpack
if exist 7z.exe (
	if exist PorChrome_profile.7z (
		if not exist "!PFDir!" (
			start /min /b /wait 7z x -y PorChrome_profile.7z
			)
		)
	)

if "!ChromePath!" equ "" (
	(dir /s/b | findstr "chrome.exe")>Chromepath
	set /p ChromePath=<Chromepath
	del /f/q Chromepath >nul
	)

if not exist "!ChromePath!" goto :eof

if "%ChromePath:~1,1%" NEQ ":" (
	set ChromePath=!fpath!%ChromePath%
	)

if "%PFDir:~1,1%" NEQ ":" (
	set PFDir=!fpath!%PFDir%
	)

if "%cachedir:~1,1%" NEQ ":" (
	set cachedir=!fpath!%cachedir%
	)	

if "%Plugin:~1,1%" NEQ ":" (
	set Plugin=!fpath!%Plugin%
	)	
	
:run
start "" "%ChromePath%" -user-data-dir="%PFDir%" -disk-cache-dir="!CacheDir!" -disk-cache-size="!CacheSize!" !params!
exit

:createini
echo.^[Configure^]>>PorChrome.ini
echo.>>PorChrome.ini
echo.^[Chrome Path^]>>PorChrome.ini
echo.ChromePath=chrome\chrome.exe>>PorChrome.ini
echo.>>PorChrome.ini
echo.^[Profile Path^]>>PorChrome.ini
echo.PFDir=profiles>>PorChrome.ini
echo.>>PorChrome.ini
echo.^[Ext Params^]>>PorChrome.ini
echo.Params= --no-first-run
echo.>>PorChrome.ini
echo.^[Down Path^]>>PorChrome.ini
echo.DownDir=Downloads>>PorChrome.ini
echo.>>PorChrome.ini
echo.^[Cache Path^]>>PorChrome.ini
echo.CacheDir=Cache>>PorChrome.ini
echo.>>PorChrome.ini
echo.^[Cache Size^]>>PorChrome.ini
echo.CacheSize=35840>>PorChrome.ini
echo.>>PorChrome.ini
echo.^[Plugin Path^]>>PorChrome.ini
echo.Plugin=Plugin>>PorChrome.ini
echo.>>PorChrome.ini
echo ;Please do not change filename>>PorChrome.ini
