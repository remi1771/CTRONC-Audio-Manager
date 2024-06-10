@echo off
setlocal

set "WAV_FOLDER=%~dp0WAV"
set "HCA_FOLDER=%~dp0HCA"
set "AWB_FOLDER=%~dp0AWB"
del /F /S /Q "%HCA_FOLDER%\*.*"

VGAudioCli.exe -b -i "%WAV_FOLDER%" -o "%HCA_FOLDER%" --out-format hca

quickbms.exe -G -w -r awb_hca.bms "%AWB_FOLDER%\*.awb" "%HCA_FOLDER%"

echo DONE!?
PAUSE

endlocal
