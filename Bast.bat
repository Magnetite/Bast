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
@set index=1
:c
@if %While% gtr %1 goto:EOF 
   @echo Iteration number %While%
   @set /A index+=1
   @goto c
::================================

:pow
@set /a s=1
@set /a n= %2
@for /l %%x in (1, 1, %n%) do @SET /A s*= %1
@echo %s%
set /a pow = %s%
@GOTO:EOF 
::=================================

:numRev
set /a g = %1
set /a numRev = 0
:nr
call:numlen %g%
set /a numlen -= 1
call:pow 10 %numlen%
set /a h = %g% %% 10
set /a numRev += h * %pow%
set /a g /= 10
if %g% gtr 0 goto:nr
GOTO:EOF
::===============================


:A
 