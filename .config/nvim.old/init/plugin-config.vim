" airline
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}

" git
let g:rainbow_active = 1

" vimdoc-ja
set helplang=ja

" neoterm config
let g:neoterm_default_mod = 'vertical belowright'
let g:neoterm_autoinsert = 1
let g:neoterm_size = 80

" fern.vim show icon
let g:fern#renderer = 'nerdfont'

" quickfix
augroup MyGroup
	autocmd User AsyncRunStart call asyncrun#quickfix_toggle(20, 1)
augroup END

" sonictemplete
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/sonictemplate'

" FixCursorHold
let g:cursorhold_updatetime = 100

lua <<EOF
-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
}
-- nvim-ts-rainbow
require'nvim-treesitter.configs'.setup {
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	}
}
-- nvim-lspconfig
local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<C-h>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', '<C-l>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls', 'clangd', 'cmake' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		capabilities = capabilities,
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
-- nvim-cmp
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['ge'] = cmp.mapping.close()
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

-- lspkind
  local lspkind = require('lspkind')
  cmp.setup {
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    }
  }

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
-- trouble
require("trouble").setup {
		height = 20,
	}
EOF

