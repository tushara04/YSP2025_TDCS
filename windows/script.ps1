# --- Variables ---
$desktopPath = [System.Environment]::GetFolderPath('Desktop')
$repoName = 'Makerspace_YSP_ESP32_Mesh'
$repoLink = 'https://github.com/Makerspace-Ashoka/ysp-esp32-mesh-firmware.git'
$pythonVenvPath = "$desktopPath\$repoName\python-interface\src\"


# --- Utility functions ---
function Write-Info($msg) { Write-Host $msg -ForegroundColor Green }
function Write-ErrorMsg($msg) { Write-Host $msg -ForegroundColor Red }
function Write-ProgressMsg($msg) { Write-Host $msg -ForegroundColor Cyan }

# --- ASCII Art Banner ---
Write-Host @'

___  ___      _                                              __   __        __   _____________ 
|  \/  |     | |                                             \ \ / /        \ \ / /  ___| ___ \
| .  . | __ _| | _____ _ __ ___ _ __   __ _  ___ ___    ______\ V /______    \ V /\ `--.| |_/ /
| |\/| |/ _` | |/ / _ \ '__/ __| '_ \ / _` |/ __/ _ \  |______/   \______|    \ /  `--. \  __/ 
| |  | | (_| |   <  __/ |  \__ \ |_) | (_| | (_|  __/        / /^\ \          | | /\__/ / |    
\_|  |_/\__,_|_|\_\___|_|  |___/ .__/ \__,_|\___\___|        \/   \/          \_/ \____/\_|    
                               | |                                                             
                               |_|                                                             
   
'@ -ForegroundColor Magenta

Write-Host 'This script sets up your development environment by installing and configuring essential tools and extensions.' -ForegroundColor Yellow
Write-Host ''

Write-Host 'Preparing environment...' -ForegroundColor Cyan
for ($i = 1; $i -le 5; $i++) {
    Write-Host -NoNewline '.' -ForegroundColor White
    Start-Sleep -Seconds 1
}
Write-Host ''

# --- Start in Desktop ---
Set-Location $desktopPath
Write-ProgressMsg "Starting setup in: $desktopPath"

# --- Step 1: Winget ---
Write-Host @'
======================================
  [ Step 1/8: Checking for Winget ]
======================================
'@ -ForegroundColor Magenta

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-ErrorMsg 'Winget not found. Opening Microsoft Store to install App Installer.'
    Start-Process 'ms-windows-store://pdp/?productid=9NBLGGH4NNS1'
    Read-Host 'Please install App Installer, then press Enter to continue...'
    $winget = Get-Command winget -ErrorAction SilentlyContinue
    if (-not $winget) { Write-ErrorMsg 'Winget still not found. Exiting.'; exit 1 }
    else { Write-Info 'Winget installed successfully.' }
} else {
    Write-Info 'Winget is already installed.'
}

# --- Step 2: Git ---
Write-Host @'
=================================
  [ Step 2/8: Checking for Git ]
=================================
'@ -ForegroundColor Magenta

try {
    $gitVersion = & git --version 2>&1
    if ($gitVersion -match 'git version \d+\.\d+') {
        Write-Info "Git is already installed: $gitVersion"
    } else {
        throw 'Git output invalid.'
    }
} catch {
    Write-Info 'Git not found or invalid. Installing...'
    winget install --silent --accept-package-agreements --accept-source-agreements Git.Git
    Start-Sleep -Seconds 5
    $gitVersion = & git --version 2>&1
    if ($gitVersion -match 'git version \d+\.\d+') {
        Write-Info "Git installed successfully: $gitVersion"
    } else {
        Write-ErrorMsg 'Git installation failed.'
    }
}

# --- Step 3: Python ---
Write-Host @'
=====================================
  [ Step 3/8: Checking for Python ]
=====================================
'@ -ForegroundColor Magenta

$pyCommand = $null
try {
    $pyVersion = & python --version 2>&1
    if ($pyVersion -match 'Python \d+\.\d+') {
        $pyCommand = 'python'
        Write-Info "Python is already installed: $pyVersion"
    } else {
        throw 'Python alias stub detected.'
    }
} catch {
    # Try python3
    try {
        $pyVersion = & python3 --version 2>&1
        if ($pyVersion -match 'Python \d+\.\d+') {
            $pyCommand = 'python3'
            Write-Info "Python3 is already installed: $pyVersion"
        } else {
            throw 'Python3 alias stub detected.'
        }
    } catch {
        Write-Info 'Python not found or is just a stub. Installing...'
        winget install --silent --accept-package-agreements --accept-source-agreements Python.Python.3.12
        Start-Sleep -Seconds 5

        # Recheck installation
        try {
            $pyVersion = & python --version 2>&1
            if ($pyVersion -match 'Python \d+\.\d+') {
                $pyCommand = 'python'
                Write-Info "Python installed successfully: $pyVersion"
            } else {
                $pyVersion = & python3 --version 2>&1
                if ($pyVersion -match 'Python \d+\.\d+') {
                    $pyCommand = 'python3'
                    Write-Info "Python3 installed successfully: $pyVersion"
                } else {
                    Write-ErrorMsg 'Python installation failed. Please check manually.'
                }
            }
        } catch {
            Write-ErrorMsg 'Python installation failed. Please check manually.'
        }
    }
}


# --- Step 4: Visual Studio Code ---
Write-Host @'
=================================================
  [ Step 4/8: Checking for Visual Studio Code ]
=================================================
'@ -ForegroundColor Magenta

try {
    $codeVersion = & code --version 2>&1
    if ($codeVersion -match '^\d+\.\d+\.\d+') {
        Write-Info "VS Code is already installed: $($codeVersion -split "`n")[0]"
    } else {
        throw 'VS Code not found or invalid output.'
    }
} catch {
    Write-Info 'VS Code not found. Installing...'
    winget install --silent --accept-package-agreements --accept-source-agreements Microsoft.VisualStudioCode
    Start-Sleep -Seconds 5
    $codeVersion = & code --version 2>&1
    if ($codeVersion -match '^\d+\.\d+\.\d+') {
        Write-Info "VS Code installed successfully: $($codeVersion -split "`n")[0]"
    } else {
        Write-ErrorMsg 'VS Code installation failed. Please check manually.'
    }
}

# --- Step 5: Install VS Code extensions ---
Write-Host @'
==============================================
  [ Step 5/8: Installing VS Code extensions ]
==============================================
'@ -ForegroundColor Magenta

$extensions = @(
    'ms-python.python',
    'ms-python.vscode-pylance',
    'ms-toolsai.jupyter',
    'ms-vscode.vscode-serial-monitor'
)
foreach ($ext in $extensions) {
    Write-Info "Installing VS Code extension: $ext"
    code --install-extension $ext | Out-Null
}

# --- Step 6: Clone the repository ---
Write-Host @'
===============================================
  [ Step 6/8: Cloning the repository to Desktop ]
===============================================
'@ -ForegroundColor Magenta

if (-not (Test-Path $repoName)) {
    git clone $repoLink $repoName | Out-Null
    Write-Info 'Repository cloned.'
} else {
    Write-Info 'Repository already exists. Skipping clone.'
}

# --- Step 7: Create a virtual environment and install dependencies ---
Write-Host @'
===========================================================
  [ Step 7/8: Setting up Python virtual environment ]
===========================================================
'@ -ForegroundColor Magenta

if (Test-Path $pythonVenvPath) {
    Set-Location $pythonVenvPath
    if (-not (Test-Path ".venv")) {
        Write-Info "Creating virtual environment in $pythonVenvPath\.venv..."
        & $pyCommand -m venv .venv
        if ($LASTEXITCODE -eq 0) {
            Write-Info "Virtual environment created."
        } else {
            Write-ErrorMsg "Failed to create virtual environment."
        }
    } else {
        Write-Info "Virtual environment already exists. Skipping creation."
    }

    # Activate the virtual environment
    $venvActivate = Join-Path $pythonVenvPath ".venv\Scripts\Activate.ps1"
    if (Test-Path $venvActivate) {
        Write-Info "Activating virtual environment..."
        & $venvActivate

        # Install dependencies
        $requirementsFile = Join-Path $pythonVenvPath "requirements.txt"
        if (Test-Path $requirementsFile) {
            Write-Info "Installing Python dependencies from requirements.txt..."
            & $pyCommand -m pip install --upgrade pip
            & $pyCommand -m pip install -r $requirementsFile
            if ($LASTEXITCODE -eq 0) {
                Write-Info "Dependencies installed successfully."
            } else {
                Write-ErrorMsg "Failed to install dependencies. Please check manually."
            }
        } else {
            Write-Info "requirements.txt not found. Skipping dependency installation."
        }
    } else {
        Write-ErrorMsg "Could not find .venv activation script. Please check manually."
    }
    # Return to Desktop for consistency
    Set-Location $desktopPath
} else {
    Write-ErrorMsg "Appropriate folder not found. Cannot set up virtual environment."
}


# --- Step 8: Open VS Code in notebooks folder ---
Write-Host @'
========================================================
  [ Step 8/8: Opening VS Code in the notebooks folder ]
========================================================
'@ -ForegroundColor Magenta

if (Test-Path $pythonVenvPath) {
    Write-Info "Opening VS Code in: $pythonVenvPath"
    code $pythonVenvPath "$pythonVenvPath\workspace.py"
} else {
    Write-ErrorMsg 'Notebooks folder not found. Please check manually.'
}

# --- Final message ---
Write-Host @'
=========================================
  [ All steps completed successfully! ]
=========================================
'@ -ForegroundColor Green
Write-Host "You're all set up. Ready to start coding!" -ForegroundColor Yellow
Read-Host 'Press Enter to exit.'
