local clipboard_tools = {
	"wl-copy",
	"pbcopy",
	"xclip",
	"xsel",
	"win32yank",
}

local has_clipboard_tool = false

for _, tool in ipairs(clipboard_tools) do
	if vim.fn.executable(tool) == 1 then
		has_clipboard_tool = true
		break
	end
end

if not has_clipboard_tool then
	local ok, osc52 = pcall(require, "vim.ui.clipboard.osc52")

	if ok then
		vim.g.clipboard = {
			name = "OSC 52",
			copy = {
				["+"] = osc52.copy("+"),
				["*"] = osc52.copy("*"),
			},
			paste = {
				["+"] = osc52.paste("+"),
				["*"] = osc52.paste("*"),
			},
		}
	end
end

vim.o.clipboard = "unnamedplus"
