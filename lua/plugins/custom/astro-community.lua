-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.elixir-phoenix" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.nginx" },
  -- { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.vimtext" },
  -- {
  --   "m4xshen/smartcolumn.nvim",
  --   opts = {
  --     colorcolumn = 120,
  --     disabled_filetypes = { "help" },
  --   },
  -- },
}
