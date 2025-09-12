return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    config = {
      elp = {
        cmd = { "elp", "server" },
        filetypes = { "erlang" },
        root_markers = { "rebar.config", "erlang.mk", "mix.exs", "mix.lock", ".git" },
      },
    },
  },
}
