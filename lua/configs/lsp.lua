local cmp_nvim_lsp_ok, _ = pcall(require, "cmp_nvim_lsp")
local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local efm_ls_ok, efm_ls_defaults = pcall(require, "efmls-configs.defaults")
if not (
      cmp_nvim_lsp_ok
      or mason_ok
      or mason_lsp_ok
      or efm_ls_ok
    ) then
  return
end

local efm_languages = efm_ls_defaults.languages()
efm_languages = vim.tbl_extend('force', efm_languages, {
  sh = {
    require('efmls-configs.linters.shellcheck'),
    require('efmls-configs.formatters.shfmt'),
  },
  zsh = {
    require('efmls-configs.formatters.shfmt'),
  },
})

vim.lsp.config(
"*", {
    flags = {
      debounce_text_changes = 150,
    },
  }
)

vim.lsp.config.clangd = {
  filetypes = { "c", "cpp", "objc", "objcpp", "ino" },
}

vim.lsp.config.emmet_ls = {
  default_config = {
    cmd = { "ls_emmet", "--stdio" },
    filetypes = { "html", "typescriptreact", "javascriptreact", "typescript", "javascript", "css", "sass", "scss",
    "less",
    "ejs" },
    root_dir = function(_)
      return vim.uv.cwd()
    end,
    settings = {},
  },
}

vim.lsp.config.lua_ls = {
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

vim.lsp.config.ltex = {
  settings = {
    ltex = {
      language = "en",
      disabledRules = { ["en-GB"] = { "OXFORD_SPELLING_NOUNS" } },
    }
  }
}

vim.lsp.config.efm = {
  filetypes = vim.tbl_keys(efm_languages),
  settings = {
    rootMarkers = { ".git/" },
    languages = efm_languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

mason_lsp.setup {}
