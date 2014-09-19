@echo off
:: BAST Programming Language Core

::BAST Appending version

@echo @GOTO:A > %2
@echo/ >> %2
@type %0 >> %2
@echo/ >> %2
@type %1 >> %2

@echo BAST Compiled.
@pause > nul


:z
@echo %random%
@GOTO:EOF

:A