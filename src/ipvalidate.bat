@echo off
setlocal EnableDelayedExpansion

SET /a total_counter=0
SET /a match_counter=0

for /f %%i in (%1) do (
	SET /a total_counter=total_counter+1
	echo ["IP:"%%i" total:"!total_counter!]
	
	..\curl.exe %%i >%1%_t 2>&1
	find /c "google.com" %1%_t
	echo %ERRORLEVEL%
	
	if not ERRORLEVEL 1 (
		set /a match_counter+=1
		echo ["match:"!match_counter!]
		echo %%i >> %1%_o
	)
	echo "">%1%_t
)
del %1%_t
type %1%_o >> output.log
del %1%_o
del %1%

exit