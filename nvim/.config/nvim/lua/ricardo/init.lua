local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local init_modules = {
    "ricardo.configs.basic",
    "ricardo.configs.keymaps",
    "ricardo.configs.options",
    "ricardo.plugins.packer",
    "ricardo.plugins.lsp",
    "ricardo.plugins.telescope",
    "ricardo.plugins.cmp",
    "ricardo.plugins.debugger",
    "ricardo.plugins.treesitter",
    "ricardo.plugins.statusline",
    "ricardo.plugins.others"
}

for _, module in ipairs(init_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end
