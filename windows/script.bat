@echo off

echo Let us check if winget -- a package manager -- is already present in your laptop.
echo.
echo Checking...
timeout /t 7 /nobreak

where winget >nul 2>&1
if %ERRORLEVEL% neq 0 (
     echo.
     echo Hmm... seems like it is not. So, let's install that first. Before moving ahead, note that when you press any key as requested below, a window for Microsoft Store will open with a software "App Installer" on the screen. Click on "Get" to install. Then close the window and continue following the instructions.
     echo.
     echo Cool? Let's move ahead then!
     echo.
     pause
     powershell -Command "Start-Process 'ms-windows-store://pdp/?productid=9NBLGGH4NNS1'"
    timeout /t 20 /nobreak
     echo.
     echo Did the "Get" change into "Installed" before you closed the window? Awesome! Let's move on...
     echo.
     pause
)    

echo.
echo YAY! Winget is there in your laptop! Now, we will move ahead and download the software needed for your classes.

timeout /t 10 /nobreak
echo.

REM Install tools via winget
echo We are now installing "Git". As Git installs, the system will send you a pop-up box titled "Git for Windows" and ask you to press Yes or No. Press "Yes".

timeout /t 10 /nobreak
call winget install --silent --accept-package-agreements --accept-source-agreements Git.Git
echo.
echo Great!! Git is now in your system. Let's go ahead and install Python now.
timeout /t 5 /nobreak

call winget install --silent --accept-package-agreements --accept-source-agreements Python.Python.3.12
echo.
echo Yessss... python is now there too!! Finally, let's get visual studio code.
timeout /t 5 /nobreak

call winget install --silent --accept-package-agreements --accept-source-agreements Microsoft.VisualStudioCode
echo.
echo Awesome! We now have all the software we needed. Let's quickly install a few extensions and packages for us to smoothly run these software.
timeout /t 7 /nobreak

REM Add VS Code to PATH for current session (if needed)
set "PATH=%PATH%;%LOCALAPPDATA%\Programs\Microsoft VS Code\bin"
REM Install VS Code extensions
call code --install-extension ms-python.python
call code --install-extension ms-python.vscode-pylance
call code --install-extension ms-toolsai.jupyter
call code --install-extension ms-vscode.vscode-serial-monitor

REM Install Python packages
call python -m pip install --upgrade pip
call pip install ipython ipykernel

echo.
echo Amazing! Your laptop is now fully ready for you to do the class exercises. Are you ready???
