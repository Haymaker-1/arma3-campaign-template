SET BUILDDIR=build
SET BINPBO_PROGRAM_PATH=%programfiles(x86)%\Bohemia Interactive\Tools\BinPBO Personal Edition\
SET FLAGS=/NP /NDL /NFL /NJH /NJS
SET FLAGS_E=%FLAGS% /E



:: quietly remove the contents of the build directory, as well as the directory itself
rmdir /S /Q %BUILDDIR%

:: make a new directory
md %BUILDDIR%

:: copy all the campaign files into it

robocopy .\Missions %BUILDDIR%\Missions %FLAGS_E%
robocopy .\images   %BUILDDIR%\images %FLAGS_E%
robocopy .\         %BUILDDIR%\ description.ext %FLAGS%


:: now package everything into a binary
::"%BINPBO_PROGRAM_PATH%\BinPBO.exe" "%CD%\%BUILDDIR%" "%CD%\%BUILDDIR%" -PACK -DEBUG


:: rename build.pbo to something more useful
move %BUILDDIR%\build.pbo %BUILDDIR%\test-campaign.Altis.pbo

:: wait for the user to close the window
pause
