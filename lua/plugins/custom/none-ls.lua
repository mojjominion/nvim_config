-- Customize None-ls sources
---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      -- null_ls.builtins.diagnostics.prettierd,
      null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.completion.spell,
      null_ls.builtins.completion.vsnip,
      null_ls.builtins.completion.nvim_snippets,
      -- null_ls.builtins.formatting.beautysh,
      null_ls.builtins.formatting.shfmt,
      -- null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.code_actions.gomodifytags,
      null_ls.builtins.code_actions.impl,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.sqlfluff.with {
        extra_args = { "--dialect", "postgres" }, -- change to your dialect
      },
    })
  end,
}
