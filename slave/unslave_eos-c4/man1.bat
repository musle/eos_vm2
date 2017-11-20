@echo --- loop1

rem unslave.exe com25.json
call newman run cl1.json --delay-request 5000
@echo --- loop2
call newman run cl1.json --delay-request 5000
@echo --- loop3
call newman run cl1.json --delay-request 5000