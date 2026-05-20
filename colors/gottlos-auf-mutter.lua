vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "gottlos-auf-mutter"

local c = {
	bg = "#1A1218",
	bg_alt = "#241A20",
	bg_sel = "#3A2530",
	fg = "#cccccc",
	fg_dim = "#7f8c8d",
	fg_bright = "#fcfcfc",

	pink = "#D4879C",
	red = "#ed1515",
	green = "#11d116",
	yellow = "#f67400",
	yellow_lt = "#e0b060",
	blue = "#1d99f3",
	magenta = "#9b59b6",
	cyan = "#1abc9c",

	black = "#0A0A0A",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg_alt })
hi("FloatBorder", { fg = c.pink, bg = c.bg_alt })
hi("CursorLine", { bg = c.bg_alt })
hi("CursorLineNr", { fg = c.pink, bold = true })
hi("LineNr", { fg = c.fg_dim })
hi("SignColumn", { bg = c.bg })
hi("VertSplit", { fg = c.bg_alt })
hi("WinSeparator", { fg = c.bg_alt })
hi("StatusLine", { fg = c.fg, bg = c.bg_alt })
hi("StatusLineNC", { fg = c.fg_dim, bg = c.bg_alt })
hi("Visual", { bg = c.bg_sel })
hi("Search", { fg = c.black, bg = c.yellow_lt })
hi("CurSearch", { fg = c.black, bg = c.pink })
hi("IncSearch", { fg = c.black, bg = c.pink })
hi("MatchParen", { fg = c.pink, bold = true, underline = true })
hi("Pmenu", { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel", { fg = c.black, bg = c.pink })
hi("PmenuSbar", { bg = c.bg_alt })
hi("PmenuThumb", { bg = c.fg_dim })

hi("Comment", { fg = c.fg_dim, italic = true })
hi("Constant", { fg = c.cyan })
hi("String", { fg = c.green })
hi("Character", { fg = c.green })
hi("Number", { fg = c.yellow })
hi("Boolean", { fg = c.yellow })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.blue })
hi("Statement", { fg = c.pink })
hi("Keyword", { fg = c.pink })
hi("Operator", { fg = c.fg })
hi("Type", { fg = c.magenta })
hi("Special", { fg = c.cyan })
hi("PreProc", { fg = c.magenta })

hi("@variable", { fg = c.fg })
hi("@variable.member", { fg = c.cyan })
hi("@property", { fg = c.cyan })
hi("@function", { fg = c.blue })
hi("@function.call", { fg = c.blue })
hi("@function.method", { fg = c.blue })
hi("@constructor", { fg = c.magenta })
hi("@keyword", { fg = c.pink })
hi("@keyword.return", { fg = c.pink, italic = true })
hi("@keyword.import", { fg = c.pink, italic = true })
hi("@string", { fg = c.green })
hi("@string.escape", { fg = c.cyan })
hi("@number", { fg = c.yellow })
hi("@boolean", { fg = c.yellow })
hi("@type", { fg = c.magenta })
hi("@type.builtin", { fg = c.magenta, italic = true })
hi("@comment", { fg = c.fg_dim, italic = true })
hi("@punctuation.bracket", { fg = c.fg_dim })
hi("@operator", { fg = c.fg })
hi("@tag", { fg = c.pink })
hi("@tag.attribute", { fg = c.cyan })

hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.cyan })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })

hi("DiffAdd", { fg = c.green })
hi("DiffChange", { fg = c.yellow })
hi("DiffDelete", { fg = c.red })
