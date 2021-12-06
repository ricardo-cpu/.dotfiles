luafile ~/.vim/lua/init.lua

set undofile
set undodir=~/.vim/undodir

au BufEnter * nmap <space><tab> i<cr><esc>
imap <c-l> <del>
nmap o A<cr>
nmap <c-j> o<esc>
nmap <c-k> O<esc>

imap <expr> <tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<tab>'
smap <expr> <tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<tab>'

nmap <F11> :silent! AsyncTask run<cr>
nmap <F12> :silent! AsyncTask build<cr>

colo onedark
