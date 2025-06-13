local lspconfig = require("lspconfig")

-- Extend LSP capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python
lspconfig.pyright.setup({
  capabilities = capabilities,
})

-- Bash
lspconfig.bashls.setup({
  capabilities = capabilities,
})

-- C/C++
lspconfig.clangd.setup({
  capabilities = capabilities,
})

-- HTML
lspconfig.html.setup({})

-- CSS
lspconfig.cssls.setup({})

-- JavaScript / TypeScript (Node, React)
lspconfig.ts_ls.setup({
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- Format on write
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.h", "*.cpp", "*.py", "*.sh" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
