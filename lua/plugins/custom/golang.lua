-- go lang
return {
  -- go lang
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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              -- Don't force gofumpt globally, let projects decide
              -- gofumpt = true,
              -- Performance optimized settings
              codelenses = {
                gc_details = false,
                generate = false, -- Disabled: expensive for large projects
                regenerate_cgo = false, -- Disabled: rarely needed, expensive
                run_govulncheck = false, -- Disabled: very expensive, run manually
                test = true, -- Keep: useful for development
                tidy = false, -- Disabled: expensive, run manually
                upgrade_dependency = false, -- Disabled: very expensive
                vendor = false, -- Disabled: rarely needed
              },
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
              usePlaceholders = true,
              completeUnimported = false, -- Disabled: very expensive, major cause of slowdown
              staticcheck = false, -- Disabled: extremely expensive, run separately
              directoryFilters = {
                "-.git",
                "-**/.git",
                "-submodules",
                "-submodules/**",
                "-.vscode",
                "-.idea",
                "-.vscode-test",
                "-node_modules",
                "-vendor",
                "-testdata",
                "-.build",
                "-build",
                "-dist",
                "-tmp",
                "-temp",
                "-target",
                "-out",
              },
              semanticTokens = false, -- Disabled: expensive, handled by treesitter

              -- Additional performance settings
              experimentalPostfixCompletions = false, -- Disable experimental features
              experimentalWorkspaceModule = false, -- Disable experimental workspace features
              memoryMode = "DegradeClosed", -- Reduce memory usage for closed files
              expandWorkspaceToModule = false, -- Don't expand workspace to entire module
              buildFlags = { "-tags", "" }, -- Reduce build complexity

              -- Aggressive performance settings for large projects (889MB, 1675 files)
              deepCompletion = false,                -- Disable deep completion analysis
              fuzzyMatching = false,                 -- Disable fuzzy matching in completions
              caseSensitiveCompletion = true,        -- Faster exact matching
              importShortcut = "Definition",         -- Faster import handling
              symbolMatcher = "FastFuzzy",          -- Use faster symbol matching
              symbolStyle = "Dynamic",              -- Dynamic symbol loading
              allowModfileModifications = false,     -- Don't modify go.mod automatically
              allowImplicitNetworkAccess = false,    -- Prevent network calls

              env = {
                GOPROXY = "direct", -- Skip proxy for faster module resolution
                GOSUMDB = "off",     -- Skip checksum verification for speed
                GOCACHE = vim.fn.expand("~/.cache/go-build"), -- Use local cache
              },
            },
          },
        },
      },
      setup = {
        gopls = function(_, opts)
          -- Check for project-specific formatting preferences
          local function detect_project_formatting()
            local cwd = vim.fn.getcwd()

            -- Check if project has .golangci.yml
            if vim.fn.filereadable(cwd .. "/.golangci.yml") == 1 then
              -- Read golangci config to see if it specifies formatters
              local golangci_content = vim.fn.readfile(cwd .. "/.golangci.yml")
              local content_str = table.concat(golangci_content, "\n")

              -- If golangci.yml doesn't explicitly configure gofumpt, don't use it
              if not string.match(content_str, "gofumpt") then
                return false -- Use standard gofmt
              end
            end

            -- Check for explicit gofumpt config files
            local gofumpt_files = {
              "/.gofumpt.toml",
              "/.gofumpt.yaml",
              "/.gofumpt.yml",
            }

            for _, file in ipairs(gofumpt_files) do
              if vim.fn.filereadable(cwd .. file) == 1 then
                return true -- Use gofumpt
              end
            end

            -- Default to no gofumpt unless explicitly configured
            return false
          end

          -- Apply project-specific gofumpt setting
          local use_gofumpt = detect_project_formatting()
          opts.settings = opts.settings or {}
          opts.settings.gopls = opts.settings.gopls or {}
          opts.settings.gopls.gofumpt = use_gofumpt

          -- workaround for gopls not supporting semanticTokensProvider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "gopls" then
              if not client.server_capabilities.semanticTokensProvider then
                local semantic = client.config.capabilities.textDocument.semanticTokens
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end
          end)
          -- end workaround
        end,
      },
    },
  },
}
