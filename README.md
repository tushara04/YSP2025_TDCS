<div align="center">
  <h1>YSP Day 1 System Setup</h1>
  <p>Hey, there! Welcome to YSP 2025!</p>
  <p>This guide is designed to help you install some applications you will need for the class exercises over the next seven days. Follow the instructions below. If you get stuck, reach out to your instructors.</p>
</div>

---
## Instructions
First, identify your computer's operation system (OS) from the list below and click on it. If the script does not work for you for some reason, you can run a manual installation, in which case you can keep a track of the [checklist](https://github.com/tushara04/YSP_Day1/blob/main/checklist.md) to ensure you have installed all the necessary applications.

1. [Windows](#windows) ([Manual Installation](https://github.com/tushara04/YSP_Day1/blob/main/manual_installations/windows.md))
2. [macOS](#macOS) ([Manual Installation](https://github.com/tushara04/YSP_Day1/blob/main/manual_installations/macOS.md))

---
### Windows
To install the applications on your Windows laptop, follow the instructions mentioned below carefully:
1. **Copy the code written below**: click on the overlaped squares you see on the right edge of the box below that contains the code: ![image](https://github.com/user-attachments/assets/ff4005bb-9c20-4ea5-8dde-8acf57a135d0)
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tushara04/YSP_Day1/refs/heads/main/windows/script.bat" -OutFile "script.bat"; Start-Process "script.bat"
```
2. **Open PowerShell**: press the Windows key on your keyboard and type "powershell". Press the "Enter" key on your keyboard.
3. **Paste the copied code**: in the window that opens, press Ctrl+V (first press the left "Ctrl" key and then press the "V" key while holding the "Ctrl" key) on your keyboard. Then press the "Enter" key.
4. This should now open a new window (black screened terminal). If it does, great! Follow the instructions there.

If at any point the application "Visual Studio Code" opens, then that means everything is set. You can let your instructor know! :)

---
### macOS
Follow the instructions mentioned below carefully:
1. **Open Terminal**: press Cmd+Space (first press the left "Cmd" key and then press the Space bar while holding the "Cmd" key) on your keyboard. Then type "terminal" and press the "Enter" key.
2. **Install Xcode Command Line Tools**: in the terminal window that opens, type the following command and press the "Enter" key: 
```bash
xcode-select --install
```
3. **Install Homebrew**: in the terminal window that opens, type the following command and press the "Enter" key:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

4. **Restart Terminal**: close the terminal window and open a new one. This is important to ensure that the changes made by Homebrew are applied.

4. **Copy the code written below**: click on the overlaped squares you see on the right edge of the box below that contains the code: ![image](https://github.com/user-attachments/assets/ff4005bb-9c20-4ea5-8dde-8acf57a135d0)
```
mkdir -p ysp_setup && cd ysp_setup && for f in run.m4 Brewfile macos.sh zprofile zshrc; do curl -fsSLO "https://raw.githubusercontent.com/tushara04/YSP_Day1/main/macos/$f"; done && m4 run.m4 | /bin/bash
```

If at any point the application "Visual Studio Code" opens, then that means everything is set. You can let your instructor know! :)

---
### Not working or stuck somewhere?
Reach out to your instructors! They are right there. Or, schedule and come for office hours!

---
