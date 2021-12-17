local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local init_modules = {
    "configs.basic",
    "configs.keymaps",
    "configs.options",
    "plugins.packer",
    "plugins.lsp",
    "plugins.telescope",
    "plugins.cmp",
    "plugins.debugger",
    "plugins.treesitter",
    "plugins.statusline",
    "plugins.others"
}

for _, module in ipairs(init_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end
