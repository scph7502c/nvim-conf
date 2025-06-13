local null_ls = require("null-ls")

local eslint_d_path = vim.fn.trim(vim.fn.system("which eslint_d"))

local eslint_d = {
    name = "eslint_d",
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    generator = null_ls.generator({
        command = eslint_d_path,
        args = { "--stdin", "--stdin-filename", "$FILENAME", "--format", "json" },
        to_stdin = true,
        from_stderr = false,
        format = "json",
        check_exit_code = function(code)
            return code <= 1
        end,
        on_output = function(params)
            local diagnostics = {}
            for _, result in ipairs(params.output[1].messages or {}) do
                table.insert(diagnostics, {
                    row = result.line,
                    col = result.column,
                    end_row = result.endLine,
                    end_col = result.endColumn,
                    source = "eslint_d",
                    message = result.message,
                    severity = result.severity == 2 and 1 or 2, -- 1: error, 2: warning
                })
            end
            return diagnostics
        end,
    }),
}

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        eslint_d,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
