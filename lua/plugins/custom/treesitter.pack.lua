-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      "rust",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "javascript",
      "typescript",
      "graphql",
      "yaml",
      "toml",
      "bash",
      -- "python",
      -- add more arguments for adding more treesitter parsers
      "diff",
      "html",
      "json",
      "json5",
      "jsonc",
      "jsonc",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "vim",
      "vimdoc",
      "xml",
      "erlang",
      "ron",
      "rust",
      "toml",
    })
  end,
}
