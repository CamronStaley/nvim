vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>ya', ':%y"<CR>', { desc = 'Yank entire file to clipboard' })
-- Netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Netrw (Project View)' })

-- Move selected lines up/down in Visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- Cursor movement enhancements
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })

-- Vim With Me (Collab)
vim.keymap.set('n', '<leader>vwm', function()
  require('vim-with-me').StartVimWithMe()
end, { desc = 'Start Vim With Me' })
vim.keymap.set('n', '<leader>svwm', function()
  require('vim-with-me').StopVimWithMe()
end, { desc = 'Stop Vim With Me' })

-- Greatest remap ever: Paste over highlighted text without losing copy buffer
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without losing register' })

-- System Clipboard interaction
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })

-- Deletion without losing copy buffer
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to void register' })

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Map Ctrl-c to Esc' })

-- Misc/Utility
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Ex mode' })
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Open tmux sessionizer' })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format current buffer' })

-- Quickfix and Location List navigation
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next location list item' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Previous location list item' })

-- Search and Replace current word
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })

-- Make current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make file executable' })

-- Go Error Handling Snippet
vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = 'Insert Go error handling' })

-- Config Shortcuts
vim.keymap.set('n', '<leader>vpp', '<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>', { desc = 'Edit Packer config' })
vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = 'Cellular Automaton: Make it rain' })

vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source current file' })
