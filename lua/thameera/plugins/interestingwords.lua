-- interestingwords
-- <Leader>k to mark a word
-- n and N to navigate
-- <Leader>K to clear all words
-- <Leader>m to search word under cursor
return {
  "Mr-LLLLL/interestingwords.nvim",
  opts = {
    search_count = true,
    navigation = true,
    search_key = "<leader>m",
    cancel_search_key = "<leader>M",
    color_key = "<leader>k",
    cancel_color_key = "<leader>K",
  }
}
