return {
  "luisiacc/gruvbox-baby",
  lazy = false,
  priority = 1000, -- Load before all other plugins
  config = function()
    -- Load the colorscheme
    vim.cmd.colorscheme("gruvbox-baby")
  end,
}
