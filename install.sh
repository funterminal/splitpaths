#!/bin/sh

OS="$(uname)"
DISTRO=""

if [ "$OS" = "Darwin" ]; then
    if command -v brew >/dev/null 2>&1; then
        PKG_INSTALL="brew install wget"
    elif command -v port >/dev/null 2>&1; then
        PKG_INSTALL="sudo port install wget"
    else
        exit 1
    fi
elif [ "$OS" = "FreeBSD" ]; then
    PKG_INSTALL="sudo pkg install -y wget"
elif [ "$OS" = "Linux" ]; then
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    fi
    case "$DISTRO" in
        ubuntu|debian)
            PKG_INSTALL="sudo apt update && sudo apt install -y wget"
            ;;
        fedora)
            PKG_INSTALL="sudo dnf install -y wget"
            ;;
        arch)
            PKG_INSTALL="sudo pacman -Sy --noconfirm wget"
            ;;
        alpine)
            PKG_INSTALL="sudo apk add wget"
            ;;
        *)
            if [ -n "$PREFIX" ] && [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
                PKG_INSTALL="apt update && apt install -y wget"
            else
                exit 1
            fi
            ;;
    esac
else
    exit 1
fi

if ! command -v wget >/dev/null 2>&1; then
    eval "$PKG_INSTALL"
fi

wget -O splitpaths.sh https://raw.githubusercontent.com/funterminal/splitpaths/refs/heads/main/splitpaths.sh
wget -O splitpaths.1 https://raw.githubusercontent.com/funterminal/splitpaths/refs/heads/main/splitpaths.1
chmod +x splitpaths.sh

SHELL_NAME=$(basename "$SHELL")
CONFIG_FILE=""

case "$SHELL_NAME" in
    bash)
        CONFIG_FILE="$HOME/.bashrc"
        ;;
    zsh)
        CONFIG_FILE="$HOME/.zshrc"
        ;;
    fish)
        CONFIG_FILE="$HOME/.config/fish/config.fish"
        ;;
    tcsh)
        CONFIG_FILE="$HOME/.tcshrc"
        ;;
    csh)
        CONFIG_FILE="$HOME/.cshrc"
        ;;
    ksh)
        CONFIG_FILE="$HOME/.kshrc"
        ;;
    *)
        exit 1
        ;;
esac

echo "alias splitpaths='sh $(pwd)/splitpaths.sh'" >> "$CONFIG_FILE"
echo 'man() {' >> "$CONFIG_FILE"
echo '  if [[ "$1" == "splitpaths" ]]; then' >> "$CONFIG_FILE"
echo '    command man ./splitpaths.1' >> "$CONFIG_FILE"
echo '  else' >> "$CONFIG_FILE"
echo '    command man "$@"' >> "$CONFIG_FILE"
echo '  fi' >> "$CONFIG_FILE"
echo '}' >> "$CONFIG_FILE"

if [ "$SHELL_NAME" = "fish" ]; then
    . "$CONFIG_FILE"
else
    . "$CONFIG_FILE"
fi
