luafile ~/.vim/lua/init.lua

set undofile
set undodir=~/.vim/undodir

au BufEnter * noremap <c-i> <c-i>
au BufEnter * nmap <tab> i<cr><esc>
imap <c-l> <del>
nmap o A<cr>
nmap <c-j> o<esc>
nmap <c-k> O<esc>

nmap <localleader>e :vs ~/.vimrc<cr>

nmap <F11> :silent! AsyncTask run<cr>
nmap <F12> :silent! AsyncTask build<cr>

lua require('onedark').setup()
