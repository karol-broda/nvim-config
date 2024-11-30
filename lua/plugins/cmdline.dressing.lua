return {
	"stevearc/dressing.nvim",
	event = "BufReadPre",
	config = function()
		require("dressing").setup({
			input = {
				enabled = true,
				default_prompt = "Input:",
			},
			select = {
				enabled = true,
				backend = { "telescope", "fzf", "builtin" },
			},
		})
	end,
}
