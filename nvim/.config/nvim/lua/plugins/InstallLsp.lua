
local servers = {
    "dockerfile",
    "lua",
    "bash",
    "rust",
    "vim",
    "python",
    "typescript",
    "tex",
}

for k,v in pairs(servers) do
    require'lspinstall'.install_server(v)
end
