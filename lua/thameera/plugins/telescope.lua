-- Telescope
-- <leader>ff, <C-p>: find files
-- <leader>a: live grep
-- <leader>b: list buffers
-- <C-d>: delete buffer
-- <C-q>: close
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = function()
    local telescope = require("telescope")
    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-q>"] = "close",
            ["<C-d>"] = "delete_buffer",
          },
          n = {
            ["<C-q>"] = "close",
            ["<C-d>"] = "delete_buffer",
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,  -- override the file sorter
          case_mode = "smart_case",
        },
      },
    }
    telescope.load_extension("fzf")
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    { "<C-p>", "<cmd>Telescope find_files<cr>" },
    { "<leader>a", "<cmd>Telescope live_grep<cr>" },
    { "<leader>b", "<cmd>Telescope buffers<cr>" },
  },
}
