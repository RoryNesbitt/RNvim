local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local function cmd(command)
  return table.concat({ '<cmd>', command, '<CR>' })
end

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Add keymaps
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "<leader>li", cmd "LspInfo", { buffer = 0, silent = true, desc = "LSP Info" })
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0}) -- This seems to already exist somewhere
  vim.keymap.set("n", "gd", "gdzz", { buffer = 0, remap = true, desc = "Go to Definition" }) -- Add zz after regular gd command
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Go to Declaration" })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "Go to Implementation" })
  vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { buffer = 0, desc = "Next" })
  vim.keymap.set("n", "<leader>lN", vim.diagnostic.goto_prev, { buffer = 0, desc = "Previous" })
  vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { buffer = 0, desc = "Previous" })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = 0, desc = "Code Actions" })
  vim.keymap.set("n", "<leader>ll", cmd "Telescope diagnostics", { buffer = 0, silent = true, desc = "Show Diagnostics" })
  vim.keymap.set("n", "<leader>lr", cmd "Telescope lsp_references", { buffer = 0, silent = true, desc = "Show References" })
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0, desc = "Rename Object" })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  "ansiblels",
  "bashls",
  "cssls",
  "dockerls",
  "html",
  "jedi_language_server",
  "jsonls",
  "kotlin_language_server",
  "lemminx",
  "tailwindcss",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "ino" },
}

lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  default_config = {
    cmd = { "ls_emmet", "--stdio" },
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'typescript', 'javascript', 'css', 'sass', 'scss', 'less',
      'ejs' },
    root_dir = function(_)
      return vim.loop.cwd()
    end,
    settings = {},
  },
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
