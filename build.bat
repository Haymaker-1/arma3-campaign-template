SET BUILDDIR=build
SET BINPBO_PROGRAM_PATH=%programfiles(x86)%\Bohemia Interactive\Tools\BinPBO Personal Edition\
SET FLAGS=/NP /NDL /NFL /NJH /NJS
SET FLAGS_E=%FLAGS% /E



:: quietly remove the contents of the build directory, as well as the directory itself
rmdir /S /Q %BUILDDIR%

:: make a new directory
md %BUILDDIR%

:: copy the mission files into the buiild directory
robocopy .\Missions %BUILDDIR%\Missions %FLAGS_E%

:: we use the mission's load screen as overview picture, so make a copy
:: from mission images to campaign images
robocopy .\Missions\mission1.Altis\images %BUILDDIR%\images\overview-pictures mission1.jpg %FLAGS%
robocopy .\Missions\mission2.Altis\images %BUILDDIR%\images\overview-pictures mission2.jpg %FLAGS%
robocopy .\Missions\mission3.Altis\images %BUILDDIR%\images\overview-pictures mission3.jpg %FLAGS%
robocopy .\Missions\mission4.Altis\images %BUILDDIR%\images\overview-pictures mission4.jpg %FLAGS%

:: copy the campaign level images to build directory
robocopy .\images   %BUILDDIR%\images %FLAGS_E%

:: copy the campaign's description.ext to th ebuild directory
robocopy .\ %BUILDDIR%\ description.ext %FLAGS%

:: now package everything into a binary
::"%BINPBO_PROGRAM_PATH%\BinPBO.exe" "%CD%\%BUILDDIR%" "%CD%\%BUILDDIR%" -PACK -DEBUG

:: rename build.pbo to something more useful
::move %BUILDDIR%\build.pbo %BUILDDIR%\test-campaign.Altis.pbo

:: wait for the user to close the window
pause
