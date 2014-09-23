@GOTO:A 
 
@echo off
:: BAST Programming Language Core

::BAST Appending version

:: BAST "Compiler" below

@echo @GOTO:A > %2
@echo/ >> %2
@type %0 >> %2
@echo/ >> %2
@type %1 >> %2

@echo BAST Compiled.
@pause > nul
@exit /B

::Functionality added below

:num

@set /a num%1 = %2
@GOTO:EOF

::=========================

:test
::Broken code
set w=0
for %%K in (f g h i k l m o q) do (
  set /a w+=1
  set /a a!w!=!%%K!%%13
)
:: as a test
echo !a5!
GOTO:EOF

::=========================

:len  
::Broken code
set /a s = 0
for %%c in (%1) do set /a s+=1

echo %s%
@GOTO:EOF

::===============================
:numlen
::Gets the length of the number
@set /a numlen = 1
@set /a p = %1
:n
@if %p% lss 10 goto:nn

@set /a numlen+=1
@set /a p/=10
@goto:n
:nn
@echo %numlen%
@GOTO:EOF

::===================================

:While
::A very limited while loop, that only increments
@set index=1
:c
@if %index% gtr %1 goto:EOF
   @echo Iteration number %index%
   @set /A index+=1
   @goto c
::================================

:pow
::Raises a number to a power. call:pow 2 7 will raise 2 to the 7th power.
@set /a s=1
@set /a n= %2
@for /l %%x in (1, 1, %n%) do @SET /A s*= %1
@echo %s%
@GOTO:EOF



:A