-- Keys:
-- <Tab>: Accept suggestion
-- <C-K>, <C-H>: Next, Previous suggestion
--  <leader>ce: Enable copilot (enables automatically on InsertEnter)
--  <leader>cd: Disable copilot
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<Tab>",
        next = "<C-K>",
        prev = "<C-H>",
      }
    },
  },
  keys = {
    { "<leader>ce", ":Copilot enable<CR>" },
    { "<leader>cd", ":Copilot disable<CR>" },
  },
}
