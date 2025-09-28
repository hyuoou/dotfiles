return {
  {
    "yuki-yano/fuzzy-motion.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "utubo/vim-auto-hide-cmdline",
    },
    keys = {
      { "<Space><Space>", "<Plug>(ahc)<Cmd>FuzzyMotion<CR>" },
    },
  },
}
