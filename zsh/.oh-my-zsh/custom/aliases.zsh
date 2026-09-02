# Package manager dnf5

# Update dependencies
alias update="sudo dnf5 update"

# Autoremove unneeded packages
alias autoremove="sudo dnf5 autoremove"

# List installed packages
alias installed="dnf5 list --installed | fzf"

# Quick access

# Images
alias pics="cd ~/Pictures"

# Videos
alias videos="cd ~/Videos"

# Downloads
alias downloads="cd ~/Downloads"

# Documents
alias docs="cd ~/Documents"

# Desktop
alias desk="cd ~/Desktop"

# Music
alias music="cd ~/Music"

# Applications
alias apps="cd ~/Applications"

# CLI navigation

# eza
alias ls="eza --icons --color=always --git --no-filesize --no-time --no-user --no-permissions"

alias la="eza --icons -lgha --group-directories-first"

alias lt="eza --icons --tree"

alias lta="eza --icons --tree -lgha"

# batcat
alias cat='bat --theme=$BAT_THEME --style=plain --paging=never $@'

alias bat='bat --theme=$BAT_THEME'

# fzf
alias preview='fzf --preview "batcat --color=always --style=numbers --line-range=:500 {}"'

alias edit='nvim $(preview)'

# Large files on disk
alias largefile="du -h -x -s -- * | sort -r -h | head -20"

# Utilities

# Search manual
alias findman="compgen -c | fzf | sort | xargs man"

# Search environment variables
alias getenv="printenv | sort | fzf"

# Search aliases
alias getalias="alias | sort | fzf"

# Reload .zshrc
alias reload="source ~/.zshrc"

# Unsource shell
alias unsource="exec $SHELL -l"

# Source control

# Print git-log as graph
alias gitgraph="git log --graph --decorate --abbrev-commit --all --pretty=oneline"

# Edit config files

# bashrc
alias bashconf="nvim ~/.bashrc"

# zshrc
alias zshconf="nvim ~/.zshrc"

# zshenv
alias zshenv="nvim ~/.zshenv"

# autostart
alias autostart="nvim $ZSH/custom/autostart.zsh"

# Check my aliases
alias aliases="nvim $ZSH/custom/aliases.zsh"

# CLI toys
alias toysconf="nvim $ZSH/custom/toysrc.zsh"

# Oh-My-Zsh config directory
alias omzconf="nvim $ZSH"

# Neovim config directory with lazyvim setup
alias nvimconf="nvim $XDG_CONFIG_HOME/nvim"

# tmux
alias tmuxconf="nvim $XDG_CONFIG_HOME/tmux/tmux.conf"

