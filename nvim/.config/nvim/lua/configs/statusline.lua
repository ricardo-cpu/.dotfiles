function GitBranch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    local result = handle:read("*a")
    handle:close()
    result = result:gsub("[\n\r]", "")
    return result
end

vim.cmd([[ au BufWinEnter * lua vim.g.git_branch = " " .. GitBranch() .. " "]])
vim.cmd([[ set statusline=%#TabLineSel#%f\ %h%w%m%r\ %#QuickFixLine#%{&clipboard}%#TabLineSel#\ %=%(%l,%c%V%=\ %p%%%#DiagnosticError#%{g:git_branch}%) ]])
