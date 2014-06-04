@echo off
setlocal EnableDelayedExpansion

SET /p listFile=who is your iplist? 
SET /p splitNum=how many threads do you want to proceed?

del *.split
del output.log

::Split IPLIST.txt
SET /a cnt=0
for /f %%a in ('type "%listFile%"^|find "" /v /c') do set /a cnt=%%a
set /a interval=%cnt%/%splitNum%

SET /a cnt=0
SET /a index=0

for /f %%i in (%listFile%) do (
	SET /a cnt=cnt+1
	if [!cnt!] equ [!interval!] (
		SET /a index+=1
		SET /a cnt=0
	)
	echo %%i >> s!index!.split
)

:: multi-threads proceed
for /f %%a IN ('dir /b *.split') do (
	start "%%a" "ipvalidate.bat" %%a
)