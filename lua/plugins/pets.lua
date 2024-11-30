return {
	{
		"lucasdf/hologram.nvim",
		config = function()
			local hologram = require("hologram")
			hologram.setup({
				auto_display = false,
			})

			local original_buf_render_images = hologram.buf_render_images
			hologram.buf_render_images = function(buf, top, bot)
				if vim.api.nvim_buf_is_valid(buf) then
					original_buf_render_images(buf, top, bot)
				end
			end
		end
	},
	{
		"giusgad/pets.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"lucasdf/hologram.nvim"
		},
		config = function()
			vim.defer_fn(function()
				require("pets").setup({
					row = 1,
					col = 1,
					default_pet = "dog",
					default_style = "beige",
					random = false,
					speed_multiplier = 1.0,
					dead_animation = true,
				})
			end, 100)
		end
	}
}
