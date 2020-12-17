XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"

XDG_DESKTOP_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/"
XDG_PUBLICSHARE_DIR="$HOME/"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Images"
XDG_VIDEOS_DIR="$HOME/"

# LESS
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# Pass
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

# Pylint
export PYLINTHOME="$XDG_CACHE_HOME"/pylint

# Virtualenv
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/config"

# xorg-xauth
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# xinit
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

# GTK 2
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc