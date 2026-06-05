local has_compiler = vim.fn.executable("cc") == 1
	or vim.fn.executable("gcc") == 1
	or vim.fn.executable("clang") == 1
	or vim.fn.executable("zig") == 1

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = has_compiler and ":TSUpdate" or nil,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			modules = {},
			ensure_installed = has_compiler and { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" }
				or {},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			ignore_install = {},
			auto_install = has_compiler,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
