@echo off
setlocal EnableDelayedExpansion

del ip.txt
SET /p cutFile=who is your target to cut ?

for /f "delims=https://" %%i in (%cutFile%) do (
	echo %%i www.google.com>> ip.txt
	echo %%i www.google.com.hk>> ip.txt
	echo %%i accounts.google.com>> ip.txt
)

