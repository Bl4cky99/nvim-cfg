local neotree = require("neo-tree")

neotree.setup({
	close_if_last_window = true,
	enable_git_status = true,
	enable_diagnostics = true,
	popup_border_style = "rounded",

	default_component_configs = {
		indent = {
			with_markers = true,
			with_expanders = true,
		},
		git_status = {
			symbols = {
				added = "+",
				modified = "~",
				deleted = "✖",
				renamed = "➜",
				untracked = "?",
				ignored = "◌",
				unstaged = "U",
				staged = "S",
				conflict = "!",
			},
		},
	},

	window = {
		width = 36,
		mappings = {
			["<space>"] = "none",
			["l"] = "open",
			["h"] = "close_node",
			["H"] = "toggle_hidden",
			["P"] = { "toggle_preview", config = { use_float = true } },
		},
	},

	filesystem = {
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_by_name = { ".git", "node_modules", ".DS_Store" },
		},
	},

	buffers = {
		follow_current_file = { enabled = true },
	},

	sources = { "filesystem", "buffers", "git_status" },

	source_selector = {
		winbar = true,
		sources = {
			{ source = "filesystem", display_name = "  Files " },
			{ source = "buffers", display_name = "  Buffers " },
			{ source = "git_status", display_name = "  Git " },
		},
	},
})

map("n", "<C-n>", "<cmd>Neotree toggle<cr>", "explorer: toggle")
map("n", "<leader>fe", "<cmd>Neotree focus<cr>", "explorer: focus")
map("n", "<leader>fE", "<cmd>Neotree reveal<cr>", "explorer: reveal current file")
map("n", "<leader>fb", "<cmd>Neotree buffers toggle<cr>", "explorer: buffers")
map("n", "<leader>fG", "<cmd>Neotree git_status toggle<cr>", "explorer: git status")

autocmd("DirChanged", {
	desc = "open neo-tree after remote-sshfs connection",
	pattern = "global",
	callback = function()
		local cwd = vim.fn.getcwd()
		local sshfs_base = vim.fn.expand("$HOME/.sshfs/")

		if vim.startswith(cwd, sshfs_base) then
			vim.schedule(function()
				vim.cmd("Neotree show " .. cwd)
			end)
		end
	end,
})
