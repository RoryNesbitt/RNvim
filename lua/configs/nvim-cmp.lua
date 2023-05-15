vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Setup nvim-cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then
  return
end

cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = false }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }, {
  },
  formatting = {
    format = lspkind.cmp_format { with_text = true, maxwidth = 50 },
  },
  experimental = {
    ghost_text = true,
  },
}

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources {
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = "path" }
  }, {
    { name = "cmdline" }
  }
})

-- -- Setup lspconfig.
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["<YOUR_LSP_SERVER>"].setup {
-- capabilities = capabilities
-- }

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
