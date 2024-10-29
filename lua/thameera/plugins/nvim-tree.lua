-- Nvim-tree
-- g? to see help
-- <Leader>e to toggle
-- <Enter> to open file
-- <C-x> or <C-v> to open file in horizontal or vertical split
-- <Tab> to open preview
-- a to create
-- c to copy, p to paste, d to delete, and r to rename
-- R to refresh
-- P to go to parent
-- When opening with Enter and if you have split windows, use chars a, b, c,... to pick the right split when prompted
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end
}
