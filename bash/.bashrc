#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export REDISCLI_HISTFILE="$XDG_DATA_HOME"/redis/rediscli_history
export REDISCLI_RCFILE="$XDG_CONFIG_HOME"/redis/redisclirc

export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config

export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
[ -d $XDG_CONFIG_HOME/pg ] || mkdir -p "$XDG_CONFIG_HOME/pg"
[ -d $XDG_STATE_HOME ] || mkdir -p "$XDG_STATE_HOME"

export CARGO_HOME="$XDG_DATA_HOME"/cargo

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

export KDEHOME="$XDG_CONFIG_HOME"/kde

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

export WGETRC="$XDG_CONFIG_HOME/wgetrc"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

[ -f "$XDG_CONFIG_HOME"/python/startup.py ] && export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/startup.py

alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

[ -d $XDG_DATA_HOME/adb ] || mkdir -p "$XDG_DATA_HOME/adb"
alias adb='HOME=$XDG_DATA_HOME/adb adb'

export GOPATH="$XDG_DATA_HOME"/go

export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history