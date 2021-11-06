export PATH=$PATH:~/.local/share/nvim/site/pack/packer/start/asynctasks.vim/bin/
export PATH=$PATH:~/.dotfiles/scripts/
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export ZSH="/home/ricardo/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export REACT_TERMINAL="kitty"

gg () {
    search=$(echo $@ | sed 's/ /+/g')
    xdg-open "https://www.google.com/search?q=$search" > /dev/null 2> /dev/null
}

# ZSH_THEME="bira"
eval "$(starship init zsh)"

plugins=(
    dotenv
    asdf
	git
	zsh-syntax-highlighting
	docker
    zsh-autosuggestions
    vi-mode
    github
)

source $ZSH/oh-my-zsh.sh
alias grep='grep --color'

# auto pair plugin
source ~/.zsh-autopair/autopair.zsh
autopair-init

# alias
alias dev='~/Documentos/dev/'
dev='~/Documentos/dev'
alias sites='/srv/http/'

alias starvim='vim -S ~/.vim/pack/plugins/opt/SWTC.Vim/starwars.vim'
alias vi="vim -u NONE -c 'luafile ~/.vim/lua/configs/basic.lua' --noplugins"
alias vim='nvim'
alias as='asynctask'
alias sudoe='sudo -E vim'

alias gc='git commit -v -m'
alias ammend='git commit --amend'
alias root='cd $(git rev-parse --show-toplevel 2>/dev/null)'

alias tag='ctags -R --exclude=node_modules --exclude=.git'
alias extract='file-roller -h'
alias meta='exiftool -d "%e %B de %Y as %r %a"'
alias cleanmeta='exiftool -all:all= -overwrite_original '
alias clip='xclip -selection clipboard'

alias open='xdg-open > /dev/null 2>/dev/null'
alias restart='systemctl restart'
alias bat='bat --style numbers'
alias icat='kitty +kitten icat'
alias ktab='kitty @ launch --type=tab --keep-focus'
alias fzf="fzf --preview 'bat -P -n {}'"
alias du='du -h'
alias x='chmod +x'

alias findgit="find . -iname '.git' -exec rm -rf {} \;; find . -iname '.gitignore' -exec rm -rf {} \;; find . -iname '.github' -exec rm -rf {} \;"

alias server='python -m http.server'
alias kali='sudo docker run -ti my-kali'
. /opt/asdf-vm/asdf.sh
unalias gg

