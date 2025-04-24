return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "typescript-language-server" }, -- automatically install lsp
    },
  },
  { "jose-elias-alvarez/typescript.nvim", lazy = true }, -- add lsp plugin
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      setup_handlers = {
        -- add custom handler
        tsserver = function(_, opts) require("typescript").setup { server = opts } end,
      },
      ---@diagnostic disable: missing-fields
      config = {
        ["vtsls"] = {
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
          settings = {
            tsserver_max_memory = 8092,
            separate_diagnostic_server = true,
          },
        },
      },
    },
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- }
}
