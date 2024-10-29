vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>w", ":w<CR>") -- save
keymap.set("n", "<leader>q", ":q<CR>") -- quit

keymap.set("n", "<leader>/", ":nohlsearch<CR>") -- turn off current search

-- Buffers
keymap.set("n", "<Left>", ":bp<CR>") -- prev buffer
keymap.set("n", "<Right>", ":bn<CR>") -- next buffer

-- Using system clipboard
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+yg_') -- from cursor to end of sentence

keymap.set("n", "<leader>p", '"+p')
keymap.set("n", "<leader>P", '"+P')

-- Delete to blackhole register
keymap.set("n", "X", '"_d')
keymap.set("n", "XX", '"_dd')

-- Javascript-specific
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "typescript", "javascriptreact", "typescriptreact", "html"},
  callback = function()
    keymap.set('n', '<leader>cl', 'iconsole.log()<Esc>i', {buffer = true})
    keymap.set('i', 'clog', 'console.log()<Esc>i', {buffer = true})
  end
})
