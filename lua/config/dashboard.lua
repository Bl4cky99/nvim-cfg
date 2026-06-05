require("mini.sessions").setup({
	autoread = false,
	autowrite = true,
	directory = vim.fn.stdpath("data") .. "/sessions",
	file = "",
})

local starter = require("mini.starter")

starter.setup({
	evaluate_single = true,

	header = table.concat({
		"",
		"    ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
		"    ████╗  ██║██║   ██║██║████╗ ████║",
		"    ██╔██╗ ██║██║   ██║██║██╔████╔██║",
		"    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
		"    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
		"    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
		"",
		"              Bl4cky99",
		"         github.com/Bl4cky99",
		"",
	}, "\n"),

	footer = function()
		local v = vim.version()
		local version = string.format("v%d.%d.%d", v.major, v.minor, v.patch)

		local ok, plugins = pcall(vim.pack.get)
		local plugin_count = ok and #plugins or 0

		local session_dir = vim.fn.stdpath("data") .. "/sessions"
		local sessions = vim.fn.glob(session_dir .. "/*", false, true)
		local session_count = #sessions

		return table.concat({
			"",
			"─────────────────────────────────────────",
			string.format("  nvim %s  ·  %d plugins  ·  %d sessions", version, plugin_count, session_count),
			"",
		}, "\n")
	end,

	items = {
		starter.sections.sessions(10, true),

		{ name = "Search files", action = "FzfLua files", section = "Actions" },
		{ name = "Live grep", action = "FzfLua live_grep", section = "Actions" },
		{ name = "File-Explorer", action = "Neotree toggle", section = "Actions" },
		{ name = "SSH-Connection", action = "RemoteSSHFSConnect", section = "Actions" },
		{ name = "Save session", action = "SessionSave", section = "Actions" },
		{ name = "Exit", action = "qa", section = "Actions" },
	},

	content_hooks = {
		function(content, _)
			local header_idx = 0
			for _, units in ipairs(content) do
				for _, unit in ipairs(units) do
					if unit.type == "header" then
						header_idx = header_idx + 1
						if header_idx >= 8 then
							unit.hl = "MiniStarterBl4cky"
						end
					end
				end
			end
			return content
		end,
		starter.gen_hook.adding_bullet("· "),
		starter.gen_hook.aligning("center", "center"),
	},
})

vim.api.nvim_create_user_command("SessionSave", function(opts)
	local name = opts.args ~= "" and opts.args or vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

	if name == "" or name == vim.fn.fnamemodify(vim.fn.expand("$HOME"), ":t") then
		vim.notify("please provide a session-name or change into a project-directory", vim.log.levels.WARN)
		return
	end

	require("mini.sessions").write(name)
	vim.notify("session saved: " .. name, vim.log.levels.INFO)
end, {
	nargs = "?",
	desc = "Save current NVIM-session (default: CWD-Name)",
})

vim.api.nvim_create_user_command("SessionDelete", function()
	require("mini.sessions").select("delete")
end, { desc = "Delete session" })

map("n", "<leader>ss", "<cmd>SessionSave<cr>", "session: save (cwd name)")
map("n", "<leader>sl", function()
	require("mini.sessions").select("read")
end, "session: load")
map("n", "<leader>sd", "<cmd>SessionDelete<cr>", "session: delete")
