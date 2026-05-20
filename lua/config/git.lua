require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	},

	current_line_blame = true,
	current_line_blame_opts = {
		delay = 500,
		virt_text_pos = "eol",
	},
	current_line_blame_formatter = "  <author>, <author_time:%R> · <summary>",

	on_attach = function(bufnr)
		local gs = require("gitsigns")

		map("n", "]h", function()
			gs.nav_hunk("next")
		end, "git: next hunk")
		map("n", "[h", function()
			gs.nav_hunk("prev")
		end, "git: previous hunk")

		map("n", "<leader>hs", gs.stage_hunk, "git: stage hunk")
		map("n", "<leader>hr", gs.reset_hunk, "git: reset hunk")
		map("n", "<leader>hS", gs.stage_buffer, "git: stage whole buffer")
		map("n", "<leader>hR", gs.reset_buffer, "git: reset whole buffer")
		map("n", "<leader>hp", gs.preview_hunk, "git: preview hunk")
		map("n", "<leader>hd", gs.diffthis, "git: diff current file")
		map("n", "<leader>hb", gs.blame_line, "git: blame line (floating)")
	end,
})

local neogit = require("neogit")

neogit.setup({
	integrations = {
		diffview = true,
		fzf_lua = true,
	},

	kind = "tab",

	commit_editor = {
		kind = "tab",
		show_staged_diff = true,
	},

	status = {
		show_head_commit_hash = true,
		recent_commit_count = 10,
	},

	sections = {
		untracked = { folded = false, hidden = false },
		unstaged = { folded = false, hidden = false },
		staged = { folded = false, hidden = false },
		stashes = { folded = true, hidden = false },
		unpulled_upstream = { folded = true, hidden = false },
		unmerged_upstream = { folded = false, hidden = false },
		recent = { folded = true, hidden = false },
		rebase = { folded = true, hidden = false },
	},
})

map("n", "<leader>gg", neogit.open, "neogit status")
map("n", "<leader>gc", function()
	neogit.open({ "commit" })
end, "neogit commit")
map("n", "<leader>gp", function()
	neogit.open({ "push" })
end, "neogit push")
map("n", "<leader>gP", function()
	neogit.open({ "pull" })
end, "neogit pull")
map("n", "<leader>gl", function()
	neogit.open({ "log" })
end, "neogit log")
map("n", "<leader>gb", function()
	neogit.open({ "branch" })
end, "neogit branches")
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", "open diffview")
map("n", "<leader>gD", "<cmd>DiffviewClose<cr>", "close diffview")
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", "file history")
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", "repo history")
