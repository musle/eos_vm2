@ECHO off
CLS

ECHO 請選擇編譯選項
ECHO 1. windows, x86
ECHO 2. windows, x64
ECHO Q. 結束

SET /p opt= "請選擇: "

IF NOT "%opt%"=="" SET opt=%opt:~0,1%

IF /i "%opt%"=="1" SET GOARCH=386
IF /i "%opt%"=="2" SET GOARCH=amd64
IF /i "%opt%"=="Q" exit

ECHO 編譯選項 %GOARCH%
:: 編譯及輸出
go build -o .\bin\master.exe -i .\src\main
