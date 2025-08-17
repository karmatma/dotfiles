return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local fzf = require("fzf-lua")

			-- Global setup with preview configurations
			fzf.setup({
				lsp = {
					-- Customize the LSP result format
					fzf_opts = {
						-- Show line numbers and file paths
						["--delimiter"] = "[:]",
						["--with-nth"] = "1..",
					},
				},
				keymap = {
					builtin = {
						["<C-c>"] = "close",
						["<C-d>"] = "preview-page-down",
						["<C-u>"] = "preview-page-up",
						-- ["<C-f>"] = "preview-page-down",
						-- ["<C-b>"] = "preview-page-up",
					},
					-- Enable preview scrolling with J/K
					fzf = {
						["ctrl-j"] = "preview-down",
						["ctrl-k"] = "preview-up",
					},
				},
				file_ignore_patterns = {
					"node_modules/",
					"dist/",
					".next/",
					".git/",
					".gitlab/",
					"build/",
					"target/",
					"package-lock.json",
					"pnpm-lock.yaml",
					"yarn.lock",
					"app/bin/",
				},
			})
		end,
	},
}
