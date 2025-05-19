@echo off

REM Check if winget is installed
where winget >nul 2>&1
if %ERRORLEVEL% neq 0 (
     powershell -Command "Start-Process 'ms-windows-store://pdp/?productid=9NBLGGH4NNS1'"
     echo Please install 'App Installer' from the Microsoft Store window that just opened.
     echo After installation, restart your terminal and run this script again.
     pause
     exit /b 1
)     
REM Install tools via winget
winget install --silent --accept-package-agreements --accept-source-agreements Git.Git
winget install --silent --accept-package-agreements --accept-source-agreements Python.Python.3.12
winget install --silent --accept-package-agreements --accept-source-agreements Microsoft.VisualStudioCode

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
