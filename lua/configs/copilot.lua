local copilot_ok, copilot = pcall(require, "copilot")
if not copilot_ok then
  return
end

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

-- copilot-cmp setup
local copilot_cmp_ok, copilot_cmp = pcall(require, "copilot_cmp")
if copilot_cmp_ok then
  copilot_cmp.setup()
end

-- CopilotChat setup
local chat_ok, chat = pcall(require, "CopilotChat")
if not chat_ok then
  return
end

chat.setup({
  debug = false,
  window = {
    layout = 'vertical',
    width = 0.4,
  },
})

-- Keymaps
local map = vim.keymap.set

-- Toggle chat
map({ "n", "v" }, "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })

-- Quick actions
map({ "n", "v" }, "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "Explain code" })
map({ "n", "v" }, "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Generate tests" })
map({ "n", "v" }, "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "Fix code" })
map({ "n", "v" }, "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "Optimize code" })
map({ "n", "v" }, "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "Generate docs" })
map({ "n", "v" }, "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Review code" })

-- Custom prompt
map({ "n", "v" }, "<leader>cp", function()
  local input = vim.fn.input("Ask Copilot: ")
  if input ~= "" then
    vim.cmd("CopilotChat " .. input)
  end
end, { desc = "Ask Copilot (prompt)" })

-- Quick chat with visual selection
map("v", "<leader>cq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    chat.ask(input, { selection = require("CopilotChat.select").visual })
  end
end, { desc = "Quick chat with selection" })
