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
    style = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "frappe",
    },
    -- transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    custom_highlights = {},
    color_overrides = {
      all = {
        text = "#ffffff",
      },
      mocha = {
        base = "#1e1e2e",
      },
      frappe = {},
      macchiato = {},
      latte = {},
    },
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
