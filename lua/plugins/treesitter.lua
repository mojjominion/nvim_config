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
      "jsdoc",
      "json",
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
    })
  end,
}
