return {
  "dmmulroy/tsc.nvim",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "typescript", "typescriptreact" },
  config = function()
    require("tsc").setup {
      bin_path = "node_modules/typescript/bin/tsc",
      auto_start_watch_mode = false,
      auto_close_qflist = true,
      use_diagnostics = true,
    }
  end,
}
