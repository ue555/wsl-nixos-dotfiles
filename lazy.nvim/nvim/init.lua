local config_root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
vim.g.lazy_dotfiles_config_root = config_root
vim.opt.runtimepath:prepend(config_root)

vim.opt.number = true

local current_listchars = vim.opt.listchars:get()
current_listchars.space = "."
vim.opt.listchars = current_listchars

vim.opt.list = true

require("core.lazyvim")
require("core.clipboard")
require("core.keymaps")
