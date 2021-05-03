#!/bin/sh
#==========================================================================#
red='\033[1;31m'
green='\033[1;32m'
purple='\033[1;35m'
blue='\033[1;34m'
nc='\033[0m'
#==========================================================================#

if [[ -z ${DOTFILES} ]]; then
    echo "${red}[!] DOTFILES environment variable is not set [!]${nc}"
    exit 1
fi

#==========================================================================#

# Backup some files/directories in home folder
backup_home() {
    
    HOME_BACKUP_DIR="$DOTFILES/.home/"

    home_backup_list=(
        ".zshenv" 
        ".xinitrc" 
        "scripts/"
        # do not add $DOTFILES folder!
    )
    
    echo -e "${purple}>>> Backing up $HOME folder <<<${nc}"
    
    mkdir -vp "$HOME_BACKUP_DIR"

    for file in "${home_backup_list[@]}"; do 
        echo -e "${blue}--> $file:${nc}"
        cp -vr "$HOME/$file" "$HOME_BACKUP_DIR"; 
    done

    echo -e "${green}>>> Backed up $HOME -> $HOME_BACKUP_DIR <<<${nc}"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

dump_packages() {

    PACKAGE_BACKUP_DIR="$DOTFILES/.util/"
    PACMAN_DUMP_FILE=".pacman_pkg_dump"
    
    echo -e "${purple}>>> Dumping packages <<<${nc}"

    mkdir -vp "$PACKAGE_BACKUP_DIR"

    pacman -Qe | awk '{print $1}' > "$PACKAGE_BACKUP_DIR/$PACMAN_DUMP_FILE"

    awk 'BEGIN{count=0} //{count++} END{print "Total:",count,"packages"}' \
        "$PACKAGE_BACKUP_DIR/$PACMAN_DUMP_FILE"

    echo -e "${green}>>> Dumped packages <<<${nc}"

}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

push_changes() {
 
    echo -e "${purple}>>> Commiting changes <<<${nc}"

    cd "$DOTFILES"
    if ! git diff --quiet HEAD || git status --short; then
        git add --all
        git commit -m "updating dotfiles on $(date -u)"
        git push origin master
    fi

    echo -e "${green}>>> Done <<<${nc}"
}

#==========================================================================#

# SCRIPT BEGIN

printf "\n"

backup_home
dump_packages
push_changes

if ! crontab -l | grep "backup_dots"; then
    echo -e "${green}>>> Registering to crontab <<<${nc}"
    (crontab -l ; echo "0 * * * * backup_dots > /dev/null 2>&1") | sort - | uniq - | crontab - 2>&1
fi

printf "\n"

#==========================================================================#
