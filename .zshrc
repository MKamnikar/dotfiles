#             _
#     _______| |__  _ __ ___
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__
#  (_)___|___/_| |_|_|  \___|

# Wal colorscheme.
# (cat ~/.cache/wal/sequences &)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random".
# It'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mh"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=6

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM="~/.oh-my-zsh/custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins_dir="$ZSH_CUSTOM/plugins"
plugins=(git fzf tmux )
#source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
source $ZSH/oh-my-zsh.sh
# source "$(navi widget zsh)"
#source ~/.zsh-syntax-highlighting/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Don't create extra files all over the place.
export PYTHONDONTWRITEBYTECODE="true"

# Roll with class.
export EDITOR=nvim
# export EDITOR="emacsclient -a '' -c -nw"

# Compilation flags.
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Use VI keybindings.
bindkey -v
bindkey "^K" up-line-or-history
bindkey "^J" down-line-or-history
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
set -o vi

# Syntax highlighting in shell
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Syntax highlighting in PAGER (manpages etc.)
# Uses system theme. Usually set to gruvbox
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Plugins
# source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Make a new folder and cd into it
mkcd(){
    if [[ -n "$1" ]]; then
        mkdir -p "$1"
        cd "$1"
    fi
}

# If no $1 defaults to 5min rest. After rest notifies user with gamma-notify and spoken notification
# that he should get back to work. rest and pause are the same.
pause(){
    if [[ -z "$1" ]]; then
        TIME="5m"
    else
        TIME=$1
    fi
    date "+Started: %T"
    echo "Pause: $TIME"
    sleep "$TIME"
    TIME='' && date && while true; do
        spd-say "Get back to work bitch"
        gamma-notify
        sleep 3
    done
}
rest(){  if [[ -z "$1" ]]; then; TIME="5m"; else; TIME=$1; fi; date "+Started: %T"; echo "Pause: $TIME"; sleep "$TIME" ; TIME='' && date && while true; do; gamma-notify; spd-say "Get back to work bitch" ; sleep 3; done; }

# Ranger.
alias r='ranger --choosedir=$HOME/.config/ranger/rangerdir; LASTDIR=`cat $HOME/.config/ranger/rangerdir`; cd "$LASTDIR"'
alias R=ranger

# Installing stuff.
alias get='sudo apt install'
alias get-rekt='sudo apt purge'
alias unget='sudo apt remove'
alias AS='apt search'

# Config files.
alias vrc='$EDITOR ~/.vimrc'
alias zrc='$EDITOR ~/.zshrc && source ~/.zshrc'
alias irc='$EDITOR ~/.config/i3/config'
alias rrc='$EDITOR ~/.config/ranger/rc.conf'
alias brc='$EDITOR ~/.config/i3blocks/i3blocks.conf'
alias Brc='$EDITOR ~/.config/bspwm/bspwmrc'
alias xrc='$EDITOR ~/.Xresources'
alias zarc='$EDITOR ~/.config/zathura/zathurarc'
alias crc='$EDITOR ~/.config/compton/compton.conf'
alias src='$EDITOR ~/.config/sxhkd/sxhkdrc'
alias drc='$EDITOR ~/.config/dunst/dunstrc'
alias nrc='$EDITOR ~/.newsboat/config'
alias mrc='$EDITOR ~/.config/mutt/muttrc'
alias normalize='xrdb ~/.Xresources && feh --bg-fill ~/.config/wallpaper/img'
# alias vrc="emacsclient -a '' -c -nw ~/.vimrc"
# alias zrc="emacsclient -a '' -c -nw ~/.zshrc && source ~/.zshrc"
# alias irc="emacsclient -a '' -c -nw ~/.config/i3/config"
# alias rrc="emacsclient -a '' -c -nw ~/.config/ranger/rc.conf"
# alias brc="emacsclient -a '' -c -nw ~/.i3blocks.conf"
# alias xrc="emacsclient -a '' -c -nw ~/.Xresources"

# Important commands.
alias ll='ls -lashF'
alias t='tmux'
alias cdc='cd ~ && clear'
alias py='python3'
alias python='python3'
alias q='exit'
alias :q='exit'
alias quit='exit'
alias ccat='highlight --out-format=ansi'
alias nb='newsboat'
alias sd='ls -1 | grep -i'
alias SD='ls -1 | fzf'
alias hosts='sudo $EDITOR /etc/hosts'
alias sources='sudo $EDITOR /etc/apt/sources.list'
alias gotosleep='i3lock -c 282828 && systemctl suspend '
alias Source='source ~/.zshrc'
alias assimilate='dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/Documents/Backup/gnome-terminal.conf && dpkg --get-selections > ~/Documents/Backup/installed-packages.txt && sudo borg create --stats --progress /media/hdd/debian-backup/::$(date +"%d-%m-%Y_%T-%a") /home/ /etc/NetworkManager/system-connections/ /etc/cifsauth /var/spool/ /usr/local/bin/ /usr/share/i3blocks/ /root/ /opt/ /etc/X11/xorg.conf.d/ --exclude ~/.cache/ --exclude ~/Videos/Temporary/ --exclude ~/VirtualBox\ VMs/ --exclude ~/Downloads/Distros/ --exclude ~/Downloads/Junk/ --exclude ~/Documents/Corona/ && echo $(date +"%F/%T") >> ~/Documents/.logs/backup.log'

# Frequent mounts.
alias mount-elements='sudo mount -t cifs -o rw -o credentials=/etc/cifsauth //192.168.1.139/share/ /media/elements/'
#alias mount-elements='sudo mount -t cifs -o rw //192.168.1.139/serije/ /media/elements/Serije && sudo mount -t cifs -o rw //192.168.1.139/Filmi/ /media/elements/Filmi && sudo mount -t cifs -o rw //192.168.1.139/backup/ /media/elements/borg-backup'

# vim and emacs.
alias nv='nvim'
alias v='nvim'
# alias vim='nvim'
alias e="emacsclient -a '' -c -nw"

# Misc.
study-time(){
NO=$(grep "$(date -Idate)" ~/Documents/.logs/study-mode.log | wc -l)
# echo "$(date +'%a, %d.%m.%Y') -- $(($NO/60)):$(($NO%60))"
printf "%s " $(date +'%a,')
printf "%s" $(date +'%d.%m.%Y')
printf " -- %02d:" $(($NO/60))
printf "%02d" $(($NO%60))
echo
}
add-corona(){
if [[ -z "$1" ]] && [[ -n $(xclip -o | grep http) ]]; then
    1=$(xclip -o)
fi
cd ~/Documents/Corona/Videos
youtube-dl --all-subs "$1" && echo "$1" >> ~/Documents/Corona/readme && echo "Done"
cd - &> /dev/null
}
listen-to-yt(){
if [[ -z "$1" ]]; then;
    echo "You didn't enter a search term !";
else;
    mpv "$(youtube-dl --default-search 'ytsearch1:' \"$1\" --get-url | tail -1)" ;
fi }
get-yt-vid(){
if [[ -z "$1" ]]; then;
    echo "You didn't enter a search term!";
else;
    youtube-dl --default-search "ytsearch1:" "$1" ;
fi }
get-yt-song(){
if [[ -z "$1" ]]; then;
    echo "You didn't enter a search term!";
else;
    youtube-dl --default-search "ytsearch1:" "$1" -x ;
fi }
say(){ cat "$1" | spd-say -e -w -i -20 }
store-links(){
if [[ -z "$1" ]]; then;
    echo "You didn't enter a filename!";
else;
    while true; do
        echo "$(xclip -o)"
        xclip -o >> "$1"
        echo '' >> "$1"
        sleep 0.5
    done
fi }
alias nf='clear && echo '' && neofetch'
alias sm='study-mode'
alias smm='study-mode -nt'
alias st='study-time'
alias tsf='timew start faks'
alias tSf='timew summary faks'
alias tsf='timew start life'
alias ts='timew stop'
alias tc='timew continue'
# MUSIC: chilled-cow, lounge, jazz, bossa-nova, chants
alias chilled-cow='mpv --volume=90 https://www.youtube.com/watch\?v\=5qap5aO4i9A &> /dev/null &'
alias lounge='mpv --volume=90 https://www.youtube.com/watch\?v\=fEvM-OUbaKs &> /dev/null &'
alias jazz='mpv --volume=90 https://www.youtube.com/watch\?v\=Dx5qFachd3A &> /dev/null &'
alias bossa-nova='mpv --volume=90 https://www.youtube.com/watch\?v\=c_dG_HxHMVI &> /dev/null &'
alias chants='mpv --loop --volume=90 https://www.youtube.com/watch\?v\=W-hrBhA4XkM &> /dev/null &'
alias doom-eternal='mpv --loop --volume=90 https://www.youtube.com/watch\?v\=Tf1DEI2lEe0 &> /dev/null &'
alias mail='neomutt'
alias weather='curl wttr.in/\'
alias routine='less ~/Documents/Other/routine'
alias todo='less ~/Documents/Other/TODO'
alias movefigs='python3 ~/Documents/Programming/Python/automate_the_boring_stuff/figure_mover/fig-mover.py'
alias chat='weechat'
alias imlost='less ~/Documents/Other/useful\ commands'
alias randomWallPaper='feh --randomize --bg-fill ~/Pictures/Wallpapers/*'
alias urnik='feh --bg-center ~/Pictures/Screenshots/urnik.png'
alias matlab='/usr/local/MATLAB/R2017a/bin/matlab'
alias anything-new='python3 ~/Documents/Programming/Python/automate_the_boring_stuff/webscraping/FMF_predmeti/downloader.py'
alias aero-blue='feh --title "fullscreen" ~/Pictures/Wallpapers/colors/aero-blue.jpg &'
alias apricot='feh --title "fullscreen" ~/Pictures/Wallpapers/colors/apricot.jpg &'
alias get-filmi='time ls -1 /media/elements/Filmi > ~/Test/filmi.txt && echo done'
alias show-qr='xclip -o | qr > /tmp/xclip-qr.png && feh --title "fehqr" /tmp/xclip-qr.png'
alias steve='spd-say'
alias knowledge-bomb='fortune linuxcookie debian-hints debian linux computers ubuntu-server-tips | cowsay -f tux | lolcat -S 1'
alias ethspeed='speedometer -r enp4s0f2'
alias wifispeed='speedometer -r wlp3s0'
alias whatsapp='yowsup-cli'

# Jump to previous dir
alias j='cd $OLDPWD'

# Jumping into dirs
alias gh='cd ~'
alias gt='cd ~/Test/'
alias ge='cd /etc'
alias gu='cd /usr'
alias gL='cd -r %f'
alias go='cd ~/Documents/ORG'
alias gv='cd /var'
alias gm='cd /media'
alias gM='cd /mnt'
alias g/='cd /'
gC() { cd ~/.config/"$1"; }
alias gk='cd ~/Desktop/kilometri'
alias gpl='cd ~/Documents/Programming/LaTeX'
alias gpy='cd ~/Documents/Programming/Python'
alias gpb='cd ~/Documents/Programming/Bash'
alias gph='cd ~/Documents/Programming/html'
alias gpp='cd ~/Documents/Programming/'
alias gek='cd /media/elements/Knjige'
alias gef='cd /media/elements/Filmi'
alias ges='cd /media/elements/Serije'
alias geo='cd /media/elements/Other'
alias gee='cd /media/elements/'
alias gD='cd ~/Downloads/'
alias gd='cd ~/Documents/'
alias gn='cd ~/Documents/Notes/'
alias gss='cd ~/Documents/School/Predmeti/'
alias gsn='cd ~/Documents/School/Predmeti/Numericne\ Metode'
alias gsm='cd ~/Documents/School/Predmeti/ModFiz1/'
alias gsS='cd ~/Documents/School/Predmeti/STD/'
alias gf='cd /media/hdd/'
alias gV='cd ~/Videos/'
alias gff='cd /media/hdd/DLNA/'
alias gfh='cd /media/hdd/'
alias gwp='cd ~/Pictures/Wallpapers/'
alias gbb='cd /usr/bin/'
alias gS='cd /usr/share/'
alias gB='cd /usr/share/i3blocks'
alias glb='cd /usr/local/bin/'

# ssh.
alias ssh-sgs='ssh u0_a233@192.168.1.123 -p 8022'
alias ssh-pi='ssh -Y pi@192.168.1.139'

# Raspi.
alias push-torrents-to-pi='scp ~/Downloads/.torrents-filmi-pi/* pi@192.168.1.139:Downloads/.torrents && mv ~/Downloads/.torrents-filmi-pi/* ~/Downloads/.torrent-copy ;
scp ~/Downloads/.torrents-other-pi/* pi@192.168.1.139:Downloads/.torrents-other && mv ~/Downloads/.torrents-other-pi/* ~/Downloads/.torrent-copy ;
scp ~/Downloads/.torrents-serije-pi/* pi@raspi:Downloads/.torrents-serije/ && mv ~/Downloads/.torrents-serije-pi/* ~/Downloads/.torrent-copy/'
alias push-joal-pi='scp ~/Downloads/.torrents-joal-pi/* pi@raspi:.config/joal/joal-conf/torrents/'
alias push-drive-pi='gdrive sync upload --keep-remote ~/Downloads/.torrents-joal-pi 1YcfuuH5GA0vW3EyzW-rKzps2MGt4nFpj'

# Notes.
alias n='note'
alias last-note='$EDITOR ~/Documents/Notes/$(ls -1 ~/Documents/Notes | tail -1 )' ## nvim --> emacs
alias lastnote='$EDITOR ~/Documents/Notes/$(ls -1 ~/Documents/Notes | tail -1 )'  ## nvim --> emacs
alias sn='grep -f ~/Documents/Notes/* | cut -c 28- | grep -i'
alias ns='grep -f ~/Documents/Notes/* | cut -c 28- | grep -i'
alias on='open-note'


# Tasks.
alias remindme='cat ~/Documents/Notes/$(ls -1 ~/Documents/Notes | tail -1 )'
alias rme='cat ~/Documents/Notes/$(ls -1 ~/Documents/Notes | tail -1 )'
alias task='$EDITOR ~/Documents/Tasks/$(date +"%F")' # this will be ported to emacs at some later date
alias T='$EDITOR ~/Documents/Tasks/$(date +"%F")'
alias c="$EDITOR ~/Documents/Calendar/timetable.calendar"
alias remind-me='cat ~/Documents/Notes/$(ls -1 ~/Documents/Notes | tail -1 )'

# DLNA - minidlna.
alias dlna-reboot='sudo service minidlna force-reload && sudo service minidlna restart'

# fzf config.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Auto-exec tmux.
# if [[ ! $TERM = screen ]]; then exec tmux; fi
