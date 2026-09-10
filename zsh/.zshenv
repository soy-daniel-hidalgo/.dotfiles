# .zshenv often contains exported variables that should be available to other programs.
# For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv.
# You can set $ZDOTDIR in .zshenv to specify an alternative location for the rest of your zsh configuration.

# manually set language environment
export LANG=es_ES.UTF-8

# manually set ANSI color codes
export TERM="xterm-256color"

# manually set XDG_CONFIG_HOME if previously undefined
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='nano'
fi

# NOTE: the bat command supports a config-file by default
export PAGER="less"

export BAT_THEME="Dracula"

export BAT_PAGER="$PAGER -RF" # less is the default pager

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
