export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.local/share/nvim/site/pack/packer/start/asynctasks.vim/bin/
export PATH=$PATH:~/.dotfiles/scripts/
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:~/.luarocks/bin
export PATH=$PATH:~/.cargo/bin
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export REACT_TERMINAL="kitty"

gg () {
    search=$(echo $@ | sed 's/ /+/g')
    xdg-open "https://www.google.com/search?q=$search" > /dev/null 2> /dev/null
}

h () {
    printf "%'d\n" $@
}

md () {
    mkdir -p $@ && cd $1
}

# ZSH_THEME="bira"
eval "$(starship init zsh)"

plugins=(
    dotenv
    autoswitch_virtualenv
    asdf
	git
	zsh-syntax-highlighting
	docker
    zsh-autosuggestions
    vi-mode
    github
    heroku
)

source $ZSH/oh-my-zsh.sh
alias grep='grep --color'

# auto pair plugin
source ~/.zsh-autopair/autopair.zsh
autopair-init

# alias
alias dev='~/Documents/dev/'
dev="$HOME/Documents/dev"
alias sites='/srv/http/'

alias starvim='vim -S ~/.vim/pack/plugins/opt/SWTC.Vim/starwars.vim'
alias vi="vim -u NONE -c 'syntax on' -c 'colo onedark' -c 'set number'"
alias vim='nvim'
alias as='asynctask'
alias sudoe='sudo -E vim'

alias gc='git commit -v -m'
alias ammend='git commit --amend'
alias root='cd $(git rev-parse --show-toplevel 2>/dev/null)'
root=$(git rev-parse --show-toplevel 2>/dev/null)

alias tag='ctags -R --exclude=node_modules --exclude=.git'
alias extract='file-roller -h'
alias meta='exiftool -d "%e %B de %Y as %r %a"'
alias cleanmeta='exiftool -all:all= -overwrite_original '
alias clip='xclip -selection clipboard'
alias dj='django-admin '

alias icat='kitty +kitten icat'
alias ktab='kitty @ launch --type=tab --keep-focus'

alias open='xdg-open > /dev/null 2>/dev/null'
alias restart='systemctl restart'
alias bat='bat --style numbers'
alias fzf="fzf --preview 'bat -P -n {}'"
alias du='du -h'
alias x='chmod +x'
alias xargs='xargs '
alias d=docker
alias p=python
alias ip=ipython
alias wget="wget -c"
alias findgit="find . -iname '.git' -exec rm -rf {} \;; find . -iname '.gitignore' -exec rm -rf {} \;; find . -iname '.github' -exec rm -rf {} \;"
alias gs=~/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js

alias server='python -m http.server'
. $HOME/.asdf/asdf.sh
unalias gg
unalias md

source ~/.zshrc_private
