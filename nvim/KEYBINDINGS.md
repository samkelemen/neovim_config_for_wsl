# Keyboard Shortcuts

Leader key is `<Space>`. Modes: **n** normal, **i** insert, **v** visual, **t** terminal.

## General (`lua/config/keymaps.lua`)
| Key | Mode | Action |
|---|---|---|
| `jj` | i, t | Return to normal mode |
| `<leader>E` | n | Open netrw (`:Ex`) |
| `<leader>e` | n | Toggle floating Neo-tree (reveals current file) |
| `<leader>a` | n | Select all |
| `<leader>v` | n | Toggle vertical terminal on the right |
| `<` / `>` | v | Indent and keep selection |
| `H` / `L` | n | Previous / next buffer |
| `<leader>x` | n | Close buffer |
| `<C-h/j/k/l>` | n, t | Move between panes (tmux-aware) |

## AI (CodeCompanion)
| Key | Mode | Action |
|---|---|---|
| `<C-a>` | n, v | Open chat |
| `<leader>cai` | n, v | Toggle chat buffer |
| `<LocalLeader>cai` | v | Add selection to chat |

## Telescope
| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |

## LSP
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `[d` / `]d` | Previous / next diagnostic |

## Completion (blink.cmp)
| Key | Action |
|---|---|
| `<Tab>` / `<S-Tab>` | Next / previous item |
| `<CR>` | Accept |

## Debugging (nvim-dap)
| Key | Action |
|---|---|
| `<leader>dc` | Start / continue |
| `<leader>db` | Toggle breakpoint |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dt` | Terminate |
| `<leader>du` | Toggle DAP UI |

## REPL (iron.nvim)
| Key | Action |
|---|---|
| `<space>rr` | Toggle REPL |
| `<space>rR` | Restart REPL |
| `<space>rf` | Focus REPL |
| `<space>sf` | Send file |
| `<space>sl` | Send line |
| `<space>sp` | Send paragraph |
| `<space>sb` | Send code block |
| `<space>sn` | Send code block and move |
| `<space>s<space>` | Interrupt |
| `<space>sq` | Exit REPL |
| `<space>cl` | Clear REPL |

## Git – Fugitive (`lua/plugins/fugitive.lua`)
| Key | Action |
|---|---|
| `<leader>gs` | Git status |
| `<leader>gc` | Commit |
| `<leader>gp` | Push |
| `<leader>gP` | Pull |
| `<leader>gb` | Blame |
| `<leader>gd` | Diff split |

In the status window: `s` stage, `u` unstage, `=` toggle inline diff, `cc` commit.

## Git – Gitsigns (`lua/plugins/gitsigns.lua`)
| Key | Mode | Action |
|---|---|---|
| `]c` / `[c` | n | Next / previous hunk |
| `<leader>hs` | n, v | Stage hunk / selected lines |
| `<leader>hr` | n, v | Reset hunk / selected lines |
| `<leader>hS` | n | Stage buffer |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line (full) |
| `<leader>tb` | n | Toggle inline line blame |

## Built-in folding
`za` toggle, `zc` close, `zo` open, `zM` close all, `zR` open all.
