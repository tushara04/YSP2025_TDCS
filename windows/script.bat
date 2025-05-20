@echo off

for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

echo %ESC%[1;32mLet us check if winget -- a package manager -- is already present in your laptop.%ESC%[0m
echo.
echo %ESC%[1;32mChecking...%ESC%[0m
timeout /t 7 /nobreak
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

where winget >nul 2>&1
if %ERRORLEVEL% neq 0 (
     echo.
     echo %ESC%[1;32mHmm... seems like it is not. So, let's install that first. Before moving ahead, note that when you press any key as requested below, a window for Microsoft Store will open with a software "App Installer" on the screen. Click on "Get" to install. Then close the window and continue following the instructions.%ESC%[0m
     echo.
     echo %ESC%[1;32mCool? Let's move ahead then.%ESC%[0m
     echo.
     pause
     powershell -Command "Start-Process 'ms-windows-store://pdp/?productid=9NBLGGH4NNS1'"
     echo.
     echo %ESC%[1;32mDid the "Get" change into "Installed" before you closed the window? Awesome. Let's move on. You might have to wait for a few seconds before you can press any key.%ESC%[0m
     echo.
     pause
)    

echo.
echo %ESC%[1;32mYAY. Winget is there in your laptop. Now, we will move ahead and download the software needed for your classes.%ESC%[0m

timeout /t 10 /nobreak
echo.
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
REM Install tools via winget
echo %ESC%[1;32mWe are now installing "Git". As Git installs, the system will send you a pop-up box titled "Git for Windows" and ask you to press Yes or No. Press "Yes".%ESC%[0m

timeout /t 10 /nobreak
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
call winget install --silent --accept-package-agreements --accept-source-agreements Git.Git
set "PATH=%PATH%;%ProgramFiles%\Git\cmd"
echo.
echo %ESC%[1;32mGreat. Git is now in your system. Let's go ahead and install Python now.%ESC%[0m
timeout /t 5 /nobreak

call winget install --silent --accept-package-agreements --accept-source-agreements Python.Python.3.12
set "PATH=%PATH%;%LocalAppData%\Programs\Python\Python312;%LocalAppData%\Programs\Python\Python312\Scripts"
echo.
echo %ESC%[1;32mYessss... python is now there too. Finally, let's get visual studio code.%ESC%[0m
timeout /t 5 /nobreak
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

call winget install --silent --accept-package-agreements --accept-source-agreements Microsoft.VisualStudioCode
set "PATH=%PATH%;%LOCALAPPDATA%\Programs\Microsoft VS Code\bin"
echo.
echo %ESC%[1;32mAwesome. We now have all the software we needed. Let's quickly install a few extensions and packages for us to smoothly run these software.%ESC%[0m
timeout /t 7 /nobreak
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

REM Install VS Code extensions
call code --install-extension ms-python.python
call code --install-extension ms-python.vscode-pylance
call code --install-extension ms-toolsai.jupyter
call code --install-extension ms-vscode.vscode-serial-monitor

REM Install Python packages
call python -m pip install --upgrade pip
call pip install ipython ipykernel

echo.
echo %ESC%[1;32mAmazing. Your laptop is now fully ready for you to do the class exercises. Are you ready? Let's gooo.%ESC%[0m
pause

REM clone the repository 
git clone https://github.com/tushara04/YSP_Day1.git
cd YSP_Day1/notebooks
code .

