setlocal EnableDelayedExpansion
@GOTO:A 
 
@echo off
:: BAST Programming Language Core

:: BAST Appending version

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
@set /a xfx = 0

::Functionality added below

:var
@set /a %1 = %2
@set /a %3 = %4
@set /a %5 = %6
@set /a %7 = %8
@goto:eof
::=========================

:num1
@set /a t = %1
@set /a num[!t!] = %2
@GOTO:EOF

::=========================
:num2
@call:var t %1 y %2
@set /a num[!t!][!y!] = %3
@GOTO:EOF
::========================

:num3
call:var t %1 y %2 u %3
@set /a num[!t!][!y!][!u!] = %4
@GOTO:EOF
::=========================
:s
@set /a %1 = %2
@echo !%1!
@goto:eof

::=========================
:and
@if %1 equ %2 (
		@if %3 equ %4 (
		@call:%5 %6 %7 %8 %9
		)
)
@goto:eof
::=========================
:or
@if %1 equ %2 (@call:%5 %6 %7 %8 %9)
@if %3 equ %4 (@call:%5 %6 %7 %8 %9)

@goto:eof

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
@set /a f1 = %1 / %2
@set /a r = %1 %% %2
@set /a r *= 1000000
@set /a f2 = %r% / %2% 
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
@set /a s=1
@set /a n= %2
@for /l %%x in (1, 1, %n%) do @SET /A s*= %1
@set /a pow = %s%
@GOTO:EOF 
::=================================

:numRev
@set /a g = %1
@set /a numRev = 0
:nr
@call:numlen %g%
@set /a numlen -= 1
@call:pow 10 %numlen%
@set /a h = %g% %% 10
@set /a numRev += h * %pow%
@set /a g /= 10
@if %g% gtr 0 goto:nr
@GOTO:EOF
::===============================

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:A