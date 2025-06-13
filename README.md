i# nvim-conf

# Neovim Configuration

This Neovim setup provides a modern development environment optimized for C, Python, Bash and React projects, Git integration, code navigation, and enhanced UX.

## ✨ Features

- **LSP Support** via `nvim-lspconfig` and `none-ls.nvim`
  - ESLint and Prettier configured for diagnostics and formatting
- **Autocomplete** with `nvim-cmp`, snippet support via `LuaSnip`
- **Syntax Highlighting** powered by `nvim-treesitter`
- **Auto-close Pairs** with `nvim-autopairs`
- **Auto-tagging** in HTML/JSX with `nvim-ts-autotag`
- **Git Integration** via `gitsigns.nvim`
- **Easy Commenting** using `Comment.nvim`
- **Surround editing** (`ys`, `ds`, `cs`) via `nvim-surround`
- **File/project navigation** using `telescope.nvim` + `project.nvim`
- **Dark Theme**: Catppuccin (mocha variant)

## 📁 Project Navigation

- Projects auto-detected by `project.nvim`
- Use `<leader>fp` to open the project list

## 🔎 Telescope Key Mappings

| Shortcut     | Action       |
| ------------ | ------------ |
| `<leader>ff` | Find files   |
| `<leader>fg` | Live grep    |
| `<leader>fb` | List buffers |
| `<leader>fh` | Help tags    |
| `<leader>fp` | Project list |

## 🔧 Git Shortcuts (`gitsigns.nvim`)

| Shortcut     | Action         |
| ------------ | -------------- |
| `]c` / `[c`  | Next/prev hunk |
| `<leader>hs` | Stage hunk     |
| `<leader>hr` | Reset hunk     |
| `<leader>hp` | Preview hunk   |
| `<leader>hS` | Stage buffer   |

## 💬 Commenting

- `gcc` — comment current line
- `gc` — comment visual selection

## 🔁 Surround Editing

| Command            | Description                         |
| ------------------ | ----------------------------------- |
| `ys<motion><char>` | Surround motion with character      |
| `yss<char>`        | Surround line                       |
| `cs<char1><char2>` | Change surround from char1 to char2 |
| `ds<char>`         | Delete surrounding character        |

Install prerequisites

Make sure the following tools are installed:

### 1. Install Prerequisites

Make sure you have:

- Neovim ≥ 0.9
- Node.js via [NVM](https://github.com/nvm-sh/nvm)
- Python ≥ 3.10 with `pip`
- C/C++ toolchain with `clangd` and `gdb`

```bash
# Node.js (for frontend tooling and LSPs)
nvm install --lts
nvm use --lts
npm install -g prettier eslint_d

# Python (for LSP, DAP)
sudo apt install python3-pip
pip install --user pynvim debugpy

# C/C++ support
sudo apt install clangd gdb

# (Optional) Formatters
sudo apt install black isort clang-format

```

