local augroup = require("utils/augroup")

return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-p>", "<Cmd>ToggleTerm size=25 direction=horizontal<CR>" },
      { "<C-f>", "<Cmd>ToggleTerm direction=float<CR>" },
    },
    config = function()
      require("toggleterm").setup({
        size = 25,
        highlights = {
          FloatBorder = {
            guifg = "#2ac3de",
          },
        }
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = augroup.userftkeymap,
        pattern = "toggleterm",
        callback = function()
          vim.keymap.set({ "n", "t" }, "<C-p>", "<Cmd>ToggleTerm<CR>", { noremap = true, buffer = true, silent = true })
          vim.keymap.set("t", "<Esc>", "<Cmd>ToggleTerm<CR>", { noremap = true, buffer = true, silent = true })
        end,
      })
    end,
  },
}
