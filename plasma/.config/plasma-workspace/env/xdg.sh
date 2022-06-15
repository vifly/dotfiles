#!/bin/bash

# Ref: https://userbase.kde.org/Session_Environment_Variables

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx

export CARGO_HOME="$XDG_DATA_HOME"/cargo

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export GOPATH="$XDG_DATA_HOME"/go

[ -f "$XDG_CONFIG_HOME"/python/startup.py ] && export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/startup.py

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
[ -d $XDG_CONFIG_HOME/pg ] || mkdir -p "$XDG_CONFIG_HOME/pg"
[ -d $XDG_STATE_HOME ] || mkdir -p "$XDG_STATE_HOME"

export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

export KDEHOME="$XDG_CONFIG_HOME"/kde

export ANDROID_HOME="$XDG_DATA_HOME"/android

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
