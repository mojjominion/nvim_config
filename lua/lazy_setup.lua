require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^4",         -- Remove version tracking to elect for nighly AstroNvim
    import = "astronvim.plugins",
    opts = {                -- AstroNvim options must be set here with the `import` key
      mapleader = " ",      -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil,    -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override

      --  v3 - config
      autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,              -- enable completion at start
      autopairs_enabled = true,        -- enable autopairs at start
      diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },

  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  --
  install = { colorscheme = { "catppuccin" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
