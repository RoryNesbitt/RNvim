local dap_ok, dap = pcall(require, "dap")
if not dap_ok then return end

local dapui_ok, dapui = pcall(require, "dapui")
local mason_dap_ok, mason_dap = pcall(require, "mason-nvim-dap")

local debug_keymaps = {}

local function restore_keymaps()
  for _, m in ipairs(debug_keymaps) do
    pcall(function()
      if m.rhs and m.rhs ~= "" then
        vim.keymap.set(m.mode, m.lhs, m.rhs, m.opts)
      else
        pcall(vim.keymap.del, m.mode, m.lhs, { buffer = m.buffer })
      end
    end)
  end
  debug_keymaps = {}
end

local function set_debug_keymaps()
  debug_keymaps = {}

  local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    local bufnr = vim.api.nvim_get_current_buf()

    local existing = vim.fn.maparg(lhs, mode, false, true)
    if existing and next(existing) then
      table.insert(debug_keymaps, {
        mode = mode,
        lhs = lhs,
        rhs = existing.rhs or "",
        opts = {
          noremap = existing.noremap == 1,
          silent = existing.silent == 1,
          expr = existing.expr == 1,
          nowait = existing.nowait == 1,
          buffer = bufnr,
        },
      })
    else
      table.insert(debug_keymaps, { mode = mode, lhs = lhs, buffer = bufnr })
    end

    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { buffer = bufnr }))
  end

  map("n", "d", function() dap.continue() end, { desc = "DAP Continue" })
  map("n", "N", function() dap.step_over() end, { desc = "DAP Step Over" })
  map("n", "n", function() dap.step_into() end, { desc = "DAP Step Into" })
  map("n", "O", function() dap.step_out() end, { desc = "DAP Step Out" })
  map("n", "R", function() dap.restart_frame() end, { desc = "DAP Restart Frame" })

  map("n", "b", function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
  map("n", "B", function() dap.set_breakpoint(vim.fn.input("Condition: ")) end, { desc = "Conditional Breakpoint" })
  map("n", "L", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log message: ")) end, { desc = "Log Point" })
  map("n", "r", function() dap.repl.open() end, { desc = "Open REPL" })
  map("n", "u", function() if dapui_ok then dapui.toggle() end end, { desc = "Toggle UI" })
  map("v", "e", function() if dapui_ok then dapui.eval() end end, { desc = "Eval" })

  map("n", "q", function()
    dap.terminate()
    vim.defer_fn(function()
      if dapui_ok then dapui.close() end
      restore_keymaps()
    end, 200)
  end, { desc = "Terminate Debug Session" })
end

-- dap-ui setup (no auto-closing)
if dapui_ok then
  dapui.setup()

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    set_debug_keymaps()
  end
end

-- mason-nvim-dap
if mason_dap_ok then
  mason_dap.setup({
    ensure_installed = {},
    automatic_installation = false,
    handlers = {},
  })
end

-- Python configuration
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python"
      end
    end,
    stopOnEntry = true,
  },
}

-- Start debug session (paused at first line)
vim.keymap.set("n", "<leader>d", function()
  dap.continue()
end, { desc = "Start Debug Session (paused)" })
