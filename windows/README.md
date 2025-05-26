# Setup Instructions

Run the following command in an elevated PowerShell session to set up everything:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr -useb 'https://raw.githubusercontent.com/notkanishk/YSP2025_TDCS/powershell-kanishk/windows/script.ps1' | iex }"
```

This command downloads and executes the setup script from the remote repository.