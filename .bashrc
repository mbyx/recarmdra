# Load pyenv into the current terminal.
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Add Syncthing to PATH.
export PATH="$HOME/Documents/Syncthing:$PATH"
syncthing serve --no-browser --logfile=default > /dev/null &

# Load poetry
export PATH="$HOME/.local/bin:$PATH"
