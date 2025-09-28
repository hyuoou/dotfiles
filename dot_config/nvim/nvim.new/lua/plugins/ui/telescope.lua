return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release',
    },
    cmd = { "Telescope" },
    keys = {
      { ";t", "<Cmd>Telescope<CR>" },
      { "ff", "<Cmd>Telescope find_files<CR>" },
      { ";o", "<Cmd>Telescope oldfiles<CR>" },
      { ";d", "<Cmd>Telescope diagnostics<CR>" },
      { ";b", "<Cmd>Telescope buffers<CR>" },
      { ";g", "<Cmd>Telescope live_grep<CR>" },
      { ";h", "<Cmd>Telescope help_tags<CR>" },
      { ";;", "<Cmd>Telescope command_history<CR>" },
      { ";c", "<Cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<CR>" },
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          sorting_strategy = "ascending",
          prompt_prefix = "  ",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
              results_width = 0.8,
            },
          },
          mappings = {
            i = {
              ["jj"] = { "<Esc><Right>", type = "command" },
              ["<Esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.preview_scrolling_down,
              ["<C-p>"] = actions.preview_scrolling_up,
            },
            n = {
              ["q"] = actions.close,
              ["x"] = actions.toggle_selection + actions.move_selection_worse,
              ["*"] = actions.toggle_all,
              ["h"] = actions.results_scrolling_left,
              ["l"] = actions.results_scrolling_right,
              ["H"] = actions.preview_scrolling_left,
              ["L"] = actions.preview_scrolling_right,
              ["<C-n>"] = actions.preview_scrolling_down,
              ["<C-p>"] = actions.preview_scrolling_up,
            },
          },
        },
        preview = {
          timeout = 3000,
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
    end,
  },
}
