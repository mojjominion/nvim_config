-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  lazy = false, -- disable lazy loading
  priority = 10000, -- load AstroUI first
  ---@type AstroUIOpts
  -- further customize the options set by the community
  opts = {
    colorscheme = "catppuccin-macchiato",
    style = "macchiato",
    integrations = {
      sandwich = false,
      noice = true,
      mini = true,
      leap = true,
      markdown = true,
      neotest = true,
      cmp = true,
      overseer = true,
      lsp_trouble = true,
      ts_rainbow2 = true,
    },
  },
  -- Icons can be configured throughout the interface
  icons = {
    GitAdd = "",
    -- configure the loading of the lsp in the status line
    LSPLoading1 = "⠋",
    LSPLoading2 = "⠙",
    LSPLoading3 = "⠹",
    LSPLoading4 = "⠸",
    LSPLoading5 = "⠼",
    LSPLoading6 = "⠴",
    LSPLoading7 = "⠦",
    LSPLoading8 = "⠧",
    LSPLoading9 = "⠇",
    LSPLoading10 = "⠏",
  },
  -- A table of only text "icons" used when icons are disabled
  text_icons = {
    GitAdd = "[+]",
  },
}
