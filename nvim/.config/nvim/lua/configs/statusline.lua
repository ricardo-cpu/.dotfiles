require "bufferline".setup()

vim.cmd([[ au VimEnter * hi BufferLineTab          guibg=NONE ]])
vim.cmd([[ au VimEnter * hi BufferLineFill         guibg=NONE ]])
vim.cmd([[ au VimEnter * hi BufferLineBackground   guibg=NONE ]])
vim.cmd([[ au VimEnter * hi BufferLineSeparator    guibg=NONE ]])
vim.cmd([[ au VimEnter * hi BufferLineSeparator    guibg=NONE ]])
vim.cmd([[ au VimEnter * hi BufferLineCloseButton  guibg=NONE ]])

function GitBranch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    local result = handle:read("*a")
    handle:close()
    result = result:gsub("[\n\r]", "")
    return result
end

vim.cmd([[ au BufWinEnter * lua vim.g.git_branch = " " .. GitBranch() .. " "]])
vim.cmd([[ au BufWinEnter * setl statusline=%#TabLineSel#%f\ %h%w%m%r\ %#QuickFixLine#%{&clipboard}%#TabLineSel#\ %=%(%l,%c%V%=\ %p%%%#DiagnosticError#%{g:git_branch}%{g:asyncrun_status}%) ]])
