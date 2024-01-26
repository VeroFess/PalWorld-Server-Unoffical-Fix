@echo off
setlocal enabledelayedexpansion

REM 检测输入的命令行参数
if "%1"=="" (
    echo 未提供文件路径作为参数 请将PalServer-Win64-Test-Cmd.exe文件拖到这个bat文件上
    pause
    exit /b 1
)

REM 判断文件是否存在
if not exist "%1" (
    echo 错误：文件不存在
    pause
    exit /b 1
)

REM 判断文件名是否为PalServer-Win64-Test-Cmd.exe
set "filename=%~n1"
if /i not "!filename!"=="PalServer-Win64-Test-Cmd" (
    echo 错误：文件名不是 PalServer-Win64-Test-Cmd.exe 请将PalServer-Win64-Test-Cmd.exe文件拖到这个bat文件上
    pause
    exit /b 1
)

REM 使用工具校验文件sha1
set "file_path=%~1"
set "expected_sha1=A4E7A2B173D64376410DA78E7982B7F3800E1320"  REM 

echo 校验文件SHA1...
set "computed_sha1="
for /f "tokens=*" %%a in ('certutil -hashfile "!file_path!" SHA1 ^| find /i /v "SHA1"') do set "computed_sha1=%%a" & goto :CheckOk
:CheckOk
if /i "%computed_sha1%"=="%expected_sha1%" (
    echo SHA1 校验通过，继续处理...
) else (
    echo computed_sha1:%computed_sha1%  expected_sha1:%expected_sha1%
    echo 错误：SHA1 校验未通过 请确定服务端是否为为0.1.3.0版本 文件未被篡改 是否已经打上补丁
    pause
    exit /b 1
)

REM 重命名文件为PalServer-Win64-Test-Cmd.exe.bak
move "!file_path!" "!file_path!.bak"

REM 使用 hpatchz 进行补丁
echo 执行补丁操作...
set "patch_command=hpatchz.exe "%~1.bak" patch.bin "%~1""
%patch_command%

REM 再次校验文件sha1
echo 重新校验文件SHA1...
set "computed_sha1="
for /f "tokens=*" %%a in ('certutil -hashfile "!file_path!" SHA1 ^| find /i /v "SHA1"') do set "computed_sha1=%%a" & goto :CheckOk2
:CheckOk2
set "expected_sha1=6FA366DA9F8B35D7DB456CEEEA84DFCA88F8C616"
if /i "%computed_sha1%"=="%expected_sha1%" (
    echo 补丁成功!!
    pause
    exit /b 0
) else (
    echo 错误：SHA1 校验未通过 补丁失败  备份文件在PalServer-Win64-Test-Cmd.exe.bak 可以手动恢复
    pause
    exit /b 1
)
