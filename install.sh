#!/bin/bash
# Symlinkes dotfiles to correct location

dotfiles=~/Dotfiles

mail=false
shell=false
scripts=false
wm=false
xWin=false
vim=false
system=false
systemd=false
git=false
app=true

linker() {
    # Symlinks file $1 to destination $2
    ## Caution: destination $2 gets removed!

    sudo rm -rf "$2" > /dev/null 2>&1
    ln -sf "$1" "$2"
}

colorizer() {
    # Replaces color placeholders in $1 and copies it to $2
    ## Caution: desitnation $2 gets removed!

    local dir="$(dirname $2)"

    sudo rm -rf "$dir" > /dev/null 2>&1
    mkdir -p "$dir"
    sh $dotfiles/colorizer.sh "$1" "$2"
}

usage() {
    printf "Usage : $0\n-p PC mode\n-s Server mode\n-h Help"
}

if [[ $# -eq 0 ]]
then
    usage
    exit 1
fi

while getopts 'hsp' flag
do
    case "${flag}" in
        p)
            # PC
            mail=true
            shell=true
            scripts=true
            wm=true
            xWin=true
            vim=true
            system=true
            systemd=true
            git=true
            app=true
            ;;
        s)
            # Server
            shell=true
            vim=true
            git=true
        ;;
        h | *)
            usage
            exit 1
            ;;
    esac
done

# Process Files
## System
### Shell
if [[ "$shell" = true ]]
then
    linker "$dotfiles/zsh/.zshrc" ~/.zshrc
    linker "$dotfiles/zsh/alias.zsh" ~/.oh-my-zsh/custom/alias.zsh
    linker "$dotfiles/zsh/jc.zsh-theme" ~/.oh-my-zsh/custom/themes/jc.zsh-theme
fi

### X
if [[ "$xWin" = true ]]
then
    linker "$dotfiles/.xcolors" ~/.xcolors
    linker "$dotfiles/zsh/.zlogin" ~/.zlogin
    linker "$dotfiles/.xinitrc" ~/.xinitrc
    linker "$dotfiles/.Xresources" ~/.Xresources
    xrdb ~/.Xresources

    linker "$dotfiles/gtk-3.0" ~/.config/gtk-3.0
    linker "$dotfiles/.gtkrc-2.0" ~/.gtkrc-2.0
fi

### System Configs
if [[ "$sytem" = true ]]
then
    linker "$dotfiles/fontconfig" ~/.config/fontconfig
    linker "$dotfiles/mimeapps.list" ~/.config/mimeapps.list
    linker "$dotfiles/locale.conf" ~/.config/locale.conf
fi

if [[ "$systemd" = true ]]
then
    sudo bash -c "$(declare -f linker); linker \"$dotfiles/acpi\" '/etc/acpi'" # Run as root
    linker "$dotfiles/systemd" ~/.config/systemd
fi

## Scripts
if [[ "$script" = true ]]
then
    linker "$dotfiles/Scripts/notifier" ~/bin/notifier
    sudo bash -c "$(declare -f linker); linker \"$dotfiles/Scripts/notifier\" '/bin/notifier'"
    linker "$dotfiles/Scripts/lock.sh" ~/bin/lock.sh
    linker "$dotfiles/Scripts/battery.sh" ~/bin/battery.sh
    linker "$dotfiles/Scripts/mailChecker.sh" ~/bin/mailChecker.sh
    linker "$dotfiles/Scripts/monitor.sh" ~/bin/monitor.sh
    linker "$dotfiles/Scripts/screenRotation.sh" ~/bin/screenRotation.sh
    linker "$dotfiles/Scripts/backlight.sh" ~/bin/backlight.sh
    sudo bash -c "$(declare -f linker); linker \"$dotfiles/Scripts/backlight.sh\" '/bin/backlight.sh'"
fi

## WM
if [[ "$wm" = true ]]
then
    linker "$dotfiles/wm/i3" ~/.config/i3
    linker "$dotfiles/wm/i3blocks" ~/.config/i3blocks
    linker "$dotfiles/wm/i3scripts" ~/.config/i3scripts
fi

## Applications
### VIM
if [[ "$vim" = true ]]
then
    mkdir -p ~/.vim/undo/ ~/.vim/backup/ ~/.vim/swap/
    mkdir -p ~/.vim/autoload
    linker "$dotfiles/.vimrc" ~/.vimrc
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    linker "$dotfiles/vim/bundle" ~/.vim/bundle
    git submodule update --init
    git submodule foreach git pull origin master
fi

### Git
if [[ "$git" = true ]]
then
    linker "$dotfiles/.gitconfig" ~/.gitconfig
fi

### Other Applications
if [[ "$app" = true ]]
then
    linker "$dotfiles/redshift" ~/.config/redshift
    colorizer "$dotfiles/dunst/dunstrc.raw" ~/.config/dunst/dunstrc
    linker "$dotfiles/mpv" ~/.config/mpv
    colorizer "$dotfiles/termite/config.raw" ~/.config/termite/config
    linker "$dotfiles/qutebrowser/config.py" ~/.config/qutebrowser/config.py
fi

## Mail
if [[ "$mail" = true ]]
then
    linker "$dotfiles/Mail/mutt" ~/.config/mutt
    linker "$dotfiles/Mail/msmtp" ~/.config/msmtp
    linker "$dotfiles/Mail/.mbsyncrc" ~/.mbsyncrc
fi
