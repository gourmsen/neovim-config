# Neovim Config

## Plugins (with Lazy)

### File Management

- `telescope`: Fuzzy finder with preview
- `tree`: File explorer

### Language Support

- `treesitter`: Advanced syntax highlighting
- `mason`: Configurations for language servers (+ `lspconfig`)
- `blink`: Completion engine
- `preview`: Function preview window
- `markdown`: Enhanced markdown support
- `conform`: Code formatting
- `trouble`: Diagnostics and references viewer
- `inline-diagnostics`: Shows diagnostics inline

### Version Control

- `gitsigns`: Visual lines for Git changes
- `lazygit`: Loader for `lazygit` within Neovim
- `diffview`: Git diff viewer

### AI Tools

- `copilot`: GitHub Copilot integration
- `sidekick`: Wrapper for AI agents

### Quality of Life

- `autosession`: Manages sessions for the cwd
- `lualine`: Status line with diagnostics
- `whichkey`: Keybinding hints
- `indent`: Indentation guides
- `autopairs`: Matches brackets automatically
- `autotag`: Auto-closes tags with treesitter
- `todo`: Highlights TODO comments

## Themes

- `tokyonight`: Dark, blue-themed colorscheme
- `rose-pine`: Soft, pastel colorscheme

## Requirements

- `lazygit`: Terminal UI for Git
- `gcc / libstdc++`: C / C++ compiler for Treesitter
- `ripgrep`: Fast search tool for Telescope

## Optional

- `delta`: Pager for side-by-side diffs
- `prettier`: Code formatter
- `stylua`: Lua code formatter
