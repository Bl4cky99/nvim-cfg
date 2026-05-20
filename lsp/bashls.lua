return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh", "zsh" },
  root_markers = { ".git" },
  settings = {
    bashIde = {
      shellcheckPath = "shellcheck",
      globPattern = "*@(.sh|.inc|.bash|.command|.zsh)",
    },
  },
}
