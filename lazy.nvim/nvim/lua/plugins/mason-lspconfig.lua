return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "neovim/nvim-lspconfig" },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local set = vim.keymap.set
				local opts = { buffer = args.buf }
				set("n", "gD", vim.lsp.buf.declaration, opts)
				set("n", "gd", vim.lsp.buf.definition, opts)
				set("n", "K", vim.lsp.buf.hover, opts)
				set("n", "gi", vim.lsp.buf.implementation, opts)
				set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				set(
					"n",
					"<space>wl",
					function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					opts
				)
				set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				set("n", "<space>rn", vim.lsp.buf.rename, opts)
				set("n", "<space>ca", vim.lsp.buf.code_action, opts)
				set("n", "gr", vim.lsp.buf.references, opts)
				set("n", "<space>e", vim.diagnostic.open_float, opts)
				set("n", "[d", vim.diagnostic.goto_prev, opts)
				set("n", "]d", vim.diagnostic.goto_next, opts)
				set("n", "<space>q", vim.diagnostic.setloclist, opts)
				set("n", "<space>f", vim.lsp.buf.format, opts)
			end,
		})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "intelephense", "markdown_oxide", "ts_ls" },
		})

		for _, server in ipairs({ "gopls", "rust_analyzer", "intelephense", "markdown_oxide", "ts_ls" }) do
			vim.lsp.config(server, {})
			vim.lsp.enable(server)
		end
	end,
}
