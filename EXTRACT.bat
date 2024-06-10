@echo off
setlocal

set "SOURCE_FOLDER=%~dp0AWB"
set "DESTINATION_FOLDER=%~dp0HCA"
del /F /S /Q "%DESTINATION_FOLDER%\*.*"

for %%F in ("%SOURCE_FOLDER%\*.awb") do (
    start /wait "" "quickbms.exe" -R awb_hca.bms "%%F" "%DESTINATION_FOLDER%"
	)

set "SOURCE_FOLDER=%~dp0HCA"
set "DESTINATION_FOLDER=%~dp0WAV"

for %%F in ("%SOURCE_FOLDER%\*.hca") do (
    start /wait "" clHCA.exe "%%F" "%DESTINATION_FOLDER%\%%~nF.wav"
)

for %%F in ("%SOURCE_FOLDER%\*.wav") do (
	echo %%f
	echo move "%%F" "%DESTINATION_FOLDER%"
    move "%%F" "%DESTINATION_FOLDER%".
)

	
ENDLOCAL