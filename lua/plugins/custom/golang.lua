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
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
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
