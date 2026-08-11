[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Linux](https://img.shields.io/badge/OS-GNU%2FLinux-archlinux?logo=linux&logoColor=white)](https://www.kernel.org/)
[![Ghostty](https://img.shields.io/badge/Terminal-Ghostty-412991?style=flat-square&logo=ghostty&logoColor=white)](https://ghostty.org/)
[![Oh My Zsh](https://img.shields.io/badge/Shell-Oh_My_Zsh-F15A24?style=flat-square&logo=zsh&logoColor=white)](https://ohmyz.sh/)
[![Oh My Posh](https://img.shields.io/badge/Prompt-Oh_My_Posh-007ACC?style=flat-square&logo=ohmyposh&logoColor=white)](https://ohmyposh.dev/)
[![Neovim](https://img.shields.io/badge/Editor-Neovim-green?logo=neovim&logoColor=white)](https://neovim.io/)
[![Tmux](https://img.shields.io/badge/Multiplexer-Tmux-1BB91F?style=flat-square&logo=tmux&logoColor=white)](https://github.com/tmux/tmux)

#  :penguin: My .dotfiles

This repository contains my personal development environment and workflow configurations for UNIX-like systems (`dnf5` & `apt` aliases are supported). They are modularly organized using **GNU Stow** and structured following the **XDG Base Directory Specification**.

---

## :clipboard: Prerequisites

Before deploying these dotfiles onto a new system, ensure you have the following core packages and tools installed on your GNU/Linux distribution:

* **Git:** To clone the repository and manage submodules.
* **GNU Stow:** To manage symlinks in your `$HOME` directory.
* **Zsh:** As the primary shell.
* **Tmux:** Terminal multiplexer.
* **Curl.** To download scripts or binaries like Oh My Zsh & Oh My Posh.
* **Ghostty:** It embeds JetBrains Mono as its default font and includes built-in Nerd Font icon symbol support out of the box.

> [!CAUTION]
> If you don't want to use Ghostty, fonts such as [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) are needed to correctly load the glyphs and icons.

### Quick installation commands

* **Debian / Ubuntu / Linux Mint:**
  ```bash
  sudo apt update && sudo apt install -y git stow zsh tmux curl
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
  ```

* **Fedora:**
  ```bash
  sudo dnf install -y git stow zsh tmux curl
  
  dnf copr enable scottames/ghostty
  dnf install ghostty
  ```

## :computer: Step-by-step installation

Follow these terminal commands to deploy the configuration to your `$HOME` directory.

### Step #1: Clone the repository (with submodules)

It is essential to use the `--recurse-submodules` flag to automatically pull all Zsh plugins and linked tools managed as Git submodules:

```bash
git clone --recurse-submodules https://github.com/soy-daniel-hidalgo/.dotfiles.git ~/.dotfiles
```

> [!NOTE]
> If you forgot to include submodules when cloning, navigate into the directory and initialize them manually.

```bash
cd ~/.dotfiles
git submodule update --init --recursive
```

### Step #2: Create base directories

Ensure the target core directories exist in your `$HOME` folder prior to running Stow. This prevents Stow from symlinking entire directories instead of individual files:

```bash
mkdir -p ~/.config ~/.local/share
```

### Step #3: Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step #4: Apply packages using GNU Stow

Navigate to the `~/.dotfiles` directory and deploy only the packages you need on the current system using stow:

```bash
cd ~/.dotfiles

# Apply configurations
stow cli-toys ghostty git nvim tmux zsh vscode
```

> [!IMPORTANT]
> If you ever want to remove a symlinked package, simply run `stow -D <package_name>`.

### Step #5: Environment variables & local git config

1. **Zsh:** Ensure `~/.zshenv` sets the correct `ZDOTDIR` path if you haven't configured it globally yet.

2. **Local git setup:** To avoid committing personal credentials or emails to a public repository, create a local un-tracked configuration file:

```bash
git config --local user.name your-name
git config --local user.email your-email@example.com
```

### Step #6: Install Tmux Plugin Manager plugins

1. Reload TMUX environment so TPM is sourced:

```bash
# type this in terminal if tmux is already running
tmux source ~/.config/tmux/tmux.conf
```

2. Inside Tmux, press `prefix + I` (capital i, as in **I**nstall) to fetch the plugin. You're good to go! The plugin was cloned to `~/.config/tmux/plugins/` dir and sourced.

### Step #7: Install Oh My Posh (Optional)

If you use the Oh My Posh prompt engine, download the binary directly into your local user path:

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

## :open_file_folder: Repository structure & highlights

```
~/.dotfiles/
├── cli-toys/           # Bash scripts & colorscripts by shell-color-scripts
├── ghostty/            # Ghostty config + Oh-My-Posh Catppuccin theme 
├── git/                # Public .gitconfig & .gitignore_global settings
├── nvim/               # Neovim with Lazyvim setup (.config/nvim)
├── tmux/               # Tmux & TPM configuration (.config/tmux)
├── vscode/             # VS Code settings.json + keybindings.json
├── zsh/                # Zsh & Oh My Zsh configuration (.config/zsh and submodules)
├── .gitignore
├── .gitmodules
├── .stow-local-ignore
├── LICENSE
└── README.md           # Repository documentation - You are here \(•◡•)/
```
## :page_facing_up: License

This repository is licensed under the MIT License. Feel free to use, adapt, or copy any part of these dotfiles for your own setup.
