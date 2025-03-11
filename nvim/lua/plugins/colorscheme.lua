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

	-- {
	-- 	"sainnhe/everforest",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- Optionally configure and load the colorscheme
	-- 		-- directly inside the plugin declaration.
	-- 		-- vim.opt.background = "light"
	-- 		vim.g.everforest_background = "soft"
	-- 		vim.g.everforest_enable_italic = true
	-- 		vim.cmd.colorscheme("everforest")
	-- 	end,
	-- },
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	name = "github-theme",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			-- ...
	-- 		})
	--
	-- 		vim.cmd("colorscheme github_dark_dimmed")
	-- 	end,
	-- },
	-- {
	-- 	"comfysage/evergarden",
	-- 	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	-- 	opts = {
	-- 		theme = {
	-- 			variant = "winter", -- 'winter'|'fall'|'spring'
	-- 			accent = "green",
	-- 		},
	-- 		editor = {
	-- 			transparent_background = false,
	-- 			sign = { color = "none" },
	-- 			float = {
	-- 				color = "mantle",
	-- 				invert_border = false,
	-- 			},
	-- 			completion = {
	-- 				color = "surface0",
	-- 			},
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
	-- {
	--
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	config = function()
	-- 		require("monokai-pro").setup({
	-- 			filter = "machine",
	-- 		})
	-- 	end,
	-- },

	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.sonokai_enable_italic = true
			vim.cmd.colorscheme("sonokai")
		end,
	},
	-- {
	-- 	"skylarmb/torchlight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		contrast = "medium", -- possible values: soft, medium, hard
	-- 	},
	-- },
}
