<div align="center">
  <h1>YSP TDCS Repository</h1>
  <p>Hey, there! Welcome to YSP 2025!</p>
  <p>This guide is designed to help you navigate through the requirements of each class.</p>
</div>

---
## Day 3: 22nd May 2025
Before you follow the instructions for class 3, please make sure you have met all the requirements we covered in the second class. To check, open terminal, navigate to the Documents directory, then look for "YSP_Day1" folder. If you find it, continue with the instructions stated below. Otherwise, go back to instructions of the earlier days.

For today's class, we updated the repository and added new notebooks, challenge cards, and some reading materials. But to update the clone repository on your laptop, we need to run some commands.

1. Open terminal/PowerShell on your laptop.
2. Find and navigate to the "YSP_Day1" folder we cloned yesterday. 
3. Once you are in "YSP_Day1" (the ~ must have changed to "YSP_Day1"), run:
```
git pull
```
4. The terminal/PowerShell must output the changes made to your directory.
5. Now, in the same terminal/PowerShell, type: 
```
code .
```
If that works, Visual Studio Code must have opened with the updated YSP_Day1 directory. If it does not work, open Visual Studio Code yourself, then click on "File" on the top left corner, click on "Open Folder", and find the YSP_Day1 folder in the Documents folder (where you saved in the second class).

6. There must be now be new folders for reading materials, challenge cards, and day3 notebooks.


---
## Day 2: 21st May 2025
Before you follow the instructions for class 2, please make sure you have met all the requirements we covered in the first class. To confirm this, head to the [checklist](https://github.com/tushara04/YSP_Day1/blob/main/checklist.md). Come back here when you have checked everything!

Now that we are set, let's update the repository with the new notebook files we uploaded!
1. First open the terminal:
- If you are on Windows, press Windows + X and look for PowerShell. 
- If you are on macOS, press Cmd + Space and search for Terminal.
2. In the terminal/PowerShell that opened, type:
```
ls
```
3. You must see a lot of folders. You are in the Home directory right now. Let's navigate to the Documents folder. In the terminal/PowerShell, type:
```
cd Documents
```
4. The path on your terminal/Powershell must be updated from ~ to Documents.
5. Now, clone the repository again. Moving forward, for all our class exercises, we will navigate to Documents, then to the directory of our repository, and then to the notebooks.
6. To clone the GitHub repo, on your terminal/PowerShell, paste the following. Make sure you are on the Documents folder!
```
git clone https://github.com/tushara04/YSP_Day1.git
```
7. Then, on the terminal/PowerShell, type:
```
ls
```
8. You must see a list of all the folders in the Documents folder. Look for YSP_Day1. If you see it there, great job! If not, reach out to your instructors!
9. Open Visual Studio Code and open the YSP_Day1 folder. Then navigate as follows: notebooks > day2.

Great, you are in the directory on VS Code! Have fun doing the exercises.

---
## Day 1: 20th May 2025
This guide is to help you install some applications you will need for the class exercises over the next seven days. Follow the instructions below. If you get stuck, reach out to your instructors.

### Instructions
First, identify your computer's operation system (OS) from the list below and click on it. If the script does not work for you for some reason, you can run a manual installation, in which case you can keep a track of the [checklist](https://github.com/tushara04/YSP_Day1/blob/main/checklist.md) to ensure you have installed all the necessary applications.

1. [Windows](#windows)
2. [macOS](#macOS)

If you prefer manual installation, visit the link below:
1. [Windows](https://github.com/tushara04/YSP_Day1/blob/main/manual_installations/windows.md)
2. [macOS](https://github.com/tushara04/YSP_Day1/blob/main/manual_installations/macOS.md)
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
> **📘 Note:** To copy a command, click on the overlaped squares you see on the right edge of the box below that contains the code: ![image](https://github.com/user-attachments/assets/ff4005bb-9c20-4ea5-8dde-8acf57a135d0)

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
  
5. **Execute the YSP-Day-1 Install Script**: in the terminal window that opens, type the following command and press the "Enter" key:
```
mkdir -p ysp_setup && cd ysp_setup && for f in run.m4 Brewfile; do curl -fsSLO "https://raw.githubusercontent.com/tushara04/YSP_Day1/main/macos/$f"; done && m4 run.m4 | /bin/bash
```

If at any point the application "Visual Studio Code" opens, then that means everything is set. You can let your instructor know! :)

---
### Not working or stuck somewhere?
Reach out to your instructors! They are right there. Or, schedule and come for office hours!

---

