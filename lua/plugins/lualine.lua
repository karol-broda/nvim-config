return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "solarized",
					component_separators = { left = '|', right = '|' }, -- Simple vertical bars instead of arrows
					section_separators = { left = '', right = '' }, -- Remove the section separators entirely
					icons_enabled = false, -- Disables all icons, including any OS logos or other icons
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
