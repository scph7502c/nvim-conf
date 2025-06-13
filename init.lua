vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false

vim.g.mapleader = " "
vim.opt.mouse = ""

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup(require("plugins"))
require("lsp")
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("cmp")
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("dap_setup")
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("dap_setup")
  end,
})
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash", "c", "cpp", "python",
    "html", "css", "javascript", "typescript", "tsx"
  },
  highlight = { enable = true },
  autotag = { enable = true },
})



