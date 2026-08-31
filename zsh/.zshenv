# .zshenv often contains exported variables that should be available to other programs.
# For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv.
# You can set $ZDOTDIR in .zshenv to specify an alternative location for the rest of your zsh configuration.

# manually set language environment
export LANG=es_ES.UTF-8

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='nano'
fi

# batcat
# NOTE: the bat command supports a config-file by default
export BAT_THEME="Dracula"

export BAT_PAGER="$PAGER -RF" # less is the default pager

# man
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
