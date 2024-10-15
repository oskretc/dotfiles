# from wsl2
alias dco="docker compose"
alias sst="svn status"
alias sup="svn update"
alias ezsh="micro ~/.zshrc"
alias rzsh="source ~/.zshrc"
alias js="j -s"
alias pass="kpcli --kdb ~/TheSecond.kdbx --readonly"

#from uranus
alias hastop="dco stop homeassistant"
alias haup="dco up -d homeassistant"
alias harm="dco rm homeassistant"
alias halogs="dco logs  -f --tail=50 homeassistant"
alias haupdate="dco pull homeassistant; dco rm -sf homeassistant; dco up -d homeassistant; dco logs -f --tail=50 homeassistant"
alias hare="dco restart homeassistant"
alias u="TERM=xterm-256color micro"
alias desk="abduco -a desk1"
alias noderedupdate="dco pull node-red; dco rm -sf node-red; dco up -d node-red; dco logs -f --tail=50 node-red"
alias cda="cd /opt/homeassistant"
alias lzd='~/.local/bin/lazydocker'
alias sz='source ~/.zshrc'
alias commitandpush='gaa; gcmsg "simple change"; gp'

#global
# added as links instead like so
# ln -s $(which fdfind) ~/.local/bin/fd
# ln -s $(which batcat) ~/.local/bin/bat
# alias bat='batcat'
# alias fd='fdfind'


# ---- Eza (better ls) -----

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --oneline --git-repos"

alias cd="z"

alias wezterm='flatpak run org.wezfurlong.wezterm'
