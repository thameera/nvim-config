-- source: https://github.com/wbthomason/packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Autocommand that reloads neovim whenever you save this file
-- Note: This doesn't seem to work for some reason
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Colorschemes
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use "luisiacc/gruvbox-baby"

  -- Library used by some plugins
  use "nvim-lua/plenary.nvim"

  -- Highlight interesting words
  -- <Leader>k to mark a word
  -- n and N to navigate
  -- <Leader>K to clear all words
  use "Mr-LLLLL/interestingwords.nvim"

  -- vim-surround
  use "tpope/vim-surround"

  -- comment
  -- gcc to toggle single-line comment
  -- gbc to toggle block comment
  -- gc and gb are opleaders and for visual mode
  use "numToStr/Comment.nvim"

  -- nvim-tree
  -- g? to see help
  -- <Leader>e to toggle
  -- <Enter> to open file
  -- <C-x> or <C-v> to open file in horizontal or vertical split
  -- <Tab> to open preview
  -- a to create
  -- c to copy, p to paste, d to delete, and r to rename
  -- R to refresh
  -- P to go to parent
  use "nvim-tree/nvim-tree.lua"

  -- dev icons
  use "nvim-tree/nvim-web-devicons"

  -- statusline'
  use "nvim-lualine/lualine.nvim"

  -- telescope
  -- <Leader>ff or <C-p> to find files
  -- <Leader>a to search for a text (live grep)
  -- <Leader>fc to search for string under cursor
  -- <Leader>fh to for help tags
  -- <C-k> and <C-j> in results to go up/down
  -- <C-x>, <C-v> and <C-t> in results to open file in h split, v split or new tab
  -- <C-c> to close telescope in insert mode
  -- Buffers:
  -- <Leader>b to see open buffers
  -- <C-d> to delete buffer
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope.nvim", tag = "0.1.x" }

  -- autocompletion
  -- <CR> to accept completion
  -- <C-e> to abort completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  -- snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- copilot
  -- `:Copilot status` to see status
  -- `:Copilot enable/disable` to toggle
  use "github/copilot.vim"

  -- vim-obsession
  -- :Obsess - start saving the session
  -- vim -S Session.vim - restore the session
  -- :Obsess! - stop saving the session
  use "tpope/vim-obsession"

  -- lsp
  -- managing & installing lsp servers 
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  -- configuring lsp servers
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for nvim-lsp
  use { "glepnir/lspsaga.nvim", branch = "main" } -- lsp ui
  use "jose-elias-alvarez/typescript.nvim" -- enhanced typescript support
  use "onsails/lspkind-nvim" -- pictograms for lsp completion items

  -- treesitter configuration
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }

  -- auto-closing
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- go
  use "ray-x/go.nvim"
  use "ray-x/guihua.lua" -- for floating windows

  -- emmet
  -- html:5 then <C-y>, to expand
  -- More at https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
  use "mattn/emmet-vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
