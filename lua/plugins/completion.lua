return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
  },                     -- override the options table that is used in the `require("cmp").setup()` call
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      { name = "nvim_lsp", priority = 1000 },
      { name = "buffer",   priority = 500 },
      { name = "luasnip",  priority = 750 },
      { name = "path",     priority = 250 },
      { name = "calc",     priority = 200 },
      { name = "vsnip" },
      { name = "emoji",    priority = 700 }, -- add new source
    }))
    opts.preselect = "item"
    opts.completion = {
      completeopt = "menu,menuone,noinsert",
    }
    opts.snippet = {
      expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
    }
    opts.window.documentation = {
      border = "rounded",
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 50,
      min_width = 50,
      max_height = math.floor(vim.o.lines * 0.4),
      min_height = 3,
    }
  end,
}
