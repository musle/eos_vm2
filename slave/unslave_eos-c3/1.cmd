@ REM -- FOR DC1500 768 狀態
:loop
@echo loop1--
call newman run cl3.json --delay-request 7000
@echo loop2--
call newman run cl3.json --delay-request 7000
@echo loop3--
call newman run cl3.json --delay-request 7000
goto :loop