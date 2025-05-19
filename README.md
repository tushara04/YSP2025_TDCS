# YSP Day 1 System Setup

## Instructions

To run the setup script on your Windows system:

1. Press `Win + X`, then select **Windows PowerShell** (or **Terminal**) from the menu.
2. In the PowerShell window that opens, copy and paste the following command and press **Enter**:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tushara04/YSP_Day1/refs/heads/main/windows/script.bat" -OutFile "script.bat"; Start-Process "script.bat"
