@ECHO off
CLS

ECHO �п�ܽsĶ�ﶵ
ECHO 1. windows, x86
ECHO 2. windows, x64
ECHO Q. ����

SET /p opt= "�п��: "

IF NOT "%opt%"=="" SET opt=%opt:~0,1%

IF /i "%opt%"=="1" SET GOARCH=386
IF /i "%opt%"=="2" SET GOARCH=amd64
IF /i "%opt%"=="Q" exit

ECHO �sĶ�ﶵ %GOARCH%
:: �sĶ�ο�X
go build -o .\bin\master.exe -i .\src\main
