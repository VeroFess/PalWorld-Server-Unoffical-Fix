@echo off
setlocal enabledelayedexpansion

REM Check command line arguments
if "%1"=="" (
    echo No file path provided as a parameter. Please drag the PalServer-Win64-Test-Cmd.exe file onto this bat file.
    pause
    exit /b 1
)

REM Check if the file exists
if not exist "%1" (
    echo Error: File does not exist.
    pause
    exit /b 1
)

REM Check if the file name is PalServer-Win64-Test-Cmd.exe
set "filename=%~n1"
if /i not "!filename!"=="PalServer-Win64-Test-Cmd" (
    echo Error: The file name is not PalServer-Win64-Test-Cmd.exe. Please drag the PalServer-Win64-Test-Cmd.exe file onto this bat file.
    pause
    exit /b 1
)

REM Use a tool to verify the file's SHA1
set "file_path=%~1"
set "expected_sha1=A4E7A2B173D64376410DA78E7982B7F3800E1320"  REM 

echo Verifying file SHA1...
set "computed_sha1="
for /f "tokens=*" %%a in ('certutil -hashfile "!file_path!" SHA1 ^| find /i /v "SHA1"') do set "computed_sha1=%%a" & goto :CheckOk
:CheckOk
if /i "%computed_sha1%"=="%expected_sha1%" (
    echo SHA1 verification passed, continuing processing...
) else (
    echo computed_sha1:%computed_sha1%  expected_sha1:%expected_sha1%
    echo Error: SHA1 verification failed. Please ensure that the server is version 0.1.3.0, the file has not been tampered with, and any patches have been applied.
    pause
    exit /b 1
)

REM Rename the file to PalServer-Win64-Test-Cmd.exe.bak
move "!file_path!" "!file_path!.bak"

REM Apply patch using hpatchz
echo Applying patch...
set "patch_command=hpatchz.exe "%~1.bak" patch.bin "%~1""
%patch_command%

REM Verify file SHA1 again
echo Re-verifying file SHA1...
set "computed_sha1="
for /f "tokens=*" %%a in ('certutil -hashfile "!file_path!" SHA1 ^| find /i /v "SHA1"') do set "computed_sha1=%%a" & goto :CheckOk2
:CheckOk2
set "expected_sha1=6FA366DA9F8B35D7DB456CEEEA84DFCA88F8C616"
if /i "%computed_sha1%"=="%expected_sha1%" (
    echo Patch successful!
    pause
    exit /b 0
) else (
    echo Error: SHA1 verification failed. Patch unsuccessful. Backup file is PalServer-Win64-Test-Cmd.exe.bak, you can manually restore it.
    pause
    exit /b 1
)
