return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					component_separators = { left = '|', right = '|' },
					section_separators = { left = '', right = '' },
					icons_enabled = false,
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch' },
					lualine_c = { 'filename' },
					lualine_x = { 'encoding', 'fileformat' },
					lualine_y = { 'diagnostics' },
					lualine_z = { 'location' },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { 'filename' },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
}
