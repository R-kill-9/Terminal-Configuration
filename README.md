# Terminal-Configuration

This script provides an automated script to configure **Zsh** and **Oh My Zsh** using **Agnoster** on Linux. The script uses my customized Agnoster color scheme.

---

## Features

1. **Installs Zsh** if not already installed.  
2. **Sets Zsh as the default shell**.  
3. **Installs Oh My Zsh** automatically.  
4. **Copies a pre-configured `.zshrc` file** with Agnoster.  


---

## Files Included

- `setup_zsh.sh` → The main script for automatic configuration.  
- `zshrc_config` → Pre-configured `.zshrc` file.  
- `agnoster_config` → Agnoster PROMPT settings.
  
---

## Installation & Usage

1. **Clone this repository**:  
   ```bash
   git clone https://github.com/R-kill-9/Terminal-Configuration.git
   cd Terminal-Configuration
   ```

2. Make the script executable:
   ```bash
   chmod +x setup_zsh.sh
   ```
3. Run the script:
   ```bash
   ./setup_zsh.sh
   ```
5. Restart your terminal or run:
   ```bash
   source ~/.zshrc
   ```
   
