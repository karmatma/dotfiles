return {
	-- {
	-- 	"eddyekofo94/gruvbox-flat.nvim",
	-- 	priority = 1000,
	-- 	enabled = true,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme gruvbox-flat]])
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	priority = 1000,
	-- 	-- config = function()
	-- 	-- 	vim.cmd.colorscheme("dayfox")
	-- 	-- end,
	-- },

	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			-- vim.opt.background = "light"
			vim.g.everforest_background = "soft"
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme("everforest")
		end,
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine-dawn")
	-- 	end,
	-- },
}
