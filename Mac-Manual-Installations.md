# Day 1 Installations 


We will be installing Winget, Git, Python, VScode, and cloning a repository. Finally, we will open Jupyter notebooks from the cloned repository on VScode.



Welcome to the workshop offered by the Makerspace! You are going to spend the next 7 days learning about encryption, making your own encryption/encodings, and operating on a mesh network in your classroom. This guide will help you get started with the codebase setup, and navigate through the tasks for the workshop. Please follow these instructions carefully.



## Step 0: Install Homebrew

### Check if you have Homebrew already installed on your laptop. 

Check by:

* Open the Start Menu, search for Terminal and open it 
* Type the following command: 
> brew --version 

If you get a result such as this: `Homebrew 4.2.1` then you can move to the next step. 

Else if you get an error like: `zsh: command not found: brew` means that it is not installed. 

### If it is not installated: 

1. Copy the command in the box and paste that on the mac OS Terminal.
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/> install/HEAD/install.sh)"

2.  May ask you for your admin password (used to install necessary components).

Verify Installatio by opening Terminal and type:
> which brew 



## Step 1: Install Git 

### Check if you have Git already installed on your laptop. 

Check by:

Typing the following command on terminal: 
> which git 

If you get a result such as: `/usr/bin/git` OR `/opt/homebrew/bin/git` OR `/usr/local/bin/git` then Git is already installed, and you can skip to the next step.

### If it is not installed: 

Run the commmand the following command on Terminal:
> brew install git

After installation, close and reopen your terminal.
Verify installation: 
> git --version






## Step 2: Install Python

### Check if you already have Python installed on your laptop.

Check by:

- Typing the following commands on Terminal: 
    > which python 

    AND 

    > which python3 

    If you get a result such as this for either or the commands:
    `/usr/bin/python` OR `/opt/homebrew/bin/python3` OR `/usr/local/bin/python3` then it is correctly installed.

- If it has been installed, check the Python version by the following command on terminal:
    >python --version 

    OR (decide on the basis of which gave you the correct result in the previous check)

    > python3 --version

    If the version is greater than 3.10, then go to the next step else install python again as an update. 


### If not installed or not the latest version: 

1. Go to the link: https://www.python.org/downloads/macos/.
2. Go to the 'Downloads' section and click the 'Download for Mac OS'

This will install the latest stable version of Python 3.x, typically from the Python Software Foundation.

After installation, verify by pasting the following Command on Terminal: 
> python3 --version 


## Step 3: Install VSCode 

### Check if VS Code is already installed on your laptop

**Check by:**
Typing the following command on Terminal : 
> where code

If you get a result such as `/usr/local/bin/code` OR `/opt/homebrew/bin/code` then it means it has been installed.

Further check the version of the VSCode that is installed by: 
>code --version

If you see a version like 1.89.1 then VS Code is installed and accessible from the terminal. You can move to the next step.

### If VS Code is not installed

Run the following command on Terminal: 
>brew install --cask visual-studio-code

Further check the version of the VSCode that is installed by: 
>code --version

## Step 4: Clone the repository containing the Jupyter notebooks 

If you are familiar with Git, clone the repository given in the class QR code on Day 1. You can do this by running the following command on Terminal: 

> git clone https://github.com/tushara04/YSP_Day1.git

You can also opt to download the zip file from the repository URL, and extract it on your machine.

## Step 5: Navigate to the project 

Here's how you can navigate to the project directory:

- **On macOS:**

Go to where you have downloaded the zip file (usually `~/Downloads/`) and extract all of its contents.
Now, open a Terminal window (`Cmd + Space` to open spotlight and type `terminal` to search for the terminal app and press Enter) and follow the instructions below.
```
mv [path to]/ysp-esp32-mesh-firmware-main/
cd ..
mv ysp-esp32-mesh-firmware-main/ ysp-esp32-mesh-firmware/
cd ysp-esp32-mesh-firmware/Notebooks
code .
```


