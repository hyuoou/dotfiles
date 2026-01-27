return {
  {
    "potamides/pantran.nvim",
    cmd = { "Pantran" },
    event = "VeryLazy",
    config = function()
      local opts = { noremap = true, silent = true, expr = true }
      local pantran = require("pantran")
      vim.keymap.set("n", "<C-t>", pantran.motion_translate, opts)
      vim.keymap.set("v", "<C-t>", pantran.motion_translate, opts)

      local function get_secret_linux(service, purpose)
        local cmd = string.format("secret-tool lookup service %s purpose %s", service, purpose)
        local handle = io.popen(cmd)
        if not handle then
          return ""
        end

        local out = handle:read("*a")
        handle:close()

        return out and out:gsub("%s+$", "")
      end

      local function get_secret_macos(account, service)
        local cmd = string.format("security find-generic-password -a %s -s %s -w", account, service)
        local handle = io.popen(cmd)
        if not handle then
          return ""
        end

        local out = handle:read("*a")
        handle:close()

        return out and out:gsub("%s+$", "")
      end

      local function get_deepl_key()
        local sys = vim.uv.os_uname().sysname

        if sys == "Linux" then
          -- gnome-keyring
          return get_secret_linux("deepl", "api-key")
        elseif sys == "Darwin" then
          -- macOS keychain
          return get_secret_macos("deepl", "deepl-api-key")
        else
          return ""
        end
      end

      pantran.setup({
        default_engine = "google",
        engines = {
          google = {
            fallback = {
              default_source = "auto",
              default_target = "ja",
            },
          },
          deepl = {
            default_target = "JA",
            auth_key = get_deepl_key(),
            free_api = true,
          },
        },
      })
    end,
  },
}
