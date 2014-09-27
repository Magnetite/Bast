setlocal EnableDelayedExpansion
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

::pre- Variables set:
@set W = @set /a

::Functionality added below

:num1
@set /a t = %1
@set /a num[!t!] = %2
@GOTO:EOF

::=========================
:num2
@set /a t = %1
@set /a y = %2
@set /a num[!t!][!y!] = %3
@GOTO:EOF
::========================

:num3
@set /a t = %1
@set /a y = %2
@set /a u = %3
@set /a num[!t!][!y!][!u!] = %4
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
:dfloat
@set /a r = %1 %% %2
@set /a r *= 1000000
@set /a dfloat = %r% / %2% 
@goto:eof
::===================================
:while
@set while = %1
:c
@if %while% gtr %2 goto:EOF 
@echo Iteration number %while%
@set /A while+=%1
@goto c
::================================

:pow
%W% s=1
%W% /a n= %2
@for /l %%x in (1, 1, %n%) do %W% s*= %1
%W% pow = %s%
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

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:A