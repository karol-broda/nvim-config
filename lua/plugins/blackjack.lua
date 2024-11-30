return { {
	"alanfortlink/blackjack.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local colors = require("tokyonight.colors").setup()

		require("blackjack").setup({
			card_style = "large",
			uit_style = "black",
			scores_path = vim.fn.stdpath("data") .. "/blackjack_scores.json",
			keybindings = {
				["next"] = "j",
				["finish"] = "k",
				["quit"] = "q",
			},

			color_scheme = {
				background = colors.bg_dark,
				card_border = colors.fg_dark,
				card_text = colors.blue,
				highlight = colors.magenta,
				suit_red = colors.red,
				suit_black = colors.fg,
			},
		})

		vim.api.nvim_set_keymap("n", "<leader>bj", "<cmd>BlackJackNewGame<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>bq", "<cmd>BlackJackQuit<CR>", { noremap = true, silent = true })
	end,
} }
