# Setup Instructions

Run the following command to set up everything:

```bash
bash -c "cd $(mktemp -d) && curl -fsSL https://raw.githubusercontent.com/DeeprajPandey/YSP2025_TDCS/refs/heads/main/macos/run.sh -o run.sh && curl -fsSL https://raw.githubusercontent.com/DeeprajPandey/YSP2025_TDCS/refs/heads/main/macos/Brewfile -o Brewfile && bash run.sh && cd -"
```

This command downloads and executes the setup script from the remote repository.

