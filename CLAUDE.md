# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **professional-grade Neovim configuration** built on AstroNvim v6+. It's a heavily customized IDE-like setup for multi-language development with emphasis on Go, TypeScript, Python, and Erlang/Elixir.

**Important**: This is a Neovim configuration repository, not a build project. Changes should focus on Lua configuration files and plugin settings.

## Architecture

### Core Structure
```
lua/
├── community.lua           # AstroCommunity pack imports (e.g., Lua pack)
├── lazy_setup.lua          # Plugin manager setup and AstroNvim v6 configuration
├── polish.lua              # Final customizations and autocommands
├── plugins/                # Standard plugin specifications
│   ├── astrocore.lua      # Core settings (mappings, options)
│   ├── astrolsp.lua       # Language server configuration
│   ├── astroui.lua        # UI customization
│   ├── mason.lua          # Tool installer config
│   ├── none-ls.lua        # Linting and formatting
│   ├── treesitter.lua     # Syntax highlighting
│   └── user.lua           # User plugin overrides
└── plugins/custom/         # 24 heavily customized plugin configs (1,037 lines)
```

### Key Components

- **Plugin Management**: Lazy.nvim with locked versions in `lazy-lock.json`
- **Language Servers**: Configured via Mason with auto-installation
- **Formatting**: StyLua for Lua (120 cols, 2 spaces), language-specific formatters
- **Completion**: Advanced Blink.cmp with emoji, LSP, and snippet support
- **Theme**: Catppuccin as default with custom UI tweaks

### Custom Plugin Directory (`lua/plugins/custom/`)

This contains the core personalizations:
- **golang.lua**: Comprehensive Go setup with gopls, DAP debugging, semantic tokens, project-aware gofumpt detection
- **typescript.lua**: TypeScript/JavaScript with vtsls LSP and mason-tool-installer
- **blink-completion.lua**: Advanced completion menu configuration
- **snacks-pack.lua**: Major utility plugin (8,208 lines)
- **astro-*.lua**: AstroNvim framework customizations
- Language-specific configs for Elixir, Erlang, SQL

## Common Development Commands

### Plugin Management
```bash
# Launch Neovim (auto-installs/updates plugins on first run)
nvim

# Within Neovim:
:Lazy                      # Open plugin manager
:Lazy update              # Update plugins
:Lazy sync                # Sync plugins with lock file
:Mason                    # Manage language servers/tools
```

### Language Server Management
```bash
# Within Neovim:
:LspInfo                  # Show LSP status
:LspRestart              # Restart language servers
:Mason                   # Install/manage language servers and formatters
```

### Formatting
```bash
# External (uses .stylua.toml config):
stylua lua/              # Format Lua files (120 cols, 2 spaces)

# Within Neovim (configured per language):
<leader>lf               # Format current buffer (astrocore.lua:36)
```

### Git Integration
```bash
# Within Neovim:
<leader>gl              # Generate GitHub permalink (custom/githublink.lua)
```

## Language Support

### Configured Languages (with LSPs)
- **Go**: gopls with advanced hints, code lenses, DAP debugging, project-aware formatting
- **TypeScript/JavaScript**: vtsls, eslint, TSC integration
- **Python**: basedpyright, debugpy, formatting on save
- **Lua**: lua-language-server, stylua formatting
- **Erlang**: elp language server
- **Elixir**: elixir-tools support
- **SQL**: sqlls with Dadbod integration
- **Rust**: rust-analyzer
- **Bash**: bash-language-server

### Auto-installed Tools (mason.lua)
Language servers, formatters, and debuggers are auto-installed via Mason:
```lua
"lua-language-server", "stylua", "goimports-reviser", "gofumpt",
"basedpyright", "gopls", "rust-analyzer", "prettierd", "delve"
```

## Configuration Guidelines

### File Modifications
- **Standard plugin configs**: Edit files in `lua/plugins/`
- **Heavy customizations**: Add to `lua/plugins/custom/`
- **Final tweaks**: Use `lua/polish.lua` for autocommands and late setup

### Code Style
- **Lua**: Follow .stylua.toml (120 columns, 2 spaces, Unix line endings)
- **File organization**: Group related functionality in custom/ subdirectory
- **Lazy loading**: Use appropriate keys, events, and dependencies in plugin specs

### Language-Specific Notes

#### Go Development
- Automatic gofumpt detection based on project configuration
- Checks for `.golangci.yml` and gofumpt config files
- Full DAP debugging support with `<leader>dt` for test debugging
- Semantic tokens workaround for gopls (golang/go#54531)

#### TypeScript/JavaScript
- Uses vtsls LSP (faster than tsserver)
- Integrated with mason-tool-installer for consistent environments

### Plugin Architecture
This config follows AstroNvim v6+ patterns:
- **Lazy specs**: Each plugin file returns LazySpec table
- **Import system**: Uses `{ import = "path" }` for organization
- **Community packs**: Leverages AstroCommunity for common setups
- **Overrides**: Uses opts functions for deep customization

## Key Files for Common Tasks

- **Add new language support**: `lua/plugins/custom/mason.lua` + create language-specific config
- **Modify key mappings**: `lua/plugins/astrocore.lua` or custom plugin file
- **Change UI/theme**: `lua/plugins/astroui.lua` and `lua/plugins/custom/theme.lua`
- **LSP configuration**: `lua/plugins/astrolsp.lua` + language-specific custom files
- **Add community packs**: `lua/community.lua`

## Installation & Updates

New installations follow the AstroNvim template process:
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone https://github.com/mojjominion/nvim_config ~/.config/nvim

# Start Neovim (auto-installs everything)
nvim
```

Updates are managed via:
- **Plugin versions**: `lazy-lock.json` (committed for reproducibility)
- **Configuration**: Git commits with semantic commit messages (`fix(scope): description`)