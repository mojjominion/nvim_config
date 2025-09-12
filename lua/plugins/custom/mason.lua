-- Customize Mason plugins

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        -- install formatters
        "stylua",
        "goimports-reviser",
        "gofumpt",
        "sqlfluff",
        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
        "basedpyright",
        "gopls",
        "bash-language-server",
        "rust-analyzer",
        "sqlls",
        "graphql-language-service-cli",
        "taplo",
        "elp",
        -- "erlang-ls",
        -- "elixir-ls",
        -- "nextls",
        -- add more arguments for adding more language servers
        --
        "prettierd",
        "delve",
      },
    },
  },
}
