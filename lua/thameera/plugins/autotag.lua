local autotag_setup, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_setup then
  return
end

-- configure autopairs
autotag.setup({
  opts = {
    enable_close = true, -- enable auto close tag
    enable_rename = true, -- enable auto rename tag
    enable_close_on_slash = true, -- enable auto close tag on /
  }
})
