local augroup = require("utils.augroup")
local function keys(key, action)
  vim.keymap.set("n", key, action, { buffer = true, silent = true })
end

return {
  {
    "lambdalisue/fern.vim",
    keys = {
      { "sf", "<Cmd>Fern .<CR>" },
      { "<Space>f", "<Cmd>Fern . -reveal=% -drawer -toggle -width=40<CR><CR>" },
    },
    dependencies = {
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/nerdfont.vim",
      "LumaKernel/fern-mapping-reload-all.vim",
      "yuki-yano/fern-preview.vim",
    },
    config = function()
      vim.g["fern#renderer"] = "nerdfont"
      vim.g["fern#renderer#nerdfont#indent_markers"] = 1

      vim.api.nvim_create_autocmd("FileType", {
        group = augroup.userftkeymap,
        pattern = "fern",
        callback = function()
          keys("y", "<Plug>(fern-action-clipboard-copy)")
          keys("m", "<Plug>(fern-action-clipboard-move)")
          keys("P", "<Plug>(fern-action-clipboard-paste)")
          keys("D", "<Plug>(fern-action-remove)")
          keys("r", "<Plug>(fern-action-rename:bottom)")
          keys("x", "<Plug>(fern-action-mark)")
          keys("p", "<Plug>(fern-action-preview:toggle)")
          keys("<C-n>", "<Plug>(fern-action-preview:scroll:down:half)")
          keys("<C-p>", "<Plug>(fern-action-preview:scroll:up:half)")
          keys("<C-r>", "<Plug>(fern-action-reload:all)")
          keys("q", "<Cmd>Fern . -reveal=% -drawer -toggle -width=40<CR>")
        end,
      })
    end,
  },
}
