local o = vim.o

function StatusClipboard()
    if o.clipboard == 'unnamedplus' then
        o.clipboard = ''
    else
        o.clipboard = 'unnamedplus'
    end
end

-- .vim file functions
function GitDir()
    local handle = io.popen('git rev-parse --show-toplevel 2>/dev/null')
    local result = handle:read("*a")
    handle:close()
    result = result:gsub("[\n\r]", "")
    return result
end

function SourceVim()
    if vim.fn.filereadable('.vim') == 1 then
        vim.cmd([[ source .vim ]])
    else
        vim.cmd("silent! source " .. GitDir() .. "/.vim")
    end
end

function SourceSession()
    if vim.fn.expand('%') == '' and vim.fn.filereadable(GitDir() .. '/Session.vim') == 1 then
        vim.cmd("so " .. GitDir() .. "/Session.vim" )
    end
end

vim.cmd([[au! bufwritepost ~/.vimrc source ~/.vimrc]])
vim.cmd[[ au! VimEnter * lua SourceVim() ]]
vim.cmd([[ au! VimEnter * lua SourceSession() ]])

-- Backup directory

if vim.fn.isdirectory('/tmp/backup/') == 0 then
    os.execute('mkdir /tmp/backup')
end

-- Alias
vim.cmd([[
fun! Alias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
]])

-- commands
vim.cmd([[ command W w ]])
vim.cmd([[ cnoreabbrev as AsyncRun ]])

-- Templates

local filetypes = {}
local path = "~/.vim/templates/"

local handle = io.popen('ls -A 2>/dev/null ' .. path .. [[ | grep -o '\..*']])

for file in handle:lines() do
    table.insert(filetypes, file)
end

handle:close()

for type in pairs(filetypes) do
    vim.cmd("au! BufNewFile *" .. filetypes[type] .. " 0r " .. path .. "template" .. filetypes[type])
end

-- filetype plugin
vim.cmd([[filetype plugin on]])
vim.cmd([[filetype indent on]])

vim.cmd([[au FocusGained,BufEnter * checktime]])

-- Return to last position
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

vim.cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])
vim.cmd([[autocmd InsertLeave * setl relativenumber]])
vim.cmd([[autocmd InsertEnter * setl norelativenumber]])

-- Enable syntax highlighting
vim.cmd([[ syntax enable ]])
vim.cmd([[ syntax on ]])
vim.api.nvim_set_var( "vimsyn_embed", "lPr" )
vim.g["markdown_fenced_languages"] = {'html', 'python', 'ruby', 'vim', 'javascript', 'json', 'css'}

-- Let 'tl' toggle between this and the last accessed tab
vim.api.nvim_set_var('lasttab', 1)
vim.cmd([[au TabLeave * let g:lasttab = tabpagenr()]])

-- statusline without plugin
function GitBranch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    local result = handle:read("*a")
    handle:close()
    result = result:gsub("[\n\r]", "")
    return result
end

-- vim.cmd([[ au BufWinEnter * lua vim.g.git_branch = " " .. GitBranch() .. " "]])
-- vim.cmd([[ au BufWinEnter * setl statusline=%#TabLineSel#%f\ %h%w%m%r\ %#QuickFixLine#%{&clipboard}%#TabLineSel#\ %=%(%l,%c%V%=\ %p%%%#DiagnosticError#%{g:git_branch}%{g:asyncrun_status}%) ]])

