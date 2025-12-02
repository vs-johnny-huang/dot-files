# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository managed with GNU Stow, containing configuration files for zsh, neovim (NvChad), tmux, and alacritty. The repository follows the XDG Base Directory specification where applicable.

## Repository Structure

- `home/` - Contains dotfiles that go directly in `$HOME` (e.g., `.zshrc`)
- `nvim/.config/nvim/` - Neovim configuration using NvChad v2.5 as the base
- `tmux/.config/tmux/` - Tmux configuration with custom theme and plugin setup
- `alacritty/.config/alacritty/` - Alacritty terminal emulator configuration
- `keyboard/` - Keyboard-related configurations (excluded from stow operations)

## Applying Configuration Changes

Use GNU Stow to symlink configurations from this repository to their target locations:

```bash
# Apply all configurations (except keyboard)
stow --ignore keyboard */

# Apply specific configurations
stow nvim
stow tmux
stow alacritty
stow home
```

All stow commands assume you're in `~/.files` and symlinking to `$HOME`.

## Neovim Configuration Architecture

The Neovim setup uses NvChad v2.5 as a base configuration plugin:

- **Base plugin**: NvChad is imported as a lazy.nvim plugin, not directly modified
- **Entry point**: `init.lua` bootstraps lazy.nvim and imports NvChad + custom configs
- **Custom configurations**:
  - `lua/chadrc.lua` - NvChad overrides and customization
  - `lua/configs/` - LSP, formatter, and tool configurations
  - `lua/plugins/` - Additional plugin definitions (imported via lazy.nvim)
  - `lua/mappings.lua` - Custom keybindings (leader key is `,`)
  - `lua/options.lua` - Vim option overrides

When modifying Neovim configuration, edit files in `lua/` directory, not the NvChad plugin itself.

## Tmux Configuration

Key characteristics:

- Custom Catppuccin-inspired theme with status bar at top
- Plugin manager: TPM (automatically installed on first run)
- Key bindings use vim-style navigation (`h/j/k/l` for pane selection, `H/J/K/L` for resizing)
- Panes use current path for splits and new windows
- Session restore via tmux-resurrect/tmux-continuum (auto-restore enabled)

## Shell Configuration (zsh)

Notable setup in `.zshrc`:

- **Framework**: oh-my-zsh with robbyrussell theme
- **Auto-correction**: Enabled but can be disabled with `unsetopt correct_all`
- **Node version management**: nvm with automatic `.nvmrc` detection on directory change
- **Navigation**: zoxide replaces `cd`, fzf integration for fuzzy finding
- **CLI aliases**:
  - `vim` → `nvim`
  - `ls` → `eza`
  - `cat` → `bat`
  - `cd` → `z` (zoxide)
- **Search**: ag (the_silver_searcher) as default for fzf

## Required Dependencies

Install via Homebrew:
```bash
brew install stow tmux neovim fzf gnu-sed the_silver_searcher terraform-lsp go terraform zoxide eza bat
brew install --cask alacritty raycast orbstack font-jetbrains-mono-nerd-font
```

Additional requirements:
- oh-my-zsh with zsh-autosuggestions plugin
- nvm for Node.js version management
- pnpm (path configured in `.zshrc`)

## Claude Code Integration

Claude Code CLI is configured to use `$HOME/.local/bin`. GCP Vertex AI configuration is available but commented out in `.zshrc` (lines 181-184).
