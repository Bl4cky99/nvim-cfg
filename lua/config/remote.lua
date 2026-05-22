require("remote-sshfs").setup({
  connections = {
    ssh_configs = {
      vim.fn.expand("$HOME/.ssh/config"),
    },
  },
  mounts = {
    base_dir = vim.fn.expand("$HOME/.sshfs/"),
    unmount_on_exit = true,
  },
  handlers = {
    on_connect = {
      change_dir = true,
    },
  },
  ui = {
    select_prompts = false,
    confirm = {
      connect = true,
      change_dir = false,
    },
  },
})

map("n", "<leader>rc", "<cmd>RemoteSSHFSConnect<cr>",    { desc = "connect" })
map("n", "<leader>rd", "<cmd>RemoteSSHFSDisconnect<cr>", { desc = "disconnect" })
map("n", "<leader>re", "<cmd>RemoteSSHFSEdit<cr>",       { desc = "edit config" })
map("n", "<leader>rf", "<cmd>RemoteSSHFSFindFiles<cr>",  { desc = "find files" })
map("n", "<leader>rg", "<cmd>RemoteSSHFSLiveGrep<cr>",   { desc = "live grep" })
