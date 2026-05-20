-- Minimal Go config for very large repos - disable most gopls features
return {
  -- Keep DAP debugging
  {
    "leoluz/nvim-dap-go",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = {
      {
        "<leader>dt",
        function() require("dap-go").debug_test() end,
        desc = "Debug test",
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false, -- Disabled: can be noisy and expensive
                compositeLiteralFields = true, -- Keep: useful and relatively cheap
                compositeLiteralTypes = false, -- Disabled: can be expensive
                constantValues = false, -- Disabled: expensive for large codebases
                functionTypeParameters = true, -- Keep: useful for generics
                parameterNames = true, -- Keep: improves readability
                rangeVariableTypes = false, -- Disabled: can be expensive
              },
              analyses = {
                fieldalignment = false, -- Disabled: very expensive
                nilness = false, -- Disabled: expensive
                unusedparams = true, -- Keep: important for code quality
                unusedwrite = true, -- Keep: important for code quality
                useany = true, -- Keep: relatively cheap
              },
              -- Minimal feature set for speed
              codelenses = false, -- Disable all code lenses
              semanticTokens = false, -- Use treesitter only

              -- Basic completion only
              completeUnimported = false,
              deepCompletion = false,
              fuzzyMatching = false,
              usePlaceholders = false,

              -- Minimal diagnostics
              staticcheck = false,

              -- Aggressive memory and performance limits
              memoryMode = "DegradeClosed",
              expandWorkspaceToModule = false,
              allowModfileModifications = false,
              allowImplicitNetworkAccess = false,
              experimentalPostfixCompletions = false,
              experimentalWorkspaceModule = false,

              -- Very restrictive completion budget
              completionBudget = "200ms",

              -- Disable file watching for performance
              watchFileChanges = false,

              -- Exclude everything possible
              directoryFilters = {
                "-.git",
                "-**/.git",
                "-vendor",
                "-testdata",
                "-**/*_test.go",
                "-**/test/**",
                "-**/tests/**",
                "-**/*.pb.go",
                "-**/*_gen.go",
                "-**/generated/**",
                "-**/third_party/**",
                "-**/external/**",
                "-**/mocks/**",
                "-node_modules",
                "-**/.cache",
                "-**/cache/**",
                "-.build",
                "-build",
                "-dist",
                "-tmp",
                "-temp",
                "-**/proto/**",
                "-**/.terraform/**",
              },

              env = {
                GOMEMLIMIT = "128MiB", -- Very low limit
                GOMAXPROCS = "1", -- Single thread
                GOGC = "400", -- Very infrequent GC
                GOPROXY = "direct",
                GOSUMDB = "off",
                GOCACHE = vim.fn.expand "~/.cache/go-build",
              },
            },
          },
        },
      },
      setup = {
        gopls = function(_, opts)
          -- Simple gofumpt detection (keep this minimal)
          local cwd = vim.fn.getcwd()
          local use_gofumpt = vim.fn.filereadable(cwd .. "/.gofumpt.toml") == 1
            or vim.fn.filereadable(cwd .. "/.gofumpt.yaml") == 1
            or vim.fn.filereadable(cwd .. "/.gofumpt.yml") == 1

          opts.settings = opts.settings or {}
          opts.settings.gopls = opts.settings.gopls or {}
          opts.settings.gopls.gofumpt = use_gofumpt
        end,
      },
    },
  },
}
