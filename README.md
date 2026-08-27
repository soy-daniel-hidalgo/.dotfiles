# :penguin: My .dotfiles

[![Linux](https://img.shields.io/badge/OS-GNU%2FLinux-yellow?logo=linux&logoColor=white)](https://www.kernel.org/)
[![Ghostty](https://img.shields.io/badge/Terminal-Ghostty-3551F3?logo=ghostty&logoColor=white)](https://ghostty.org/)
[![Oh My Zsh](https://img.shields.io/badge/Zsh-Oh_My_Zsh-F15A24?logo=zsh&logoColor=white)](https://ohmyz.sh/)
[![Oh My Bash](https://img.shields.io/badge/Bash-Oh_My_Bash-1B365D?logo=gnu-bash&logoColor=white)](https://ohmybash.nntoan.com/)
[![Oh My Posh](https://img.shields.io/badge/Prompt-Oh_My_Posh-1f6fd0?logoColor=white)](https://ohmyposh.dev/)
[![Neovim](https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white)](https://neovim.io/)
[![LazyVim](https://img.shields.io/badge/IDE-LazyVim-2E7DE9?logo=lazyvim&logoColor=white)](https://www.lazyvim.org/)
[![Lazygit](https://img.shields.io/badge/Git-Lazygit-80B3FF?logo=git&logoColor=white)](https://github.com/jesseduffield/lazygit)
[![Tmux](https://img.shields.io/badge/Multiplexer-Tmux-1BB91F?logo=tmux&logoColor=white)](https://github.com/tmux/tmux)
[![License: MIT](https://img.shields.io/badge/License-MIT-9E95B7.svg)](https://opensource.org/licenses/MIT)

This repository contains my personal development environment and workflow configurations for UNIX-like systems. It is designed to be simple, lightweight, and ready to use out of the box.

To avoid unnecessary distractions and configuration overhead, I stick to the default settings of each tool as much as possible while maintaining a clean and aesthetic setup.

The configurations are modularly managed using [**GNU Stow**](https://www.gnu.org/software/stow/stow.html) and follow the [**XDG Base Directory Specification**](https://specifications.freedesktop.org/basedir/latest/) to keep the `$HOME` directory clean and organized.

---

## :hammer_and_wrench: Features & philosophy

* **Out-of-the-Box Setup:** Minimal configuration required to get up and running.
* **Minimalist & Aesthetic:** Stays close to sensible defaults while keeping a cohesive visual style.
* **XDG Compliant:** It means configuration resides inside directories like `$XDG_CONFIG_HOME` and `$XDG_DATA_HOME` (typically `~/.config` and `~/.local/share`) rather than cluttering `~`.
* **Modular Structure:** Managed effortlessly using GNU Stow for simple symlinking.

---

## :clipboard: Prerequisites

Before deploying these dotfiles onto a new system, ensure you have the following core packages and tools installed on your GNU/Linux distribution:

* **Bash:** As the primary shell.
* **Zsh:** Secondary shell with enhanced auto-completion capabilities.
* **Git:** To clone the repository and manage submodules.
* **GNU Stow:** Manages symlinks from `~/.dotfiles` to `$HOME`, keeping configurations modular and separated.
* **Neovim:** Hyperextensible Vim-based text editor serving as the primary IDE, powered by [LazyVim](https://www.lazyvim.org/) and integrated with [Lazygit](https://github.com/jesseduffield/lazygit).
* **Tmux:** Terminal multiplexer to manage multiple sessions and windows from a single screen. Extended via [TPM](https://github.com/tmux-plugins/tpm) (Tmux Plugin Manager).
* **Curl:** Command-line tool to download scripts and binaries like Oh My Zsh.
* **Ghostty:** Terminal emulator that works out of the box with minimal configuration required. It features JetBrains Mono as its default font with built-in Nerd Font symbols, along with support for true color and undercurls.

> [!CAUTION]
> If you don't want to use Ghostty, you'll need to install Nerd Fonts like [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) to correctly load the glyphs and icons.

### Quick installation commands

* **Debian / Ubuntu / Linux Mint:**

```bash
sudo apt update && sudo apt install -y bash zsh git stow neovim tmux curl

# ghostty
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
```

* **Fedora:**

```bash
sudo dnf5 install -y bash zsh git stow neovim tmux curl

# ghostty
sudo dnf5 copr enable -y scottames/ghostty && sudo dnf5 install -y ghostty
```

## :computer: Manual installation guide

Follow these terminal commands to deploy the configuration to your `$HOME` and XDG Base Directories.

### Step 0: Make Bash or Zsh your default shell

If you haven't already, set your default shell now. You will need to restart your system for the changes to take effect.

```bash
# Set Bash as default shell
chsh --shell /bin/bash $(whoami)

# Set Zsh as default shell
chsh --shell /bin/zsh $(whoami)
```

> [!TIP]
> You can check all installed shells on your machine by running `chsh --list-shells`.

### Step 1: Clone the repository (with submodules)

It is essential to use the `--recurse-submodules` flag to automatically pull others sources, like all Zsh plugins and other tools managed as Git submodules:

```bash
git clone --recurse-submodules https://github.com/soy-daniel-hidalgo/.dotfiles.git ~/.dotfiles
```

> [!NOTE]
> If you forgot to include submodules when cloning, navigate into the directory and initialize them manually:

```bash
cd ~/.dotfiles
git submodule update --init --recursive
```

### Step 2: Create base directories

Create the essential base directories in your `$HOME` folder before running Stow. This ensures Stow symlinks individual configuration files rather than entire directories:

```bash
mkdir -p ~/.config ~/.local/bin ~/.local/share
```

### Step 3: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 4: Install Oh My Bash

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```

### Step 5: Install Oh My Posh

To use the Oh My Posh prompt engine, run the official installation script:

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

### Step 6: Install useful TUI & CLI utilities

* **Debian / Ubuntu / Linux Mint:**

```bash
# TUIs & CLI utilities + lazygit
sudo apt install -y eza bat fzf fd-find zoxide htop ripgrep jq lazygit fastfetch

# latest git-delta release
ARCH=$(dpkg --print-architecture) && \
URL=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep "browser_download_url.*git-delta_.*_${ARCH}\.deb" | cut -d : -f 2,3 | tr -d \") && \
wget -O /tmp/git-delta.deb "$URL" && \
sudo dpkg -i /tmp/git-delta.deb && rm /tmp/git-delta.deb

# yazi
curl -fsSL https://yazi-rs.github.io/builds/yazi-keyring.gpg | sudo tee /usr/share/keyrings/yazi-keyring.gpg >/dev/null && \
echo 'deb [signed-by=/usr/share/keyrings/yazi-keyring.gpg] https://yazi-rs.github.io/builds/ stable main' | sudo tee /etc/apt/sources.list.d/yazi.list >/dev/null && \
sudo apt update && sudo apt install -y yazi
```

* **Fedora:**

```bash
# TUIs & CLI utilities + lazygit
sudo dnf5 install -y eza bat fzf fd-find zoxide htop ripgrep jq fastfetch

# lazygit
sudo dnf5 copr enable -y atim/lazygit && sudo dnf5 install -y lazygit

# git-delta
sudo dnf5 install -y git-delta

# yazi
sudo dnf copr enable -y lihaohong/yazi && sudo dnf install -y yazi
```

### Step 7 (Optional): Install ble.sh on Bash

Bash Line Editor, better known as [ble.sh](https://github.com/akinomyoga/ble.sh) is a command line editor which replaces the default GNU Readline. Provides features like syntax highlighting and enhanced auto-completion for Bash. If you opt to install it, run the following commands:

```bash
git clone --recursive https://github.com/akinomyoga/ble.sh.git ~/ble.sh
cd ~/ble.sh
make install

# run inside ~/ble.sh
source out/ble.sh

# delete ble.sh from $HOME
rm -r ~/ble.sh
```

> [!WARNING]
> If you won't install **ble.sh**, you must manually remove the following lines from `~/.bashrc` or `~/.dotfiles/bash/.bashrc` to avoid problems:

```bash
# Loads ble.sh for syntax highlighting and auto-suggestions
# Docs: https://github.com/akinomyoga/ble.sh/wiki
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh
``` 

### Step 8: Deploy configurations with GNU Stow

Navigate to the `~/.dotfiles` directory and apply only the packages you need using Stow:

```bash
cd ~/.dotfiles

# apply all configurations
stow bash eza fastfetch ghostty git git-delta lazygit nvim ohmyposh shellscripts tmux vscode yazi zsh --adopt
```

> [!IMPORTANT]
> If you ever want to remove a symlinked package, simply run `stow -D <package_name>`.

### Step 9: Environment variables & repository cleanup

1. **Zsh:** Ensure `~/.zshenv` sets the correct `ZDOTDIR` path if it is not already configured globally.

2. **Remove Git history:** To detach this setup from the source repository and start a fresh history, delete the `.git` folder:

```bash
rm -rf ~/.dotfiles/.git
```

> [!TIP]
> Always configure your local identity inside work or personal repositories to keep personal information and email addresses private by running `git config --local user.name "Your Name"` and `git config --local user.email "your-email@example.com"`.

### Step 10: Install Tmux plugins via TPM

1. Reload the Tmux environment to source TPM:

```bash
# run this in your terminal if Tmux is currently running
tmux source ~/.config/tmux/tmux.conf
```

2. Inside Tmux, press `prefix + I` (capital **I**) to install the plugins.

Once completed, TPM will clone the plugins into `~/.config/tmux/plugins/` and automatically source them. Just reload your Tmux session for the changes to take effect.

### Step 11: Enter Neovim to install plugins

Run `nvim` to launch Neovim and trigger the automatic plugin installation via `lazy.nvim`.

1. **Automatic sync:** `lazy.nvim` will automatically detect missing plugins, download them, and build any dependencies upon startup.

2. **Check status:** Once the UI loads, press `L` (or run `:Lazy`) inside Neovim to view the plugin installation progress.

3. **Finish:** Wait until all plugins show a green checkmark, then press `q` to close Lazy and start using Neovim.

## :open_file_folder: Repository structure & highlights

```text
~/.dotfiles/
├── bash/                  # Bash & Oh My Bash configuration
├── eza/                   # Custom configuration for eza
├── fastfetch/             # Fastfetch configuration files
├── ghostty/               # Ghostty config integrated with Oh My Posh config 
├── git/                   # Global Git config & .gitignore_global
├── lazygit/               # Lazygit configuration
├── nvim/                  # Neovim & LazyVim distribution setup
├── ohmyposh/              # Oh My Posh custom themes & scripts
├── shellscripts/          # Helper scripts & colorscripts
├── tmux/                  # Tmux & TPM plugin manager setup
├── vscode/                # Visual Studio Code settings & keybindings
├── yazi/                  # Yazi terminal file manager config & theme
├── zsh/                   # Zsh & Oh My Zsh framework setup
├── .gitignore             # Files ignored by Git
├── .gitmodules            # Git submodules configuration
├── .stow-local-ignore     # Files ignored by GNU Stow during symlinking
├── LICENSE                # MIT License file
└── README.md              # Repository documentation — You are here \(•◡•)/
```

## :page_facing_up: License

This repository is licensed under the MIT License. Feel free to use, adapt, or copy any part of these dotfiles for your own setup.
