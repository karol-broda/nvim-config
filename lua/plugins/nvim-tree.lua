return {
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local api = require("nvim-tree.api")

			local function on_attach(bufnr)
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				vim.keymap.set("n", "l", api.node.open.edit, opts("Open File or Directory"))
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open File or Directory"))
				vim.keymap.set("n", "o", api.node.open.edit, opts("Open File or Directory"))
				vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
				vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in Vertical Split"))
				vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open in Horizontal Split"))

				vim.keymap.set("n", "a", api.fs.create, opts("Add File"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename File"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete File"))

				vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
				vim.keymap.set("n", "R", api.tree.reload, opts("Refresh Tree"))
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy File"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste File"))
				vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Filename"))
				vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
				vim.keymap.set("n", "C", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				vim.keymap.set("n", "<BS>", api.node.navigate.parent, opts("Go to Parent Directory"))
			end

			require("nvim-tree").setup({
				on_attach = on_attach,
				renderer = {
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							folder = {
								arrow_closed = "▶",
								arrow_open = "▼",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					},
					highlight_git = true,
					highlight_opened_files = "all",
				},
				view = {
					width = 30,
					side = "left",
				},
				filters = {
					dotfiles = false,
					custom = { ".git" },
				},
				git = {
					enable = true,
					ignore = false,
				},
			})

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "NvimTree_*",
				callback = function()
					if vim.bo.filetype == "NvimTree" then
						vim.bo.modifiable = true
					end
				end,
			})
		end,
	},
}

