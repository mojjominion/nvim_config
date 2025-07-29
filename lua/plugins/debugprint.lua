return {
  "andrewferrier/debugprint.nvim",
  lazy = false,
  -- Dependency only needed for NeoVim 0.8
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = { ... },
  config = function(...)
    -- local javascript = {
    --   left = 'console.warn("',
    --   right = '")',
    --   mid_var = '", ',
    --   right_var = ")",
    -- }
    -- require("debugprint").setup { filetypes = { javascript } }
    local erlang = {
      left = 'io:format("',
      -- left_var = 'print "', -- `left_var` is optional, for 'variable' lines only; `left` will be used if it's not present
      right = '"),',
      mid_var = '", ',
      right_var = "),",
    }
    require("debugprint").setup { filetypes = { ["erlang"] = erlang, ... } }
  end,
  -- Remove the following line to use development versions,
  -- not just the formal releases
  version = "*",
  -- version = "v1.8.0",
}
